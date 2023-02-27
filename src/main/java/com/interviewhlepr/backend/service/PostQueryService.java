package com.interviewhlepr.backend.service;

import com.interviewhlepr.backend.mapper.PostMapper;
import com.interviewhlepr.backend.model.dto.PostDTO;
import com.interviewhlepr.backend.model.entity.Post;
import com.interviewhlepr.backend.repository.PostRepository;
import com.interviewhlepr.backend.repository.PostTagRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PostQueryService {
    private final PostTagRepository postTagRepository;
    private final PostRepository postRepository;
    private final PostMapper postMapper;

    public Page<PostDTO> getPostPage(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        Page<Post> postPage = postRepository.findAll(pageRequest);
        return new PageImpl<>(postPage.getContent().stream().map(postMapper::toDTO).toList(), pageRequest, postPage.getTotalElements());
    }
}
