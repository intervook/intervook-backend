package com.interviewhlepr.backend.repository;

import com.interviewhlepr.backend.model.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<Post, Long> {
}
