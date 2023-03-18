package com.interviewhlepr.backend.mapper;

import com.interviewhlepr.backend.model.dto.ImageFileDTO;
import com.interviewhlepr.backend.model.dto.PostDTO;
import com.interviewhlepr.backend.model.entity.ImageFile;
import com.interviewhlepr.backend.model.entity.Post;
import com.interviewhlepr.backend.model.entity.PostTag;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.List;

@Mapper(componentModel = "spring")
public interface PostMapper {

    @Mapping(target = "tagList", source = "postTagList", qualifiedByName = "TagDTOList")
    @Mapping(target = "imageFileList", qualifiedByName = "ImageFileDTOList")
    PostDTO toDTO(Post post);

    @Named("ImageFileDTOList")
    default ImageFileDTO imageFileDTOList(ImageFile imageFile) {
        return new ImageFileDTO(imageFile.getUrl(), imageFile.getOriginalFileName());
    }

    @Named("TagDTOList")
    default List<String> tagDTOList(List<PostTag> tagList) {
        return tagList.stream()
                .map(PostTag::getContent)
                .toList();
    }

}
