package com.intervook.mysql.mapper;

import com.intervook.mysql.entity.contents.ImageFile;
import com.intervook.mysql.entity.contents.Post;
import com.intervook.mysql.entity.contents.PostTag;
import com.intervook.mysql.model.dto.ImageFileDTO;
import com.intervook.mysql.model.dto.PostDTO;
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
