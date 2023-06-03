package com.intervook.mysql.entity.contents;

import com.intervook.core.enums.PostVisibility;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Setter
@Getter
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private PostVisibility postVisibility = PostVisibility.TEMP;

    private Long userId;
    @Column(nullable = false)
    private String title;
    private String subTitle;
    private String link;
    @Column(nullable = false)
    private int likeCnt = 0;
    @OneToMany
    @JoinTable(
            name = "post_image_mapping",
            joinColumns = @JoinColumn(name = "post_id"),
            inverseJoinColumns = @JoinColumn(name = "image_file_id")
    )
    private List<ImageFile> imageFileList = new ArrayList<>();
    @ManyToMany
    @JoinTable(
            name = "post_tag_mapping",
            joinColumns = @JoinColumn(name = "post_id"),
            inverseJoinColumns = @JoinColumn(name = "post_tag_id")
    )
    private List<PostTag> postTagList = new ArrayList<>();

    @Column(nullable = false)
    private Instant createDt;
    @Column(nullable = false)
    private Instant updateDt;

    @PrePersist
    void preInsert() {
        Instant now = Instant.now();
        if (Objects.isNull(this.createDt)) {
            this.createDt = now;
        }
        if (Objects.isNull(this.updateDt)) {
            this.updateDt = now;
        }
    }

    @PreUpdate
    void preUpdate() {
        this.updateDt = Instant.now();
    }

}
