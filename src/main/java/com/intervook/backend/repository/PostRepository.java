package com.intervook.backend.repository;

import com.intervook.backend.model.entity.Post;
import com.intervook.backend.model.entity.User;
import com.intervook.backend.model.enums.PostVisibility;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Long> {

    Optional<Post> findFirstByUserAndPostVisibilityOrderByCreateDtDesc(User user, PostVisibility postVisibility);
}
