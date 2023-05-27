package com.intervook.backend;

import com.intervook.backend.mapper.PostMapper;
import com.intervook.backend.mapper.PostMapperImpl;
import com.intervook.backend.model.dto.PostDTO;
import com.intervook.backend.model.entity.ImageFile;
import com.intervook.backend.model.entity.Post;
import com.intervook.backend.model.entity.PostTag;
import com.intervook.backend.model.entity.User;
import com.intervook.backend.model.enums.PostVisibility;
import com.intervook.backend.model.enums.UserType;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class PostMapperTest {
    @Test
    void test() {
        PostMapper postMapper = new PostMapperImpl();

        Post post = new Post() {{
            this.setId(1L);
            this.setPostVisibility(PostVisibility.TEMP);
            this.setUser(new User("123", "nickname", UserType.USER));
            this.setTitle("title");
            this.setSubTitle("subTitle");
            this.setLink("link");
            this.setPostTagList(List.of(new PostTag() {{
                this.setContent("tag");
            }}));
            this.setImageFileList(List.of(new ImageFile() {{
                this.setFileName("filename");
                this.setOriginalFileName("original filename");
            }}));
        }};

        PostDTO postDTO = postMapper.toDTO(post);

        assertThat(postDTO.id()).isEqualTo(post.getId());
        assertThat(postDTO.title()).isEqualTo(post.getTitle());
        assertThat(postDTO.subTitle()).isEqualTo(post.getSubTitle());
        assertThat(postDTO.link()).isEqualTo(post.getLink());
        assertThat(postDTO.tagList().get(0)).isEqualTo(post.getPostTagList().get(0).getContent());
        assertThat(postDTO.imageFileList().get(0).fileName()).isEqualTo(post.getImageFileList().get(0).getOriginalFileName());
    }
}
