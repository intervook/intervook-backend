package com.intervook.mysql.repository.contents;

import com.intervook.core.enums.PostVisibility;
import com.intervook.mysql.entity.contents.Post;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Long> {

    Optional<Post> findFirstByUserIdAndPostVisibilityOrderByCreateDtDesc(Long userId, PostVisibility postVisibility);
}
