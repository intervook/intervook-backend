package com.intervook.backend.model.dto;

import org.springframework.data.domain.Page;

public record PageDTO(Object content, boolean last, int size, int totalPages, int currentPage) {
    public static PageDTO of(Page<?> page) {
        return new PageDTO(page.getContent(), page.isLast(), page.getSize(), page.getTotalPages(), page.getNumber() + 1);
    }
}
