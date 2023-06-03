package com.intervook.backend.controller;

import com.intervook.backend.exception.CommonException;
import com.intervook.backend.model.dto.BaseResponse;
import com.intervook.backend.model.dto.QuizDTO;
import com.intervook.backend.service.QuizService;
import com.intervook.core.enums.ProblemType;
import com.intervook.mysql.model.querydsl.QuizFilter;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/quiz")
@RequiredArgsConstructor
public class QuizController {
    private final QuizService quizService;


    @GetMapping
    public BaseResponse getQuizList(
            @RequestParam(required = false, defaultValue = "0") int page,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) ProblemType type
    ) {
        int DEFAULT_SIZE = 25;

        QuizFilter quizFilter = new QuizFilter(category, type);
        Pageable pageable = PageRequest.of(page, DEFAULT_SIZE);

        List<QuizDTO> quizList = quizService.getQuizList(quizFilter, pageable);
        return BaseResponse.of(quizList);
    }

    @PostMapping("/make")
    public BaseResponse makeQuiz(@Valid @RequestBody QuizDTO quizDTO) {
        QuizDTO quiz = quizService.upsertQuiz(quizDTO);
        return BaseResponse.of(quiz);
    }

    @PutMapping("/update")
    public BaseResponse updateQuiz(@Valid @RequestBody QuizDTO quizDTO) {
        if (quizDTO.id() == null) {
            throw CommonException.INVALID_PARAMETER;
        }

        QuizDTO quiz = quizService.upsertQuiz(quizDTO);
        return BaseResponse.of(quiz);
    }

}
