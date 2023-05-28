package com.intervook.mysql.repository.contents.querydsl;

import com.intervook.mysql.entity.contents.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {
}

