package com.interviewhlepr.backend.model.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class ImageFile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String path;
    @Column(nullable = false)
    private String fileName;
    @Column(nullable = false)
    private String originalFileName;
}
