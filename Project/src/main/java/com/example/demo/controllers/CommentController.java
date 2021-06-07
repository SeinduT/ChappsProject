package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.models.Comment;
import com.example.demo.services.AudioService;
import com.example.demo.services.CommentService;
import com.example.demo.services.UserService;

@Controller
@RequestMapping("/{id}/comments")
public class CommentController {
	@Autowired
	private CommentService cServ;
	
	@Autowired
	private UserService uServ; 
	
	@Autowired
	private AudioService aServ; 
	
	
		
	@GetMapping("")
	public String reviewComments(@PathVariable("id")Long id, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user_id");
		viewModel.addAttribute("comments", this.cServ.getComments());
		viewModel.addAttribute("user", this.uServ.findUserById(userId));
		viewModel.addAttribute("audio", this.aServ.findById(id));
		
		return "commentview.jsp";
	}
	
	@GetMapping("/new")
	public String newComment(@ModelAttribute("comment") Comment comment, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user_id");
		viewModel.addAttribute("user_id", userId);
		return "show.jsp";
	}
	
	@PostMapping("/new")
	public String create(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, HttpSession session, Model viewModel) {
		if(result.hasErrors()) {
			Long userId = (Long)session.getAttribute("user_id");
			viewModel.addAttribute("user_id", userId);
			return "show.jsp";
		}
		this.cServ.create(comment);
		return "show.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String updateComment(@PathVariable("id") Long id, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user_id");
		Comment comment = this.cServ.findById(id);
		if(userId == null) {
			return "redirect:/"; 
		}
		if(comment == null || comment.getCommentCreator().getId().equals(userId)) {
			return "redirect:/main"; 
		}
		
		viewModel.addAttribute("comment", comment);
		viewModel.addAttribute("user_id", userId);
		return "show.jsp"; 
	}
	
	@PostMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, @PathVariable("id")Long id, HttpSession session, Model viewModel) {
		if(result.hasErrors()) {
			Long userId = (Long)session.getAttribute("user_id");
			viewModel.addAttribute("comment", comment);
			viewModel.addAttribute("user_id", userId);
			return "show.jsp"; 
			
		}
		this.cServ.updateComment(comment);
		return "redirect:/"; 
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		this.cServ.deleteComment(id);
		return "redirect:/";
		}
}