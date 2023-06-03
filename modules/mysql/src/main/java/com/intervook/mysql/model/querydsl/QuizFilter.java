package com.intervook.mysql.model.querydsl;

import com.intervook.core.enums.ProblemType;
import org.springframework.lang.Nullable;

public record QuizFilter(
        @Nullable String category,
        @Nullable ProblemType type
) {

}
