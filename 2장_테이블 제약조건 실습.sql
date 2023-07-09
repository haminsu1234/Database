# 날짜 : 2023/06/16
# 이름 : 하민수
# 내용 : 2.테이블 제약조건 실습

#실습 2-1
CREATE TABLE `user2`(
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13),
`age` int
);

#실습 2-2
#데이터값이 없음;

#실습 2-3

CREATE TABLE `user3`(
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) UNIQUE,
`age` int
);

#실습 2-4
#역시 데이터 x


#실습 2-5
CREATE TABLE `parent`(
`pid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) unique
);

CREATE TABLE `child`(
`cid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) UNIQUE,
`pid` VARCHAR(10),
FOREIGN KEY (`pid`) REFERENCES `parent`(`pid`)
);





#실습 2-6
#데이터x

#실습 2-7
CREATE TABLE `user4`(
`seq` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(10),
`gender` TINYINT,
`age` INT,
`addr` VARCHAR(255)
);




#실습 2-8
#데이터x

#실습 2-9
CREATE TABLE `user5`(
`name` VARCHAR(10) NOT NULL,
`gender` TINYINT,
`age` INT DEFAULT 1,
`addr` VARCHAR(10)
);


#실습 2-10
#데이터x

#실습 2-11
ALTER TABLE `user5` ADD `hp` VARCHAR(20);
ALTER TABLE `user5` ADD `birth` CHAR(10) DEFAULT '0000-00-00' AFTER `name`;
#실습 2-12
ALTER TABLE `user5` MODIFY `hp` CHAR(13);
ALTER TABLE `user5` MODIFY `age` TINYINT;
#실습 2-13
ALTER TABLE `user5` CHANGE COLUMN `addr` `adrress` VARCHAR(100)l

#실습 2-14;
ALTER TABLE `user5` DROP `gender`;
#실습 2-15
CREATE TABLE `user6` LIKE `user5`
#실습 2-16
INSERT INTO `user6` SELECT * FROM `user5`;
#실습 2-1

