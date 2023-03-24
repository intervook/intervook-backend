package com.interviewhlepr.backend.model.dto;

import com.interviewhlepr.backend.model.enums.ProblemType;

public record QuizDTO(
        Long id,
        String category,
        ProblemType type,
        String title,
        String description,
        String answer
) {
}
