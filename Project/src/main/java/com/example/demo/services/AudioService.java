package com.example.demo.services;

import com.example.demo.models.Audio;
import com.example.demo.repositories.AudioRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AudioService {
    @Autowired
    private AudioRepo audioRepo;

    public List<Audio> audioList() {
        return this.audioRepo.findAll();
    }

    public Audio findById(long id) {
        return this.audioRepo.findById(id);
    }

    public Audio createLookify(Audio lookify) {
        return this.audioRepo.save(lookify);
    }

    public List<Audio> findByArtistName(String artistName) {
        return this.audioRepo.findByArtistContaining(artistName);
    }

    public List<Audio> findTopTen() {
        return this.audioRepo.findTop10ByOrderByRatingDesc();
    }
    public void delete(long id){
        this.audioRepo.deleteById(id);
    }
}
