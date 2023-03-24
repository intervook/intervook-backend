package com.interviewhlepr.backend.mapper;

import com.interviewhlepr.backend.model.dto.QuizDTO;
import com.interviewhlepr.backend.model.entity.Quiz;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface QuizMapper {

    QuizDTO toDTO(Quiz quiz);

    Quiz toEntity(QuizDTO quizDTO);

}
