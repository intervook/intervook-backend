package com.interviewhlepr.backend.model.dto;

import lombok.Builder;

@Builder
public record AuthDTO(String uid, String nickname, String email) {
}
