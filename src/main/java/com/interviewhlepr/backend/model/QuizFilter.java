package com.interviewhlepr.backend.model;

import com.interviewhlepr.backend.model.enums.ProblemType;
import org.springframework.lang.Nullable;

public record QuizFilter(
        @Nullable String category,
        @Nullable ProblemType type
) {

}
