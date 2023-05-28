package com.intervook.mysql.repository.contents;

import com.intervook.mysql.entity.contents.PostTag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostTagRepository extends JpaRepository<PostTag, Long> {

    List<PostTag> findAllByContentIn(List<String> contentList);
}
