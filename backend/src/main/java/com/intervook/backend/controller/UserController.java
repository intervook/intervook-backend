package com.intervook.backend.controller;

import com.intervook.backend.annotation.AuthResult;
import com.intervook.backend.model.dto.BaseResponse;
import com.intervook.backend.service.UserService;
import com.intervook.mysql.entity.auth.User;
import com.intervook.mysql.model.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RequestMapping("/api/user")
@RequiredArgsConstructor
@RestController
public class UserController {
    private final UserService userService;

    @GetMapping
    public BaseResponse me(@AuthResult User user) {
        return BaseResponse.of(new UserDTO(user));
    }

    @GetMapping("/nickname")
    public BaseResponse isDuplicatedNickname(@RequestParam String nickname) {
        boolean isDuplicated = userService.isDuplicatedNickname(nickname);

        return BaseResponse.of(Map.of("duplicated", isDuplicated));
    }
}
