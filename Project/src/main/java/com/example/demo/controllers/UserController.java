package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.models.User;
import com.example.demo.services.UserService;
import com.example.demo.validators.UserValidator;

@Controller
public class UserController {
	@Autowired
	private UserService uServ;
	@Autowired
	private UserValidator uValid;
	
	@GetMapping("/")
	public String index(@ModelAttribute("user") User user) {
		return "login.jsp";
	}
	
	@GetMapping("/register")
	public String registerUser(@ModelAttribute("user") User user) {
		return "registration.jsp";
	}
	
	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		uValid.validate(user, result);
		if(result.hasErrors()) {
			return "registration.jsp";
		}
		
		User newUser = this.uServ.registerUser(user);
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/events";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("loginEmail") String email, @RequestParam("loginPassword") String password, RedirectAttributes rAttrs, HttpSession session) {
		if(!this.uServ.authenticateUser(email, password)) {
			rAttrs.addFlashAttribute("loginError", "Invalid Credentials");
			return "redirect:/";
		}
		
		User user1 = this.uServ.findUserByEmail(email);
		session.setAttribute("user_id", user1.getId());
		return "redirect:/events";
	}
	
	@GetMapping("/logout")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
