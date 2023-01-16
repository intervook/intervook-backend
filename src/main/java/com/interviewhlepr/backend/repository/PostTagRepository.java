package com.interviewhlepr.backend.repository;

import com.interviewhlepr.backend.model.entity.PostTag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostTagRepository extends JpaRepository<PostTag, Long> {

    List<PostTag> findAllByContentIn(List<String> contentList);
}
