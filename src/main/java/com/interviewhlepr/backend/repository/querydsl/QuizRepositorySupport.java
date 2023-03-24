package com.interviewhlepr.backend.repository.querydsl;

import com.interviewhlepr.backend.model.QuizFilter;
import com.interviewhlepr.backend.model.entity.QQuiz;
import com.interviewhlepr.backend.model.entity.Quiz;
import com.interviewhlepr.backend.model.enums.ProblemType;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.util.StringUtils;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QuizRepositorySupport extends QuerydslRepositorySupport {
    private final JPAQueryFactory jpaQueryFactory;

    public QuizRepositorySupport(JPAQueryFactory jpaQueryFactory) {
        super(Quiz.class);
        this.jpaQueryFactory = jpaQueryFactory;
    }

    public List<Quiz> findALlByQuizFilterWithPageable(QuizFilter quizFilter, Pageable pageable) {
        return jpaQueryFactory.selectFrom(QQuiz.quiz)
                .where(equalsIgnoreCaseCategory(quizFilter.category()), eqProblemType(quizFilter.type()))
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .fetch();
    }

    private BooleanExpression equalsIgnoreCaseCategory(String category) {
        if (StringUtils.isNullOrEmpty(category)) {
            return null;
        }
        return QQuiz.quiz.category.equalsIgnoreCase(category);
    }

    private BooleanExpression eqProblemType(ProblemType type) {
        if (type == null) {
            return null;
        }
        return QQuiz.quiz.type.eq(type);
    }

}
