package com.interviewhlepr.backend.service;

import com.interviewhlepr.backend.exception.CommonException;
import com.interviewhlepr.backend.mapper.PostMapper;
import com.interviewhlepr.backend.model.dto.PostDTO;
import com.interviewhlepr.backend.model.dto.PostRequestDTO;
import com.interviewhlepr.backend.model.entity.ImageFile;
import com.interviewhlepr.backend.model.entity.Post;
import com.interviewhlepr.backend.model.entity.PostTag;
import com.interviewhlepr.backend.model.entity.User;
import com.interviewhlepr.backend.model.enums.PostVisibility;
import com.interviewhlepr.backend.repository.ImageFileRepository;
import com.interviewhlepr.backend.repository.PostRepository;
import com.interviewhlepr.backend.repository.PostTagRepository;
import com.nimbusds.oauth2.sdk.util.CollectionUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PostService {
    private final FileService fileService;
    private final PostTagRepository postTagRepository;
    private final PostRepository postRepository;
    private final ImageFileRepository imageFileRepository;
    private final PostMapper postMapper;

    private final Random random = new Random();

    @Value("${file.service-url}")
    private String fileServiceUrl;

    @Transactional
    public PostDTO upsertTemporaryPost(User user, PostRequestDTO postRequestDTO, List<MultipartFile> imageList) {
        Post post = Optional.ofNullable(postRequestDTO.id())
                .map((id) -> postRepository.findById(id).orElseThrow(() -> CommonException.ITEM_NOT_FOUND))
                .orElse(new Post());

        List<ImageFile> existedImageFileList = post.getImageFileList();

        post.setPostVisibility(PostVisibility.TEMP);
        post.setUser(user);
        post.setTitle(postRequestDTO.title());
        post.setSubTitle(postRequestDTO.subTitle());
        post.setLink(postRequestDTO.link());
        post.setPostTagList(upsertTagList(postRequestDTO.tagList()));
        post.setImageFileList(upsertImageFileList(imageList));

        postRepository.save(post);

        if (CollectionUtils.isNotEmpty(existedImageFileList)) {
            imageFileRepository.deleteAll(existedImageFileList);
        }

        return postMapper.toDTO(post);
    }

    private List<ImageFile> upsertImageFileList(List<MultipartFile> imageList) {
        if (CollectionUtils.isEmpty(imageList)) {
            return new ArrayList<>();
        }

        List<ImageFile> imageFileList = imageList.stream().map(image -> {
            Path path = fileService.saveImageFile(image, String.valueOf(random.nextInt(1000)));
            return ImageFile.builder()
                    .path(path.getParent().toString())
                    .fileName(path.getFileName().toString())
                    .url(fileServiceUrl + "/" + path.getFileName().toString())
                    .originalFileName(image.getOriginalFilename())
                    .build();
        }).collect(Collectors.toList());

        if (!imageFileList.isEmpty()) {
            imageFileRepository.saveAll(imageFileList);
        }

        return imageFileList;
    }

    private List<PostTag> upsertTagList(List<String> tagList) {
        if (CollectionUtils.isEmpty(tagList)) {
            return new ArrayList<>();
        }

        List<PostTag> postTagList = new ArrayList<>();

        List<PostTag> existedPostTagList = postTagRepository.findAllByContentIn(tagList);
        Set<String> existedPostTagSet = new HashSet<>(existedPostTagList.stream()
                .map(PostTag::getContent)
                .toList());

        List<PostTag> nonExistedPostTagList = new ArrayList<>();
        tagList.forEach(tag -> {
            if (existedPostTagSet.contains(tag)) {
                return;
            }

            PostTag postTag = new PostTag();
            postTag.setContent(tag);
            nonExistedPostTagList.add(postTag);
        });

        if (!nonExistedPostTagList.isEmpty()) {
            postTagRepository.saveAll(nonExistedPostTagList);
        }

        postTagList.addAll(existedPostTagList);
        postTagList.addAll(nonExistedPostTagList);


        return postTagList;
    }

    public PostDTO publishPost(User user, PostRequestDTO postRequestDTO) {
        return null;
    }

    public PostDTO updatePost(User user, PostRequestDTO postRequestDTO) {
        return null;
    }

}
