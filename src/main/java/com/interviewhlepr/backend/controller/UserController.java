package com.interviewhlepr.backend.controller;

import com.interviewhlepr.backend.annotation.AuthResult;
import com.interviewhlepr.backend.model.dto.BaseResponse;
import com.interviewhlepr.backend.model.dto.UserDTO;
import com.interviewhlepr.backend.service.UserService;
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
    public BaseResponse me(@AuthResult UserDTO userDTO) {
        return BaseResponse.of(userDTO);
    }

    @GetMapping("/nickname")
    public BaseResponse isDuplicatedNickname(@RequestParam String nickname) {
        boolean isDuplicated = userService.isDuplicatedNickname(nickname);

        return BaseResponse.of(Map.of("duplicated", isDuplicated));
    }
}
