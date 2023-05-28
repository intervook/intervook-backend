package com.intervook.mysql.mapper;

import com.intervook.mysql.entity.contents.Quiz;
import com.intervook.mysql.model.dto.QuizDTO;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface QuizMapper {

    QuizDTO toDTO(Quiz quiz);

    Quiz toEntity(QuizDTO quizDTO);

    default Quiz copyData(QuizDTO quizDTO, Quiz quiz) {
        if (quiz == null || quizDTO == null) {
            return null;
        }

        quiz.setCategory(quizDTO.category());
        quiz.setType(quizDTO.type());
        quiz.setTitle(quizDTO.title());
        quiz.setDescription(quizDTO.description());
        quiz.setAnswer(quizDTO.answer());

        return quiz;
    }


}
