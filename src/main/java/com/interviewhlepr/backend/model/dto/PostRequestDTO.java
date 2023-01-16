package com.interviewhlepr.backend.model.dto;

import io.micrometer.common.lang.Nullable;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.util.List;

public record PostRequestDTO(
        @Nullable Long id,
        @NotNull String title,
        @Nullable String link,
        @Valid List<@NotEmpty ImageFileDTO> imageFileDTOList,
        List<@NotEmpty String> tagList
) {
}
