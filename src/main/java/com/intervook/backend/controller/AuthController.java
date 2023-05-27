package com.intervook.backend.controller;

import com.intervook.backend.model.dto.AuthDTO;
import com.intervook.backend.model.dto.BaseResponse;
import com.intervook.backend.model.dto.UserDTO;
import com.intervook.backend.model.entity.User;
import com.intervook.backend.service.UserService;
import com.intervook.backend.service.auth.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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
