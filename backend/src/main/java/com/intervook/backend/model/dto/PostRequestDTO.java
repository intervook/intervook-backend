package com.intervook.backend.model.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.lang.Nullable;

import java.util.List;
import java.util.Objects;

@Setter
@NoArgsConstructor
public final class PostRequestDTO {
    @Nullable
    private Long id;
    private @NotNull String title;
    @Nullable
    private String subTitle;
    @Nullable
    private String link;
    @Nullable
    private List<@NotEmpty String> tagList;

    @Nullable
    public Long id() {
        return id;
    }

    public @NotNull String title() {
        return title;
    }

    @Nullable
    public String subTitle() {
        return subTitle;
    }

    @Nullable
    public String link() {
        return link;
    }

    @Nullable
    public List<@NotEmpty String> tagList() {
        return tagList;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        var that = (PostRequestDTO) obj;
        return Objects.equals(this.id, that.id) &&
                Objects.equals(this.title, that.title) &&
                Objects.equals(this.subTitle, that.subTitle) &&
                Objects.equals(this.link, that.link) &&
                Objects.equals(this.tagList, that.tagList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, subTitle, link, tagList);
    }

    @Override
    public String toString() {
        return "PostRequestDTO[" +
                "id=" + id + ", " +
                "title=" + title + ", " +
                "subTitle=" + subTitle + ", " +
                "link=" + link + ", " +
                "tagList=" + tagList + ']';
    }

}
