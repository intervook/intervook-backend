package com.interviewhlepr.backend.repository;

import com.interviewhlepr.backend.model.entity.ImageFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageFileRepository extends JpaRepository<ImageFile, Long> {
}
