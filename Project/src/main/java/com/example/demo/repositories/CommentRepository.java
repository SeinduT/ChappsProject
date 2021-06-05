package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.models.Audio;
import com.example.demo.models.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, String> {
	List<Comment> findByAudio(Audio audio);
}
