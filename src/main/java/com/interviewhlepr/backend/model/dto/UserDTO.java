package com.interviewhlepr.backend.model.dto;

import com.interviewhlepr.backend.model.enums.UserType;
import lombok.Builder;

@Builder
public record UserDTO(String uid, String nickname, UserType type) {
}
