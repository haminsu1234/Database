## 날짜 : 2023/06/23
# 이름 : 하민수
# 내용 : 7. SQL 연습문제

#4-1
CREATE DATABASE `bookstore`;
CREATE USER `admin4`@`%` IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `bookstore`.* TO `admin4`@`%`;
FLUSH PRIVILEGESbookstore;

#4-2
CREATE TABLE `customer` (
`custid` INT AUTO_INCREMENT PRIMARY key,
`name` VARCHAR(10) NOT NULL,
`address` VARCHAR(20) DEFAULT NULL,
`phone` VARCHAR(13) DEFAULT null
);

DROP TABLE `customer`;

CREATE TABLE `BOOK`(
`bookid` INT PRIMARY key,
`bookname` VARCHAR(20) NOT NULL,
`publisher` VARCHAR(20) NOT NULL,
`price` INT DEFAULT null
);

DROP TABLE `book`;

CREATE TABLE `order`(
`orderid` INT AUTO_INCREMENT PRIMARY KEY,
`custid` INT NOT NULL,
`bookid` INT NOT NULL,
`saleprice` INT NOT NULL,
`orderdate` DATE NOT null 
);

#4-3
INSERT INTO `customer` VALUES (1,'박지성','영국맨체스타','000-5000-0001');
INSERT INTO `customer` VALUES (2,'김연아','대한민국 서울','000-6000-0001');
INSERT INTO `customer` VALUES (3,'장미란','대한믹구 강원도','000-7000-0001');
INSERT INTO `customer` VALUES (4,'추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `customer`(`name`,`address`) VALUES ('박지성','대한민국 대전');

INSERT INTO `book` VALUES (1,'축구의 역사','굿스포츠',7000);
INSERT INTO `book` VALUES (2,'축구아는 여자','나무수',13000);
INSERT INTO `book` VALUES (3,'축구의 이해','대한미디어',22000);
INSERT INTO `book` VALUES (4,'골프 바이블','대한미디어',35000);
INSERT INTO `book` VALUES (5,'피겨교본','굿스포츠',8000);

INSERT INTO `book` VALUES (6,'역도 단계별 기술','굿스포츠',6000);
INSERT INTO `book` VALUES (7,'야구의 추억','이상미디어',20000);
INSERT INTO `book` VALUES (8,'야구를 부탁해','이상미디어',13000);
INSERT INTO `book` VALUES (9,'올림픽 이야기','삼성당',7500);
INSERT INTO `book` VALUES (10,'Olympic Champions','Pearson',13000);

INSERT INTO `order` VALUES (1,1,1,6000,'2014-07-01');
INSERT INTO `order` VALUES (2,1,3,21000,'2014-07-03');
INSERT INTO `order` VALUES (3,2,5,8000,'2014-07-03');
INSERT INTO `order` VALUES (4,3,6,6000,'2014-07-04');
INSERT INTO `order` VALUES (5,4,7,20000,'2014-07-05');

INSERT INTO `order` VALUES (6,1,2,12000,'2014-07-07');
INSERT INTO `order` VALUES (7,4,8,13000,'2014-07-07');
INSERT INTO `order` VALUES (8,3,10,12000,'2014-07-08');
INSERT INTO `order` VALUES (9,2,10,7000,'2014-07-09');
INSERT INTO `order` VALUES (10,3,8,13000,'2014-07-10');



#4-4
SELECT `custid`,`name`,`address` FROM `customer`;


#4-5
SELECT `bookname`,`price` FROM `book`;

#4-6
SELECT `price`,`bookname` FROM `book`;

#4-7
SELECT * FROM `book`;


#4-8
SELECT `publisher` FROM `book`;


#4-9
SELECT DISTINCT `publisher` FROM `book`;


#4-10
SELECT * FROM `book`
WHERE price >=20000;

#4-11
SELECT * FROM `book`
WHERE price <20000;

#4-12
SELECT * FROM `book`
WHERE price BETWEEN 10000 AND 20000;

#4-13
SELECT `bookid`,`bookname`,`price` FROM `book`
WHERE price BETWEEN 15000 AND 30000;

#4-14
SELECT * FROM `book`
WHERE bookid IN(2,3,5);


#4-15
SELECT * FROM `book`
WHERE bookid%2 =0;


#4-16
SELECT * FROM `customer`
WHERE `name` LIKE '박%';



#4-17
SELECT * FROM `customer`
WHERE `address` LIKE '대%';


#4-18
SELECT * FROM `customer`
WHERE `phone` IS NOT null;

#4-19
SELECT * FROM `book`
WHERE publisher ='굿스포츠' OR `publisher`='대한미디어';


#4-20
SELECT `publisher` FROM `book`
WHERE `bookname` = '축구의 역사';

#4-21
SELECT `publisher` FROM `book`
WHERE `bookname` LIKE  '%축구%';

#4-22
SELECT * FROM `book`
WHERE `bookname` LIKE '_구%';
#4-23
SELECT * FROM `book`
WHERE `price`>=20000 AND `bookname` LIKE  '%축구%';

#4-24
SELECT * FROM `book`
ORDER BY `bookname`;

#4-25
SELECT * FROM `book`
ORDER BY `price`,`bookname`;


#4-26
SELECT * FROM `book`
ORDER BY `price` DESC, `publisher`;

#4-27
SELECT * FROM `book`
ORDER BY `price` DESC
LIMIT 3;



#4-28
SELECT * FROM `book`
ORDER BY `price` asc
LIMIT 3;


#4-29
SELECT SUM(saleprice) AS `총판매액` FROM `order`;



#4-30
SELECT 
	SUM(saleprice) AS `총판매액`, 
	AVG(saleprice) AS `평균값`,
	min(saleprice) AS `최저가`,
	max(saleprice) AS `최고가`		
FROM `order`;

#4-31
SELECT COUNT(*) AS `판매건수` FROM `order`;
# * 또는 orderid로 
#4-32
SELECT `bookid`, REPLACE(`bookname`,'야구','농구') AS `bookname`
	,`publisher`
	,`price`
FROM `book`;

#4-33
SELECT `custid`,COUNT(*) AS `수량` FROM `order`
WHERE saleprice >=8000
GROUP BY `custid`
HAVING COUNT(*)>=2
ORDER BY custid;

#4-34
SELECT * FROM `customer` AS a
JOIN `order` AS b ON a.custid=b.custid;
ORDER BY a.custid;
#4-35
SELECT * FROM `customer` AS a
JOIN `order` AS b ON a.custid=b.custid
ORDER BY a.`custid`;



#4-36
SELECT `name`,`saleprice` FROM `customer` AS a
JOIN `order` AS b ON a.custid=b.custid
ORDER BY a.custid;



#4-37
SELECT `name`,SUM(saleprice) FROM `customer` AS a
JOIN `order` AS b ON a.custid=b.custid
GROUP BY `name`
ORDER BY `name`;


#4-38

SELECT `name` ,`bookname`FROM `customer` AS a, `order` AS b,`book` AS c 
WHERE a.custid=b.custid AND b.bookid=c.bookid
ORDER BY a.custid ASC;

#4-39
SELECT `name` ,`bookname`FROM `customer` AS a, `order` AS b,`book` AS c 
WHERE a.custid=b.custid AND b.bookid=c.bookid AND b.saleprice = 20000;
ORDER BY a.`custid` ASC;


#4-40
SELECT `NAME`, `SALEPRICE` FROM `customer` AS a
left JOIN `order` AS b ON a.custid = b.custid;


#4-41
SELECT  SUM(`SALEPRICE`) AS `총매출` FROM `customer` AS a
left JOIN `order` AS b ON a.custid = b.custid
WHERE `name` = '김연아'bookstore;

#4-42

SELECT `bookname` FROM `book`
WHERE `price`=(SELECT MAX(`price`) FROM `book`);


#4-43
SELECT `NAME` FROM `customer` AS a
left JOIN `order` AS b ON a.custid = b.custid
WHERE saleprice IS NULL;

#4-44
INSERT INTO `book`(`bookid`,`bookname`,`publisher`) VALUES(11,'스포츠의학','한솔의학서적');

#4-45
UPDATE `customer` SET
`address`='대한민국 부산'
WHERE custid =5;

#4-46
DELETE FROM `customer` 
WHERE `custid` = 5;

SELECT * FROM `customer`;

#4-30

