package com.intervook.core.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum AuthProvider {
    DEFAULT("server"),
    NAVER("naver"),
    KAKAO("kakao");

    private final String providerName;
}
