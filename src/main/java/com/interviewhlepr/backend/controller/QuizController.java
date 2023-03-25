package com.interviewhlepr.backend.controller;

import com.interviewhlepr.backend.exception.CommonException;
import com.interviewhlepr.backend.model.QuizFilter;
import com.interviewhlepr.backend.model.dto.BaseResponse;
import com.interviewhlepr.backend.model.dto.QuizDTO;
import com.interviewhlepr.backend.model.enums.ProblemType;
import com.interviewhlepr.backend.service.QuizService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/quiz")
@RequiredArgsConstructor
public class QuizController {
    private final QuizService quizService;


    @GetMapping("/list")
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

    @PostMapping("/update")
    public BaseResponse updateQuiz(@Valid @RequestBody QuizDTO quizDTO) {
        if (quizDTO.id() == null) {
            throw CommonException.INVALID_PARAMETER;
        }

        QuizDTO quiz = quizService.upsertQuiz(quizDTO);
        return BaseResponse.of(quiz);
    }

}
