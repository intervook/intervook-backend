package com.intervook.mysql.model.dto;

import com.intervook.core.enums.ProblemType;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;


public record QuizDTO(
        @Nullable Long id,
        @NotBlank String category,
        @NotNull ProblemType type,
        @NotBlank String title,
        @NotBlank String description,
        @NotBlank String answer
) {
}
