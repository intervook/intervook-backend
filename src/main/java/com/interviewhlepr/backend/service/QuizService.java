package com.interviewhlepr.backend.service;

import com.interviewhlepr.backend.mapper.QuizMapper;
import com.interviewhlepr.backend.model.QuizFilter;
import com.interviewhlepr.backend.model.dto.QuizDTO;
import com.interviewhlepr.backend.model.entity.Quiz;
import com.interviewhlepr.backend.repository.querydsl.QuizRepository;
import com.interviewhlepr.backend.repository.querydsl.QuizRepositorySupport;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class QuizService {
    private final QuizRepository quizRepository;
    private final QuizRepositorySupport quizRepositorySupport;
    private final QuizMapper quizMapper;

    public QuizDTO upsertQuiz(QuizDTO quizRequestDTO) {
        Quiz quiz = Optional.ofNullable(quizRequestDTO.id())
                .flatMap(quizRepository::findById)
                .map(quizEntity -> quizMapper.copyData(quizRequestDTO, quizEntity))
                .orElseGet(() -> quizMapper.toEntity(quizRequestDTO));

        quizRepository.save(quiz);

        return quizMapper.toDTO(quiz);
    }

    public List<QuizDTO> getQuizList(QuizFilter quizFilter, Pageable pageable) {
        return quizRepositorySupport.findALlByQuizFilterWithPageable(quizFilter, pageable)
                .stream()
                .map(quizMapper::toDTO)
                .toList();
    }

}
