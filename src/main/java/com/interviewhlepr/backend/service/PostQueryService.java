package com.interviewhlepr.backend.service;

import com.interviewhlepr.backend.mapper.PostMapper;
import com.interviewhlepr.backend.model.dto.PostDTO;
import com.interviewhlepr.backend.model.entity.Post;
import com.interviewhlepr.backend.repository.PostRepository;
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
                .orElse(null);
    }
}
