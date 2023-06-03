package com.intervook.backend.model.dto;


import com.intervook.core.enums.PostVisibility;

import java.util.List;

public record PostDTO(
        long id,
        PostVisibility postVisibility,
        UserDTO user,
        String title,
        String subTitle,
        String link,
        int likeCnt,
        List<ImageFileDTO> imageFileList,
        List<String> tagList
) {
}
