package com.intervook.backend.model.enums;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum UserType {
    ADMIN("admin"),
    USER("user"),
    BLOCK("block"),
    DORMANT("DORMANT"),
    DEACTIVATED("DEACTIVATED");

    private final String role;
}
