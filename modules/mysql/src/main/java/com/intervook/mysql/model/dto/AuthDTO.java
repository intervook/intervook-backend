package com.intervook.mysql.model.dto;

import lombok.Builder;

@Builder
public record AuthDTO(String uid, String nickname, String email) {
}
