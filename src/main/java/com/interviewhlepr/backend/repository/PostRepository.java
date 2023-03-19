package com.interviewhlepr.backend.repository;

import com.interviewhlepr.backend.model.entity.Post;
import com.interviewhlepr.backend.model.entity.User;
import com.interviewhlepr.backend.model.enums.PostVisibility;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Long> {

    Optional<Post> findFirstByUserAndPostVisibilityOrderByCreateDtDesc(User user, PostVisibility postVisibility);
}
