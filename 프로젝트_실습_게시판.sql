select  * from booklist b

#날짜 :2023/08/02
#이름 : 하민수
#내용 : 게시판 시스템

create database `Jboard`;

create table `User`(
	`uid` varchar(20) primary key,
	`pass` varchar(255),
	`name`	varchar(20),
	`nick`	varchar(20) unique,
	`email`	varchar(50) unique,
	`hp`	char(13) unique,
	`role`	varchar(20) default 'USER',
	`zip`	char(5),
	`addr1`	varchar(255),
	`addr2`	varchar(255),
	`regip`	varchar(100),
	`regDate`	datetime,
	`leaveDate`	datetime

);

create table `Article`();

create table `File`();

create table `Terms`();