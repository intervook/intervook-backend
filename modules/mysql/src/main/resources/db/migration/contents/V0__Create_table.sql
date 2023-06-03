create table post
(
    id              bigint auto_increment
        primary key,
    user_id         bigint       not null,
    like_cnt        int          not null,
    link            varchar(255) null,
    post_visibility varchar(255) not null,
    sub_title       varchar(255) null,
    title           varchar(255) not null,
    update_dt       datetime(6)  not null,
    create_dt       datetime(6)  not null
);

create table quiz
(
    id          bigint auto_increment
        primary key,
    answer      varchar(255) not null,
    category    varchar(255) not null,
    description varchar(255) not null,
    title       varchar(255) not null,
    type        varchar(255) not null,
    create_dt   datetime(6)  not null,
    update_dt   datetime(6)  not null
);

create table post_tag
(
    id        bigint auto_increment
        primary key,
    content   varchar(255) null,
    create_dt datetime(6)  not null,
    update_dt datetime(6)  not null
);

create table image_file
(
    id                 bigint auto_increment
        primary key,
    url                varchar(255) not null,
    file_name          varchar(255) not null,
    original_file_name varchar(255) not null,
    path               varchar(255) not null,
    create_dt          datetime(6)  not null,
    update_dt          datetime(6)  not null
);

create table post_tag_mapping
(
    post_id     bigint not null,
    post_tag_id bigint not null,
    constraint FK_PostTagMapping_post_id
        foreign key (post_id) references post (id),
    constraint FK_PostTagMapping_post_tag_id
        foreign key (post_tag_id) references post_tag (id)
);

create table post_image_mapping
(
    post_id       bigint not null,
    image_file_id bigint not null,
    constraint UK_PostImageMapping_image_file_id
        unique (image_file_id),
    constraint FK_PostImageMapping_post_id
        foreign key (post_id) references post (id),
    constraint FK_PostImageMapping_image_file_id
        foreign key (image_file_id) references image_file (id)
);

create table bookmark_mapping
(
    id         bigint auto_increment
        primary key,
    activation tinyint(1)  not null,
    post_id    bigint      not null,
    user_id    bigint      not null,
    update_dt  datetime(6) not null,
    create_dt  datetime(6) not null,
    constraint FK_BookmarkMapping_post_id
        foreign key (post_id) references post (id)
);

create table like_mapping
(
    id         bigint auto_increment
        primary key,
    user_id    bigint      not null,
    post_id    bigint      not null,
    activation tinyint(1)  not null,
    create_dt  datetime(6) not null,
    update_dt  datetime(6) not null,
    constraint FK_LikeMapping_post_id
        foreign key (post_id) references post (id)
);

