#如果没有权限请授权
drop  database  if exists  bbs1;
create  database  bbs1;
grant all on bbs1.* to 'wang'@'%';
use  bbs1;

drop  table  if exists  user;
create table user
(
    user_id    int primary key auto_increment,
    username   varchar(50)  not null,
    password   varchar(100) not null,
    user_email varchar(100),
    sex        enum('M','F','NOMF') default 'NOMF',
    nickname   varchar(50)  NOT NULL,
    role_id    int                   default 1,
    status     int          not null default 1
);
CREATE table role(
                     role_id int auto_increment primary key ,
                     role_name varchar(50)   not null
);
create table post(
                     post_id  int  auto_increment primary key  ,
                     post_title varchar(100)  not null ,
                     post_content  text     not null ,
                     user_id    int  not null ,
                     topic_id  int  default 1,
                     username varchar(50)  not null ,
                     comments_number int  default 0,
                     release_time  timestamp default  now()
);

create table comments(
                         comments_id int  auto_increment primary key ,
                         comments_content varchar(100) not null ,
                         post_id int  not null ,
                         user_id int  not null ,
                         username varchar(50)  not null ,
                         comments_time   timestamp  default  now()
);

create table topic(
                      topic_id int auto_increment primary key ,
                      topic_name varchar(50) not null ,
                      topic_left int   not null ,
                      topic_right int not null
);

