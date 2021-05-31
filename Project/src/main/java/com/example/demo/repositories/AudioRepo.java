package com.example.demo.repositories;

import com.example.demo.models.Audio;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AudioRepo extends CrudRepository<Audio,Long> {
    List<Audio> findAll();
    List<Audio> findByArtistContaining(String search);
    Audio findById(long id);
    List<Audio> findTop10ByOrderByRatingDesc();
}
