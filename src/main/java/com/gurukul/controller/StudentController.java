package com.gurukul.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gurukul.model.Student;
import com.gurukul.model.User;
import com.gurukul.repository.StudentRepository;
import com.gurukul.service.MarksService;
import com.gurukul.service.NoticeService;
import com.gurukul.service.StudentService;
import com.gurukul.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	StudentRepository studentRepository;

	@Autowired
	StudentService studentService;
	@Autowired
	MarksService marksService;
	@Autowired
	UserService userService;
	@Autowired
	NoticeService noticeService;

	private boolean isStudent(HttpSession session) {
		String role = (String) session.getAttribute("userRole");
		return role != null && role.equals("STUDENT");
	}

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if (!isStudent(session))
			return "redirect:/login";

		User loggedUser = (User) session.getAttribute("loggedUser");
		model.addAttribute("userName", session.getAttribute("userName"));
		return "student/dashboard";
	}

	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {
		if (!isStudent(session))
			return "redirect:/login";

		User loggedUser = (User) session.getAttribute("loggedUser");

		Student student = studentRepository.findByUser(loggedUser);

		model.addAttribute("student", student);
		model.addAttribute("userName", session.getAttribute("userName"));
		return "student/profile";
	}

	@GetMapping("/marks")
	public String marks(HttpSession session, Model model) {
		if (!isStudent(session))
			return "redirect:/login";
		User loggedUser = (User) session.getAttribute("loggedUser");
		List<Student> students = studentService.getAllStudents();
		for (Student s : students) {
			if (s.getUser() != null && s.getUser().getId().equals(loggedUser.getId())) {
				model.addAttribute("marks", marksService.getMarksByStudent(s));
				break;
			}
		}
		model.addAttribute("userName", session.getAttribute("userName"));
		return "student/marks";
	}

	@GetMapping("/notices")
	public String notices(HttpSession session, Model model) {
		if (!isStudent(session))
			return "redirect:/login";
		model.addAttribute("notices", noticeService.getAllNotices());
		model.addAttribute("userName", session.getAttribute("userName"));
		return "student/notices";
	}
}