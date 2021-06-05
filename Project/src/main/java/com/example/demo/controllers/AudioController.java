package com.example.demo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.models.Audio;
import com.example.demo.models.User;
import com.example.demo.services.AudioService;
import com.example.demo.services.CommentService;
import com.example.demo.services.UserService;

@Controller
public class AudioController {
    @Autowired
    private AudioService audioService;

    @Autowired
    private UserService userService;
    
    @Autowired
    private CommentService commentService;

    @RequestMapping("/landing")
    public String indexPage() {
        return "index.jsp";
    }

    @RequestMapping("/dashboard")
    public String allSongs(Model model, HttpSession session) {

        List<Audio> lookifyList = this.audioService.audioList();
        if (!lookifyList.isEmpty()) {
            model.addAttribute("songList", lookifyList);

        }
		Long userId = (Long)session.getAttribute("user_id");
		User user = this.userService.findUserById(userId);
		model.addAttribute("user", user);
        return "dashboard.jsp";
    }

    @RequestMapping("/{id}")
    public String allSongsById(@PathVariable("id") long id, Model model, HttpSession session) {
        Audio lookify = this.audioService.findById(id);
        if (lookify != null) {
            model.addAttribute("song", lookify);
        }
		Long userId = (Long)session.getAttribute("user_id");
		User user = this.userService.findUserById(userId);
		model.addAttribute("user", user);
        return "show.jsp";
    }

    @RequestMapping("/song/search")
    public String allSongsByArtist(@RequestParam("artist") String artist, Model model){
        model.addAttribute("songs", audioService.findByArtistName(artist));
        model.addAttribute("artist", artist);
        return "artist.jsp";

    }

    @RequestMapping("/search/topTen")
    public String allTopTen(Model model){
        model.addAttribute("topTen", audioService.findTopTen());
        return "topTen.jsp";

    }


    @RequestMapping("/new")
    public String newSong(@ModelAttribute("lookify") Audio lookify) {
        return "new.jsp";
    }

    @RequestMapping("/newForm")
    public String newFormMapping(@Valid @ModelAttribute("lookify") Audio lookify, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "new.jsp";
        } else {
            this.audioService.createLookify(lookify);
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/delete/{id}")
    public String delteSongsById(@PathVariable("id") long id) {
        this.audioService.delete(id);
        return "redirect:/dashboard";
    }
    
    @RequestMapping("/{id}/comment")
    public String allSongsById(@PathVariable("id") long id, Model model, Comment comment, HttpSession session) {
        Audio lookify = this.audioService.findById(id);
        if (lookify != null) {
            model.addAttribute("song", lookify);
        }
		Long userId = (Long)session.getAttribute("user_id");
		User user = this.userService.findUserById(userId);
		model.addAttribute("user", user);
		this.commentService.createComment(comment);
        return "show.jsp";
    }
    
//	@PostMapping("/comments/{id}")
//	public String Comment(@PathVariable("id") Long id,  Comment comment, Model model, RedirectAttributes redirs, HttpSession session) {
//	Audio lookify = this.audioService.findById(id);
//	Long userId = (Long)session.getAttribute("user_id");
//	User user = this.userService.findUserById(userId);
//	model.addAllAttributes("user", user);
//	if(userId == null) {
//		return "redirect:/"; 
//	}
//	if(comment.equals("")) {
//		redirs.addFlashAttribute("error", "Comment must not be blank.");
//		return "redirect:/events/" + id; 
//	}
//	/*
//	 * Audio audio = this.audioService.findById(id); User user =
//	 * this.userService.findUserById(userId);
//	 */
//	this.commentService.createComment(comment);
//	return "redirect:/events/" + id; 
//	}
}
