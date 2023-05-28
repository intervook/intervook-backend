package com.intervook.backend.service;

import com.intervook.mysql.entity.contents.Quiz;
import com.intervook.mysql.mapper.QuizMapper;
import com.intervook.mysql.model.QuizFilter;
import com.intervook.mysql.model.dto.QuizDTO;
import com.intervook.mysql.repository.contents.querydsl.QuizRepository;
import com.intervook.mysql.repository.contents.querydsl.QuizRepositorySupport;
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
