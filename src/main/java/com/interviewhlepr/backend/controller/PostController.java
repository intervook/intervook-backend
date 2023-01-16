package com.interviewhlepr.backend.controller;

import com.interviewhlepr.backend.annotation.AuthResult;
import com.interviewhlepr.backend.exception.CommonException;
import com.interviewhlepr.backend.model.dto.BaseResponse;
import com.interviewhlepr.backend.model.dto.PostDTO;
import com.interviewhlepr.backend.model.dto.PostRequestDTO;
import com.interviewhlepr.backend.model.entity.User;
import com.interviewhlepr.backend.service.PostService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api/post")
@RestController
@RequiredArgsConstructor
public class PostController {
    private static final int POST_LIST_SIZE = 25;
    private final PostService postService;

    @GetMapping
    public BaseResponse getPostList(@RequestParam(defaultValue = "0") int page) {
        if (page < 0) {
            throw CommonException.INVALID_PARAMETER;
        }

        List<PostDTO> postList = postService.getPostList(page, POST_LIST_SIZE);

        return BaseResponse.of(postList);
    }

    @PostMapping("/temp/write")
    public BaseResponse temporaryWritePost(@AuthResult User user, @Valid @RequestBody PostRequestDTO postRequestDTO) {

        PostDTO postDTO = postService.temporarySavePost(user, postRequestDTO);

        return BaseResponse.of(postDTO);
    }

    @PutMapping("/temp/update")
    public BaseResponse temporaryUpdatePost(@AuthResult User user, @Valid @RequestBody PostRequestDTO postRequestDTO) {

        PostDTO postDTO = postService.temporaryUpdatePost(user, postRequestDTO);

        return BaseResponse.of(postDTO);
    }

    @PostMapping("/publish")
    public BaseResponse publishPost(@AuthResult User user, @Valid @RequestBody PostRequestDTO postRequestDTO) {

        PostDTO postDTO = postService.publishPost(user, postRequestDTO);

        return BaseResponse.of(postDTO);
    }

    @PutMapping("/update")
    public BaseResponse updatePost(@AuthResult User user, @Valid @RequestBody PostRequestDTO postRequestDTO) {

        PostDTO postDTO = postService.updatePost(user, postRequestDTO);

        return BaseResponse.of(postDTO);
    }

}
