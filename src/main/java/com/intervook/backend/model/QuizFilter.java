package com.intervook.backend.model;

import com.intervook.backend.model.enums.ProblemType;
import org.springframework.lang.Nullable;

public record QuizFilter(
        @Nullable String category,
        @Nullable ProblemType type
) {

}
