package com.intervook.backend.controller;

import com.intervook.backend.annotation.AuthResult;
import com.intervook.backend.exception.CommonException;
import com.intervook.backend.model.dto.BaseResponse;
import com.intervook.backend.model.dto.PageDTO;
import com.intervook.backend.model.dto.PostDTO;
import com.intervook.backend.model.dto.PostRequestDTO;
import com.intervook.backend.service.PostQueryService;
import com.intervook.backend.service.PostService;
import com.intervook.mysql.entity.auth.User;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
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

    @GetMapping("/temp")
    public BaseResponse getMyTemp(@AuthResult User user) {
        PostDTO postDTO = postQueryService.getMyTempPost(user.getId());

        return BaseResponse.of(postDTO);
    }


    @PostMapping(value = "/temp/write", consumes = {"multipart/form-data"})
    public BaseResponse temporaryWritePost(@AuthResult User user,
                                           @Valid @RequestPart(name = "body") PostRequestDTO postRequestDTO,
                                           @RequestPart(name = "image_list", required = false) List<MultipartFile> imageList) {

        PostDTO postDTO = postService.upsertTemporaryPost(user, postRequestDTO, imageList);

        return BaseResponse.of(postDTO);
    }

    @PutMapping(value = "/temp/update", consumes = {"multipart/form-data"})
    public BaseResponse temporaryUpdatePost(@AuthResult User user,
                                            @Valid @RequestPart(name = "body") PostRequestDTO postRequestDTO,
                                            @RequestPart(name = "image_list", required = false) List<MultipartFile> imageList) {
        if (postRequestDTO.id() == null) {
            throw CommonException.INVALID_PARAMETER;
        }

        PostDTO postDTO = postService.upsertTemporaryPost(user, postRequestDTO, imageList);

        return BaseResponse.of(postDTO);
    }

    @PostMapping(value = "/publish", consumes = {"multipart/form-data"})
    public BaseResponse publishPost(@AuthResult User user,
                                    @Valid @RequestPart(name = "body") PostRequestDTO postRequestDTO,
                                    @RequestPart(name = "image_list", required = false) List<MultipartFile> imageList) {

        PostDTO postDTO = postService.publishPost(user, postRequestDTO, imageList);

        return BaseResponse.of(postDTO);
    }

    @PutMapping(value = "/update", consumes = {"multipart/form-data"})
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
