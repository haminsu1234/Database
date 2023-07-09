# 날짜 : 2023/06/20
# 이름 : 하민수
# 내용 : 5. SQL 연습문제

#실습1-1
CREATE DATABASE `SHOP`;
CREATE USER 'admin'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON SHOP.*TO 'admin'@'%'; 

#실습 1-2
CREATE TABLE `customer`(
	`custid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR (10)  NOT NULL,
	`hp` VARCHAR(13) UNIQUE KEY DEFAULT NULL,
	`addr` VARCHAR(100) DEFAULT NULL,
	`rdate` DATE NOT null
);

CREATE TABLE `product`(
	`prodno` INT AUTO_INCREMENT PRIMARY KEY,
	`prodname` VARCHAR (10)  NOT NULL,
	`stock` INT DEFAULT 0 NOT NULL,
	`price` INT DEFAULT NULL,
	`company` VARCHAR(20) NOT null
);

DROP TABLE `product`;

CREATE TABLE `order`(
	`orderno` INT AUTO_INCREMENT PRIMARY KEY,
	`orderid` VARCHAR (10)  NOT NULL,
	`orderproduct` INT NOT NULL,
	`ordercount` INT  DEFAULT 1 NOT NULL,
	`orderdate` DATETIME  NOT null
);

#실습 1-3
INSERT INTO `customer` VALUES ('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
INSERT INTO `customer` VALUES ('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
INSERT INTO `customer` VALUES ('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
INSERT INTO `customer` VALUES ('c104','강감찬','010-1234-1004','서울시  마포구','2022-01-04');

INSERT INTO `customer` (`custid`,`name`,`rdate`) VALUES ('c105','이성계','2022-01-05');
INSERT INTO `customer` VALUES ('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
INSERT INTO `customer` (`custid`,`name`,`rdate`) VALUES ('c107','허준','2022-01-07');

INSERT INTO `customer` VALUES ('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
INSERT INTO `customer` VALUES ('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
INSERT INTO `customer` VALUES ('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

INSERT INTO `product` VALUES (1,'새우깡',5000,1500,'농심');
INSERT INTO `product`(`prodname`,`stock`,`price`,`company`) VALUES ('초코파이',2500,2500,'오리온');
INSERT INTO `product`(`prodname`,`stock`,`price`,`company`) VALUES ('포카칩',3600,1700,'오리온');
INSERT INTO `product`(`prodname`,`stock`,`price`,`company`) VALUES ('양파링',1250,1800,'농심');
INSERT INTO `product`(`prodname`,`stock`,`company`) VALUES ('죠리퐁',2200,'크라운');
INSERT INTO `product`(`prodname`,`stock`,`price`,`company`) VALUES ('마가렛트',3500,3500,'롯데');
INSERT INTO `product`(`prodname`,`stock`,`price`,`company`) VALUES ('뿌셔뿌셔',1650,1200,'오뚜기');

INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c102',3,2,'2022-07-01 13:15:10');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c101',4,1,'2022-07-01 14:16:11');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c108',1,1,'2022-07-01 17:23:18');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c109',6,5,'2022-07-02 10:46:36');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c102',2,1,'2022-07-03 09:15:37');

INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c101',7,3,'2022-07-03 12:35:12');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c110',1,2,'2022-07-03 16:55:36');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c104',2,4,'2022-07-04 14:23:23');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c102',1,3,'2022-07-04 21:54:34');
INSERT INTO `order`(`orderid`,`orderproduct`,`ordercount`,`orderdate`) VALUES ('c107',6,1,'2022-07-05 14:21:03');




SELECT * FROM `product`;

#실습 1-4
SELECT * FROM `customer`;

#실습 1-5
SELECT `custid`,`name`,`hp` FROM `customer`; 

#실습 1-6
SELECT * FROM `product`;

#실습 1-7
SELECT `company`FROM `product`;

#실습 1-8
SELECT DISTINCT(`company`) FROM `product`;


#실습 1-9
SELECT `prodname`,`price` FROM `product`;


#실습 1-10
SELECT `prodname`,`stock`+500 AS '조정단가' FROM `product`;


#실습 1-11
SELECT `prodname`,`stock`,`price` FROM `product`
WHERE company ='오리온';


#실습 1-12
 
 SELECT `orderProduct`, `orderCount`, `orderDate` FROM `Order` 
 WHERE `orderid`='c102';

#실습 1-13
SELECT `orderproduct`,`ordercount`,`orderdate` FROM `order`
WHERE orderid ='c102' AND ordercount>=2;

SELECT * FROM `order`;


#실습 1-14
SELECT * FROM `product` WHERE price BETWEEN 1000 AND 2000;

SELECT * FROM `product`;

#실습 1-15
SELECT `custid`,`name`,`hp`,`addr` FROM `customer`
WHERE `name` LIKE '김%';

#실습 1-6
SELECT `custid`,`name`,`hp`,`addr` FROM `customer`
WHERE `name` LIKE '__';

#실습 1-17
SELECT * FROM `customer`
WHERE `hp` IS NULL;

#실습 1-18
SELECT * FROM `customer`
WHERE `addr` IS NOT NULL;

#실습 1-19
SELECT * FROM `customer`
order BY `rdate` DESC;

#실습 1-20
SELECT * FROM `order`
WHERE ordercount >=3
order BY ordercount DESC;
order BY orderid DESC;


#실습 1-21
SELECT AVG(price) FROM `product`;


#실습 1-22
SELECT sum(stock) AS `재고량 합계` FROM `product`
WHERE `company` ='농심';

#실습 1-23
SELECT COUNT(custid) AS `고객수` FROM `customer`;



#실습 1-24
SELECT COUNT(DISTINCT(company))AS `제조업체수` FROM `product`;


#실습 1-25
SELECT `orderproduct` AS `주문상품번호`, SUM(`ordercount`) AS `총 주문수량`FROM `order`
GROUP BY `orderproduct` 
order BY `orderproduct`;

#실습 1-26

SELECT `company` AS `제조업체`,COUNT(*) AS `제품수`, MAX(`price`) AS `최고가` FROM `product`
GROUP BY `company`
order BY `company`;


#실습 1-27
SELECT `company` AS `제조업체`,COUNT(*) AS `제품수`, MAX(`price`) AS `최고가` FROM `product`
GROUP BY `company`
HAVING COUNT(*)>=2;

#실습 1-28
SELECT `orderproduct`,`orderid`, SUM(`ordercount`) AS `총 주문수량` FROM `order`
GROUP BY `orderproduct`,`orderid`
order BY `orderproduct` ASC;

#실습 1-29

SELECT a.orderId, b.prodName FROM `Order` AS a
JOIN `Product` AS b
ON a.orderProduct = b.prodNo
WHERE `orderid`='c102';


#실습 1-30
SELECT `orderid`, `name`, `prodName`, `orderDate` FROM `Order` AS a
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNo
WHERE SUBSTR(`orderDate`, 1, 10) = '2022-07-03';
