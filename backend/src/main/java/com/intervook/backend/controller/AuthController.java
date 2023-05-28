package com.intervook.backend.controller;

import com.intervook.backend.model.dto.BaseResponse;
import com.intervook.backend.service.UserService;
import com.intervook.backend.service.auth.AuthService;
import com.intervook.mysql.entity.auth.User;
import com.intervook.mysql.model.dto.AuthDTO;
import com.intervook.mysql.model.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api/auth")
@RestController
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;
    private final UserService userService;

    @PostMapping("/join")
    public BaseResponse join(@RequestParam String email, @RequestParam String password, @RequestParam String nickname) {

        AuthDTO authDTO = authService.joinAuth(email, password, nickname);
        User user = userService.syncUserWithDuplicateError(authDTO.uid(), authDTO.nickname());

        return BaseResponse.of(UserDTO.builder()
                .uid(user.getUid())
                .nickname(user.getNickname())
                .type(user.getType())
                .build());
    }


}
