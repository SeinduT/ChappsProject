package com.example.demo.controllers;

import com.example.demo.models.Audio;
import com.example.demo.services.AudioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
public class AudioController {
    @Autowired
    private AudioService audioService;

    @RequestMapping("/")
    public String indexPage() {
        return "index.jsp";
    }

    @RequestMapping("/dashboard")
    public String allSongs(Model model) {
        List<Audio> lookifyList = this.audioService.audioList();
        if (!lookifyList.isEmpty() && lookifyList != null) {
            model.addAttribute("songList", lookifyList);
        }
        return "dashboard.jsp";
    }

    @RequestMapping("/{id}")
    public String allSongsById(@PathVariable("id") long id, Model model) {
        Audio lookify = this.audioService.findById(id);
        if (lookify != null) {
            model.addAttribute("song", lookify);
        }
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
}
