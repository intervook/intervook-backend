package com.interviewhlepr.backend.model.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.springframework.lang.Nullable;

import java.util.List;

public record PostRequestDTO(
        @Nullable Long id,
        @NotNull String title,
        @Nullable String subTitle,
        @Nullable String link,
        @Valid List<@NotEmpty ImageFileDTO> imageFileDTOList,
        List<@NotEmpty String> tagList
) {
}
