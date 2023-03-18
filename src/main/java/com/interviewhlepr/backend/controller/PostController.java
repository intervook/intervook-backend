package com.interviewhlepr.backend.controller;

import com.interviewhlepr.backend.annotation.AuthResult;
import com.interviewhlepr.backend.exception.CommonException;
import com.interviewhlepr.backend.model.dto.BaseResponse;
import com.interviewhlepr.backend.model.dto.PageDTO;
import com.interviewhlepr.backend.model.dto.PostDTO;
import com.interviewhlepr.backend.model.dto.PostRequestDTO;
import com.interviewhlepr.backend.model.entity.User;
import com.interviewhlepr.backend.service.PostQueryService;
import com.interviewhlepr.backend.service.PostService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequestMapping("/api/post")
@RestController
@RequiredArgsConstructor
public class PostController {
    private static final int POST_LIST_SIZE = 25;
    private final PostService postService;
    private final PostQueryService postQueryService;

    @GetMapping
    public BaseResponse getPostList(@RequestParam(defaultValue = "1") int page) {
        if (page < 1) {
            throw CommonException.INVALID_PARAMETER;
        }

        Page<PostDTO> postPage = postQueryService.getPostList(page - 1, POST_LIST_SIZE);

        return BaseResponse.of(PageDTO.of(postPage));
    }

    @GetMapping("/{postId}")
    public BaseResponse getPostList(@PathVariable Long postId) {
        PostDTO postDTO = postQueryService.getPost(postId);

        return BaseResponse.of(postDTO);
    }


    @PostMapping(value = "/temp/write", consumes = {"multipart/form-data"})
    public BaseResponse temporaryWritePost(@AuthResult User user,
                                           @Valid @RequestPart(name = "body") PostRequestDTO postRequestDTO,
                                           @RequestPart(name = "image_list", required = false) List<MultipartFile> imageList) {

        PostDTO postDTO = postService.upsertTemporaryPost(user, postRequestDTO, imageList);

        return BaseResponse.of(postDTO);
    }

    @PutMapping("/temp/update")
    public BaseResponse temporaryUpdatePost(@AuthResult User user,
                                            @Valid @RequestPart(name = "body") PostRequestDTO postRequestDTO,
                                            @RequestPart(name = "image_list", required = false) List<MultipartFile> imageList) {
        if (postRequestDTO.id() == null) {
            throw CommonException.INVALID_PARAMETER;
        }

        PostDTO postDTO = postService.upsertTemporaryPost(user, postRequestDTO, imageList);

        return BaseResponse.of(postDTO);
    }

    @PostMapping("/publish")
    public BaseResponse publishPost(@AuthResult User user,
                                    @Valid @RequestPart(name = "body") PostRequestDTO postRequestDTO,
                                    @RequestPart(name = "image_list", required = false) List<MultipartFile> imageList) {

        PostDTO postDTO = postService.publishPost(user, postRequestDTO, imageList);

        return BaseResponse.of(postDTO);
    }

    @PutMapping("/update")
    public BaseResponse updatePost(@AuthResult User user,
                                   @Valid @RequestPart(name = "body") PostRequestDTO postRequestDTO,
                                   @RequestPart(name = "image_list", required = false) List<MultipartFile> imageList) {
        if (postRequestDTO.id() == null) {
            throw CommonException.INVALID_PARAMETER;
        }

        PostDTO postDTO = postService.updatePost(user, postRequestDTO, imageList);

        return BaseResponse.of(postDTO);
    }

}
