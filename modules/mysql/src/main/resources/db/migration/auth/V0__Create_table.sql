create table auth
(
    id                 bigint auto_increment
        primary key,
    uid                varchar(255) not null,
    email              varchar(255) not null,
    encrypted_password varchar(255) null,
    provider           varchar(255) not null,
    create_dt          datetime(6)  not null DEFAULT CURRENT_TIMESTAMP(6),
    update_dt          datetime(6)  not null DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    constraint UK_Auth_uid unique (uid),
    constraint UK_Auth_email unique (email)
);

create table user
(
    id        bigint auto_increment
        primary key,
    uid       varchar(255) not null,
    nickname  varchar(255) not null,
    type      varchar(255) not null,
    create_dt datetime(6)  not null DEFAULT CURRENT_TIMESTAMP(6),
    update_dt datetime(6)  not null DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    constraint UK_User_uid unique (uid),
    constraint UK_User_nickname unique (nickname)
);
