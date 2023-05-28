package com.intervook.mysql.repository.contents;

import com.intervook.mysql.entity.contents.ImageFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageFileRepository extends JpaRepository<ImageFile, Long> {

}
