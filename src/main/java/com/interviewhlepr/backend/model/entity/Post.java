package com.interviewhlepr.backend.model.entity;

import com.interviewhlepr.backend.model.enums.PostVisibility;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Collections;
import java.util.List;

@Setter
@Getter
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private PostVisibility postVisibility;

    @ManyToOne
    @JoinColumn(nullable = false)
    private User user;
    @Column(nullable = false)
    private String title;
    private String link;
    @ManyToMany
    private List<ImageFile> imageFileList = Collections.emptyList();
    @ManyToMany
    private List<PostTag> postTagList = Collections.emptyList();

}
