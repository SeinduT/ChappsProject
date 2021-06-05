package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.models.Audio;
import com.example.demo.models.Comment;
import com.example.demo.models.User;
import com.example.demo.repositories.CommentRepository;

@Service
public class CommentService {
	@Autowired
	private CommentRepository cRepo;
	
	public Comment createComment(Comment comment) {
		return this.cRepo.save(comment);
	}
	
	public List<Comment> getCommentByAudio(Audio audio) {
		return this.cRepo.findByAudio(audio);
	}
	
	/*
	 * public void comment(User user, Audio audio, String details) {
	 * this.cRepo.save(new Comment(user, audio, details)); }
	 */
	
	//update
	public Comment updateComment(Comment comment) {
		return this.cRepo.save(comment);
	}
}
