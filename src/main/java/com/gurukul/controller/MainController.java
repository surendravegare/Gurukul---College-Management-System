package com.gurukul.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gurukul.model.User;
import com.gurukul.service.NoticeService;
import com.gurukul.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	UserService userService;

	// ── Home Page ──
	@GetMapping("/")
	public String homePage() {
		return "index";
	}

	// ── Login Page ──
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	@PostMapping("/login")
	public String loginSubmit(@RequestParam String email, @RequestParam String password, HttpSession session,
			Model model) {

		Optional<User> userOpt = userService.findByEmail(email);

		if (userOpt.isEmpty() || !userOpt.get().getPassword().equals(password)) {
			model.addAttribute("error", "Invalid email or password!");
			return "login";
		}

		User user = userOpt.get();

		session.setAttribute("loggedUser", user);
		session.setAttribute("userName", user.getName());
		session.setAttribute("userRole", user.getRole().toString());

		switch (user.getRole()) {
		case ADMIN:
			return "redirect:/admin/dashboard";
		case TEACHER:
			return "redirect:/teacher/dashboard";
		case STUDENT:
			return "redirect:/student/dashboard";
		default:
			return "redirect:/login";
		}

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}