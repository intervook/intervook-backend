package com.intervook.mysql.model.dto;

import com.intervook.core.enums.UserType;
import com.intervook.mysql.entity.auth.User;
import lombok.Builder;

import java.time.Instant;

@Builder
public record UserDTO(Long id, String uid, String nickname, UserType type, Instant createDt) {
    public UserDTO(User user) {
        this(user.getId(), user.getUid(), user.getNickname(), user.getType(), user.getCreateDt());
    }
}
