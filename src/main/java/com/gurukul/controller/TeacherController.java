package com.gurukul.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gurukul.model.Marks;
import com.gurukul.model.Student;
import com.gurukul.model.Teacher;
import com.gurukul.model.User;
import com.gurukul.service.CourseService;
import com.gurukul.service.MarksService;
import com.gurukul.service.NoticeService;
import com.gurukul.service.StudentService;
import com.gurukul.service.TeacherService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	TeacherService teacherService;
	@Autowired
	StudentService studentService;
	@Autowired
	MarksService marksService;
	@Autowired
	CourseService courseService;

	private boolean isTeacher(HttpSession session) {
		String role = (String) session.getAttribute("userRole");
		return role != null && role.equals("TEACHER");
	}

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if (!isTeacher(session))
			return "redirect:/login";
		model.addAttribute("userName", session.getAttribute("userName"));
		return "teacher/dashboard";
	}

	@GetMapping("/students")
	public String showStudents(HttpSession session, Model model) {
		if (!isTeacher(session))
			return "redirect:/login";

		User loggedUser = (User) session.getAttribute("loggedUser");

		Teacher teacher = teacherService.getTeacherByUser(loggedUser);

		List<Student> students = studentService.getStudentsByCourse(teacher.getCourse());

		model.addAttribute("students", students);
		model.addAttribute("userName", session.getAttribute("userName"));
		return "teacher/students";
	}

	@GetMapping("/marks/add")
	public String showAddMarks(HttpSession session, Model model) {
		if (!isTeacher(session))
			return "redirect:/login";

		User loggedUser = (User) session.getAttribute("loggedUser");
		Teacher teacher = teacherService.getTeacherByUser(loggedUser);

		List<Student> students = studentService.getStudentsByCourse(teacher.getCourse());

		model.addAttribute("students", students);
		model.addAttribute("userName", session.getAttribute("userName"));
		return "teacher/add-marks";
	}

	@PostMapping("/marks/save")
	public String saveMarks(@RequestParam Long studentId, @RequestParam String subject, @RequestParam int marks,
			HttpSession session) {
		if (!isTeacher(session))
			return "redirect:/login";

		User loggedUser = (User) session.getAttribute("loggedUser");

		Teacher teacher = teacherService.getTeacherByUser(loggedUser);
		Student student = studentService.getStudentById(studentId);

		Marks m = new Marks();
		m.setStudent(student);
		m.setTeacher(teacher);
		m.setSubject(subject);
		m.setMarks(marks);
		marksService.saveMarks(m);

		return "redirect:/teacher/students";
	}

	private boolean isStudent(HttpSession session) {
		return false;
	}

	@GetMapping("/student/{id}")
	public String viewStudent(@PathVariable Long id, HttpSession session, Model model) {
		if (!isTeacher(session))
			return "redirect:/login";
		Student student = studentService.getStudentById(id);
		List<Marks> marks = marksService.getMarksByStudent(student);
		model.addAttribute("student", student);
		model.addAttribute("marks", marks);
		model.addAttribute("userName", session.getAttribute("userName"));
		return "teacher/student-detail";
	}

	@GetMapping("/marks")
	public String viewMarks(HttpSession session, Model model) {
		if (!isTeacher(session))
			return "redirect:/login";

		User loggedUser = (User) session.getAttribute("loggedUser");
		Teacher teacher = teacherService.getTeacherByUser(loggedUser);
		List<Student> students = studentService.getStudentsByCourse(teacher.getCourse());

		Map<Student, List<Marks>> studentMarksMap = new LinkedHashMap<>();
		for (Student s : students) {
			studentMarksMap.put(s, marksService.getMarksByStudent(s));
		}

		model.addAttribute("studentMarksMap", studentMarksMap);
		model.addAttribute("userName", session.getAttribute("userName"));
		return "teacher/view-marks";
	}

	@Autowired
	NoticeService noticeService;

	@GetMapping("/notices")
	public String notices(HttpSession session, Model model) {
		if (!isTeacher(session))
			return "redirect:/login";
		model.addAttribute("notices", noticeService.getAllNotices());
		model.addAttribute("userName", session.getAttribute("userName"));
		return "teacher/notices";
	}
}