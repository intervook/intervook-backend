package com.interviewhlepr.backend.service;

import com.interviewhlepr.backend.model.dto.PostDTO;
import com.interviewhlepr.backend.model.dto.PostRequestDTO;
import com.interviewhlepr.backend.model.dto.UserDTO;
import com.interviewhlepr.backend.model.entity.Post;
import com.interviewhlepr.backend.model.entity.PostTag;
import com.interviewhlepr.backend.model.entity.User;
import com.interviewhlepr.backend.model.enums.PostVisibility;
import com.interviewhlepr.backend.repository.PostRepository;
import com.interviewhlepr.backend.repository.PostTagRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class PostService {
    private final PostTagRepository postTagRepository;
    private final PostRepository postRepository;

    public List<PostDTO> getPostList(int page, int size) {

        return Collections.emptyList();
    }

    public PostDTO temporarySavePost(User user, PostRequestDTO postRequestDTO) {

        Post post = new Post();
        post.setPostVisibility(PostVisibility.TEMP);
        post.setUser(user);
        post.setTitle(postRequestDTO.title());
        post.setSubTitle(postRequestDTO.subTitle());
        post.setLink(postRequestDTO.link());

        if (Objects.nonNull(postRequestDTO.imageFileDTOList())) {
            postRequestDTO.imageFileDTOList().forEach(imageFileDTO -> {
                // TODO 이미지 파일 저장
            });
        }

        List<PostTag> postTagList = new ArrayList<>();
        if (Objects.nonNull(postRequestDTO.tagList()) && !postRequestDTO.tagList().isEmpty()) {
            List<PostTag> existedPostTagList = postTagRepository.findAllByContentIn(postRequestDTO.tagList());
            Set<String> existedPostTagSet = new HashSet<String>(existedPostTagList.stream()
                    .map(PostTag::getContent)
                    .toList());

            List<PostTag> nonExistedPostTagList = new ArrayList<>();
            postRequestDTO.tagList().forEach(tag -> {
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
        }

        post.setPostTagList(postTagList);
        postRepository.save(post);

        return new PostDTO(post.getId(),
                new UserDTO(user.getUid(), user.getNickname(), user.getType()),
                post.getTitle(),
                post.getLink(),
                Collections.emptyList(),
                postTagList.stream().map(PostTag::getContent).toList()
        );
    }

    public PostDTO temporaryUpdatePost(User user, PostRequestDTO postRequestDTO) {
        return null;
    }

    public PostDTO publishPost(User user, PostRequestDTO postRequestDTO) {
        return null;
    }

    public PostDTO updatePost(User user, PostRequestDTO postRequestDTO) {
        return null;
    }

}
