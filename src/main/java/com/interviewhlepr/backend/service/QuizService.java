package com.interviewhlepr.backend.service;

import com.interviewhlepr.backend.mapper.QuizMapper;
import com.interviewhlepr.backend.model.QuizFilter;
import com.interviewhlepr.backend.model.dto.QuizDTO;
import com.interviewhlepr.backend.model.entity.Quiz;
import com.interviewhlepr.backend.repository.querydsl.QuizRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class QuizService {
    private final QuizRepository quizRepository;
    private final QuizMapper quizMapper;

    public QuizDTO upsertQuiz(QuizDTO quizRequestDTO) {
        Quiz quiz = Optional.ofNullable(quizRequestDTO.id())
                .flatMap(quizRepository::findById)
                .orElseGet(() -> quizMapper.toEntity(quizRequestDTO));

        quizRepository.save(quiz);

        return quizMapper.toDTO(quiz);
    }

    public List<QuizDTO> getQuizList(QuizFilter quizFilter, Pageable pageable) {


        return Collections.emptyList();
    }

}
