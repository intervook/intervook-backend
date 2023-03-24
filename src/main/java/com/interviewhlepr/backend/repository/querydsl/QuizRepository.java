package com.interviewhlepr.backend.repository.querydsl;

import com.interviewhlepr.backend.model.entity.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {
}

