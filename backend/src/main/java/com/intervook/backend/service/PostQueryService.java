package com.intervook.backend.service;

import com.intervook.backend.exception.CommonException;
import com.intervook.core.enums.PostVisibility;
import com.intervook.mysql.entity.contents.Post;
import com.intervook.mysql.mapper.PostMapper;
import com.intervook.mysql.model.dto.PostDTO;
import com.intervook.mysql.repository.contents.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class PostQueryService {
    private final PostRepository postRepository;
    private final PostMapper postMapper;

    @Transactional
    public Page<PostDTO> getPostList(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        Page<Post> postPage = postRepository.findAll(pageRequest);
        return new PageImpl<>(postPage.getContent().stream().map(postMapper::toDTO).toList(), pageRequest, postPage.getTotalElements());
    }

    @Transactional
    public PostDTO getPost(Long postId) {
        return postRepository.findById(postId)
                .map(postMapper::toDTO)
                .orElseThrow(() -> CommonException.ITEM_NOT_FOUND);
    }

    @Transactional
    public PostDTO getMyTempPost(Long userId) {
        return postRepository.findFirstByUserIdAndPostVisibilityOrderByCreateDtDesc(userId, PostVisibility.TEMP)
                .map(postMapper::toDTO)
                .orElseThrow(() -> CommonException.ITEM_NOT_FOUND);
    }
}
