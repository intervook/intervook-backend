package com.interviewhlepr.backend.model.dto;

import java.util.List;

public record PostDTO(
        long id,
        UserDTO user,
        String title,
        String subTitle,
        String link,
        int likeCnt,
        List<ImageFileDTO> imageFileList,
        List<String> tagList
) {
}
