# 날짜 : 2023/06/16
# 이름 : 하민수
# 내용 : 1.SQL 기초실습


CREATE DATABASE `USERDB`;
DROP DATABASE `USERDB`;

CREATE TABLE `USER1`(
	`UID`	VARCHAR(10),
	`NAME`	VARCHAuser1R(10),
	`HP`	CHAR(13),
	`AGE` INT
);

DROP TABLE `USER1`;

INSERT INTO `USER1` VALUES ('A101','김유신','010-1234-1111',25);
INSERT INTO `USER1` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT INTO `USER1` VALUES ('A103','장보고','010-1234-3333',32);
INSERT INTO `USER1`(`UID`,`NAME`,`AGE`) VALUES ('A104','강감찬',45);
INSERT INTO `USER1` SET
`UID` ='A105',
`NAME`='이순신',
`HP`='010-1234-5555';

SELECT * FROM `USER1`;

SELECT * FROM `USER1`
WHERE `UID`='A101';

SELECT * FROM `USER1`
WHERE `NAME`='김춘추';

SELECT * FROM `USER1`
WHERE `AGE`<30;

SELECT * FROM `USER1`
WHERE `AGE`>=30;

SELECT `UID`,`NAME`,`AGE` FROM `USER1`;

UPDATE `USER1` SET`HP`='010-1234-4444'
WHERE `UID`='A104';

UPDATE `USER1` SET `AGE`=51
WHERE `UID`='A105';

UPDATE `USER1` SET `HP`='010-1234-1001',`AGE`=27
WHERE `UID`='A101';

SELECT * FROM `USER1`;

DELETE FROM `USER1`
WHERE `UID`='A101'; 

DELETE FROM `USER1`
WHERE `UID`='A102' AND `AGE`=25;

DELETE FROM `USER1`
WHERE `AGE`>=30;

CREATE TABLE `tbluser`(
`userid` VARCHAR(10),
`username` VARCHAR(10),
`userhp` CHAR(13),bank
`userage` TINYINT,
`useraddr` VARCHAR(20)
);

CREATE TABLE `tblproduct`(
`prdcode` INT,
`prdname` VARCHAR(10),
`prdprice` INT,
`prdamount` INT,
`prdcompany` VARCHAR(10),
`prdmakedate` date
);

INSERT INTO `tbluser` VALUES ('p101','김유신','010-1234-1001',25,'서울시중구');
INSERT INTO `tbluser` VALUES ('p102','김춘추','010-1234-1002',23,'부산시금정구');
INSERT INTO `tbluser` (`userid`,`username`,`userage`,`useraddr`) VALUES ('p103','김유신',31,'경기도 광주군');
INSERT INTO `tbluser` (`userid`,`username`,`useraddr`) VALUES ('p103','김유신','경기도 광주군');
INSERT INTO `tbluser` (`userid`,`username`,`userhp`,`userage`) VALUES ('p103','김유신','010-1234-1005',50);

SELECT * FROM `tbluser`;

Drop TABLE `tbluser`;

INSERT INTO `tblproduct` VALUES ('1','냉장고',800,10,'LG','2022-01-06');
INSERT INTO `tblproduct` VALUES ('2','노트북',1200,20,'삼성','2022-01-06');
INSERT INTO `tblproduct` VALUES ('3','TV',1400,6,'LG','2022-01-06');
INSERT INTO `tblproduct` VALUES ('4','세탁기',1000,8,'LG','2022-01-06');
INSERT INTO `tblproduct`(`prdcode`,`prdname`,`prdprice`,`prdamount`) VALUES ('5','컴퓨터',1100,0);
INSERT INTO `tblproduct` VALUES ('6','휴대폰',900,102,'삼성','2022-01-06');

SELECT * FROM `tbluser`;

SELECT `username` FROM `tbluser`;

SELECT `username`,`userhp` from `tbluser`;

SELECT * from `tbluser`
WHERE `userid`='p102';

SELECT * FROM `tbluser` 
WHERE `userid`='p104' OR `userid`='p105';

SELECT * FROM `tbluser` 
WHERE `useraddr` ='부산시금정구';

SELECT * FROM `tbluser` 
WHERE `userage`>30;

SELECT * FROM `tbluser`
WHERE `userhp` Is NULL;

UPDATE `tbluser` SET `userage`=42
WHERE `userid`='p104';

UPDATE `tbluser` SET `useraddr`='경남김해시'
WHERE `userid` ='p105';

DELETE FROM `tbluser`
WHERE `userid`='p103';

SELECT * FROM `tblproduct`;

SELECT `prdname` FROM `tblproduct`;

SELECT `prdname`,`prdprice` FROM `tblproduct`;

SELECT * FROM `tblproduct` 
WHERE `prdcompany`='LG';

SELECT * FROM `tblproduct`
WHERE `prdcompany`='삼성';

UPDATE `tblproduct` SET 
`prdcompany` ='삼성',
`prdmakedate`='2021-01-01'
WHERE `prdcode`=5;



