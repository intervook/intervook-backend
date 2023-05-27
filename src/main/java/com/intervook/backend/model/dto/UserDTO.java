package com.intervook.backend.model.dto;

import com.intervook.backend.model.entity.User;
import com.intervook.backend.model.enums.UserType;
import lombok.Builder;

import java.time.Instant;

@Builder
public record UserDTO(Long id, String uid, String nickname, UserType type, Instant createDt) {
    public UserDTO(User user) {
        this(user.getId(), user.getUid(), user.getNickname(), user.getType(), user.getCreateDt());
    }
}
