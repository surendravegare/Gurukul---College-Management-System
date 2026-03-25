package com.gurukul.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gurukul.model.Course;
import com.gurukul.model.Notice;
import com.gurukul.model.Student;
import com.gurukul.model.Teacher;
import com.gurukul.model.User;
import com.gurukul.model.User.Role;
import com.gurukul.service.CourseService;
import com.gurukul.service.MarksService;
import com.gurukul.service.NoticeService;
import com.gurukul.service.StudentService;
import com.gurukul.service.TeacherService;
import com.gurukul.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	StudentService studentService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	CourseService courseService;
	@Autowired
	UserService userService;

	private boolean isAdmin(HttpSession session) {
		String role = (String) session.getAttribute("userRole");
		return role != null && role.equals("ADMIN");
	}

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";

		model.addAttribute("totalStudents", studentService.getAllStudents().size());
		model.addAttribute("totalTeachers", teacherService.getAllTeachers().size());
		model.addAttribute("totalCourses", courseService.getAllCourses().size());
		model.addAttribute("totalNotices", noticeService.getAllNotices().size());
		model.addAttribute("userName", session.getAttribute("userName"));
		return "admin/dashboard";
	}

	// STUDENT CRUD

	@GetMapping("/students")
	public String students(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("students", studentService.getAllStudents());
		return "admin/students";
	}

	@GetMapping("/students/add")
	public String addStudentForm(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("student", new Student());
		model.addAttribute("courses", courseService.getAllCourses());
		return "admin/add-student";
	}

	@PostMapping("/students/save")
	public String saveStudent(@RequestParam String name, @RequestParam String email, @RequestParam String phone,
			@RequestParam String password, @RequestParam Long courseId, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";

		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setRole(Role.STUDENT);
		userService.saveUser(user);

		Course course = courseService.getCourseById(courseId);

		Student student = new Student();
		student.setName(name);
		student.setEmail(email);
		student.setPhone(phone);
		student.setCourse(course);
		student.setUser(user);
		studentService.saveStudent(student);

		return "redirect:/admin/students";
	}

	@GetMapping("/students/edit/{id}")
	public String editStudentForm(@PathVariable Long id, HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("student", studentService.getStudentById(id));
		model.addAttribute("courses", courseService.getAllCourses());
		return "admin/edit-student";
	}

	@PostMapping("/students/update")
	public String updateStudent(@RequestParam Long id, @RequestParam String name, @RequestParam String email,
			@RequestParam String phone, @RequestParam Long courseId, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";

		Student student = studentService.getStudentById(id);
		student.setName(name);
		student.setEmail(email);
		student.setPhone(phone);
		student.setCourse(courseService.getCourseById(courseId));
		studentService.saveStudent(student);

		User user = student.getUser();
		if (user != null) {
			user.setName(name);
			user.setEmail(email);
			userService.saveUser(user);
		}

		return "redirect:/admin/students";
	}

	@GetMapping("/students/delete/{id}")
	public String deleteStudent(@PathVariable Long id, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";

		Student student = studentService.getStudentById(id);

		if (student != null) {
			Long userId = null;
			if (student.getUser() != null) {
				userId = student.getUser().getId();
			}

			MarksService.deleteMarksByStudent(student);

			studentService.deleteStudent(id);
			if (userId != null) {
				userService.deleteUser(userId);
			}
		}

		return "redirect:/admin/students";
	}

	// TEACHER CRUD

	@GetMapping("/teachers")
	public String teachers(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("teachers", teacherService.getAllTeachers());
		return "admin/teachers";
	}

	@GetMapping("/teachers/add")
	public String addTeacherForm(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("teacher", new Teacher());
		model.addAttribute("courses", courseService.getAllCourses());
		return "admin/add-teacher";
	}

	@PostMapping("/teachers/save")
	public String saveTeacher(@ModelAttribute Teacher teacher, @RequestParam String email,
			@RequestParam String password, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";

		User user = new User();
		user.setName(teacher.getName());
		user.setEmail(email);
		user.setPassword(password);
		user.setRole(User.Role.TEACHER);
		userService.saveUser(user);

		teacher.setEmail(email);
		teacher.setUser(user);
		teacherService.saveTeacher(teacher);

		return "redirect:/admin/teachers";
	}

	@GetMapping("/teachers/edit/{id}")
	public String editTeacherForm(@PathVariable Long id, HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("teacher", teacherService.getTeacherById(id));
		model.addAttribute("courses", courseService.getAllCourses());
		return "admin/edit-teacher";
	}

	@PostMapping("/teachers/update")
	public String updateTeacher(@RequestParam Long id, @RequestParam String name, @RequestParam String email,
			@RequestParam String phone, @RequestParam Long courseId, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";

		Teacher teacher = teacherService.getTeacherById(id);
		teacher.setName(name);
		teacher.setEmail(email);
		teacher.setPhone(phone);
		teacher.setCourse(courseService.getCourseById(courseId));
		teacherService.saveTeacher(teacher);

		User user = teacher.getUser();
		if (user != null) {
			user.setName(name);
			user.setEmail(email);
			userService.saveUser(user);
		}

		return "redirect:/admin/teachers";
	}

	@GetMapping("/teachers/delete/{id}")
	public String deleteTeacher(@PathVariable Long id, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";

		Teacher teacher = teacherService.getTeacherById(id);
		User user = teacher.getUser();

		teacherService.deleteTeacher(id); // pehle teacher delete karo

		if (user != null) {
			userService.deleteUser(user.getId()); // phir user delete karo
		}

		return "redirect:/admin/teachers";
	}

	// COURSE CRUD

	@GetMapping("/courses")
	public String courses(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("courses", courseService.getAllCourses());
		return "admin/courses";
	}

	@GetMapping("/courses/add")
	public String addCourseForm(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("course", new Course());
		return "admin/add-course";
	}

	@PostMapping("/courses/save")
	public String saveCourse(@RequestParam String courseName, HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";

		List<Course> existing = courseService.getAllCourses();
		for (Course c : existing) {
			if (c.getCourseName().equalsIgnoreCase(courseName.trim())) {
				model.addAttribute("error", "Course '" + courseName + "' already exists!");
				model.addAttribute("courses", existing);
				model.addAttribute("userName", session.getAttribute("userName"));
				return "admin/add-course";
			}
		}

		Course course = new Course();
		course.setCourseName(courseName);
		courseService.saveCourse(course);
		return "redirect:/admin/courses";
	}

	@GetMapping("/courses/delete/{id}")
	public String deleteCourse(@PathVariable Long id, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";
		courseService.deleteCourse(id);
		return "redirect:/admin/courses";
	}

	@Autowired
	NoticeService noticeService;

	@GetMapping("/notices")
	public String notices(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("notices", noticeService.getAllNotices());
		model.addAttribute("userName", session.getAttribute("userName"));
		return "admin/notices";
	}

	@GetMapping("/notices/add")
	public String addNotice(HttpSession session, Model model) {
		if (!isAdmin(session))
			return "redirect:/login";
		model.addAttribute("userName", session.getAttribute("userName"));
		return "admin/add-notice";
	}

	@PostMapping("/notices/save")
	public String saveNotice(@RequestParam String title, @RequestParam String message, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setMessage(message);
		noticeService.saveNotice(notice);
		return "redirect:/admin/notices";
	}

	@GetMapping("/notices/delete/{id}")
	public String deleteNotice(@PathVariable Long id, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/login";
		noticeService.deleteNotice(id);
		return "redirect:/admin/notices";
	}
}