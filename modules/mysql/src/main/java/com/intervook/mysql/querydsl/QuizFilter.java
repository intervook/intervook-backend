package com.intervook.mysql.querydsl;

import com.intervook.core.enums.ProblemType;
import org.springframework.lang.Nullable;

public record QuizFilter(
        @Nullable String category,
        @Nullable ProblemType type
) {

}
