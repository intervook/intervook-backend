package com.intervook.backend.repository.querydsl;

import com.intervook.backend.model.QuizFilter;
import com.intervook.backend.model.entity.QQuiz;
import com.intervook.backend.model.entity.Quiz;
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
                .where(equalsIgnoreCaseCategory(quizFilter), eqProblemType(quizFilter))
                .offset(pageable.getOffset())
                .orderBy(QQuiz.quiz.id.desc())
                .limit(pageable.getPageSize())
                .fetch();
    }

    private BooleanExpression equalsIgnoreCaseCategory(QuizFilter quizFilter) {
        if (quizFilter == null || StringUtils.isNullOrEmpty(quizFilter.category())) {
            return null;
        }
        return QQuiz.quiz.category.equalsIgnoreCase(quizFilter.category());
    }

    private BooleanExpression eqProblemType(QuizFilter quizFilter) {
        if (quizFilter == null || quizFilter.type() == null) {
            return null;
        }
        return QQuiz.quiz.type.eq(quizFilter.type());
    }

}
