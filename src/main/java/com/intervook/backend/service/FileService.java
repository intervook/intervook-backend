package com.intervook.backend.service;

import com.intervook.backend.exception.CommonException;
import com.intervook.backend.util.HashUtil;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeType;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.ZonedDateTime;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileService {
    @Value("${file.upload-dir}")
    private String filePath;

    @PostConstruct
    public void init() {
        // 폴더 생성
        File folder = new File(filePath);
        if (!folder.exists() && !folder.mkdirs()) {
            throw new IllegalStateException("[FileService] fail to make dir: " + filePath);
        }
    }

    public Path saveImageFile(MultipartFile file, String salt) {
        try {
            MimeType mimeType = getMimeType(file);

            if (!isImageFile(mimeType)) {
                throw CommonException.BAD_REQUEST;
            }

            String encryptedFileName = HashUtil.sha256(file.getOriginalFilename() + salt + ZonedDateTime.now()).replaceAll("/", "_");
            Path path = Paths.get(filePath, encryptedFileName + "." + mimeType.getSubtype()); // 파일 저장 경로
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING); // 파일 저장
            return path;
        } catch (Exception e) {
            log.error("[FileService] fail to save file.", e);
            throw new RuntimeException(e);
        }
    }

    public byte[] getImageFile(String fileId) throws IOException {
        Path path = Paths.get(filePath, fileId); // 파일 저장 경로
        if (!path.toFile().exists()) {
            throw CommonException.ITEM_NOT_FOUND;
        }

        return Files.readAllBytes(path);
    }

    public MimeType getMimeType(MultipartFile file) {
        return MimeTypeUtils.parseMimeType(Objects.requireNonNull(file.getContentType()));
    }

    public String getMimeType(String fileId) throws IOException {
        Path path = Paths.get(filePath, fileId); // 파일 저장 경로
        String mimeType = Files.probeContentType(path);
        if (mimeType == null || !mimeType.startsWith("image/")) {
            throw CommonException.ITEM_NOT_FOUND;
        }

        return mimeType;
    }

    public boolean isImageFile(MimeType mimeType) {
        return mimeType.getType().equals("image");
    }
}
