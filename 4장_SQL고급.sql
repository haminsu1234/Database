# 날짜 : 2023/06/16
# 이름 : 하민수
# 내용 : 4.SQL 고급 실습하기


#4-1
CREATE TABLE `member`(
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10)  NOT NULL,
`hp` CHAR(13) UNIQUE key NOT NULL,
`pos` VARCHAR(10) DEFAULT '사원' NOT null,
`dep` INT DEFAULT NULL,
`rdate` DATETIME  NOT NULL
);

Drop TABLE `memeber`;

CREATE TABLE `department`(
`depno` INT PRIMARY KEY,
`name` VARCHAR(10) NOT NULL,
`tel` CHAR(12) NOT NULL
);

CREATE TABLE `sales`(
`seq` INT AUTO_INCREMENT PRIMARY KEY,
`uid` VARCHAR(10) NOT NULL,
`year` YEAR NOT NULL,
`month` TINYINT NOT NULL,
`sale` INT NOT NULL
);




#4-2
insert INTO `MEMBER`  VALUES ('a101','박혁거세','010-123-1001','부장',101,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a102','김유신','010-123-1002','차장',101,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a103','김춘추','010-123-1003','사원',101,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a104','장보고','010-123-1004','대리',102,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a105','강감찬','010-123-1005','과장',102,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a106','이성계','010-123-1006','차장',103,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a107','정철','010-123-1007','차장',103,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a108','이순신','010-123-1008','부장',104,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a109','허균','010-123-1009','부장',104,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a110','정약용','010-123-1010','사원',105,'2023-06-15 16:22:13');
insert INTO `MEMBER`  VALUES ('a111','박지원','010-123-1011','사원',105,'2023-06-15 16:22:13');

select * FROM `member`;

insert into `department` values(101,'영업1부','051-512-1001');
insert into `department` values(102,'영업2부','051-512-1002');
insert into `department` values(103,'영업3부','051-512-1003');
insert into `department` values(104,'영업4부','051-512-1004');
insert into `department` values(105,'영업5부','051-512-1005');
insert into `department` values(106,'영업지원부','051-512-1006');
insert into `department` values(107,'인사부','051-512-1007');

SELECT * FROM department;

insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a101','2018',1,98100);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a102','2018',1,136000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a103','2018',1,80100);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a104','2018',1,78000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a105','2018',1,93000);

insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a101','2018',2,23500);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a102','2018',2,126000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a103','2018',2,18500);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a105','2018',2,19000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a106','2018',2,53000);

insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a101','2019',1,24000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a102','2019',1,109000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a103','2019',1,101000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a104','2019',1,53500);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a107','2019',1,24000);

insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a102','2019',2,160000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a103','2019',2,101000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a104','2019',2,43000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a105','2019',2,24000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a106','2019',2,109000);

insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a102','2020',1,201000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a104','2020',1,63000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a105','2020',1,74000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a106','2020',1,122000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a107','2020',1,111000);

insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a102','2020',2,120000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a103','2020',2,93000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a104','2020',2,84000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a105','2020',2,180000);
insert into `sales`(`uid`,`year`,`month`,`sale`) values ('a108','2020',2,76000);

DROP TABLE sales2;

SELECT * FROM sales;

#4-2
SELECT * FROM member
WHERE `name` ='김유신';

SELECT * FROM `member`
WHERE `pos` ='차장' AND dep=101;

SELECT * FROM `member`
WHERE `pos` = '차장' OR dep=101;

SELECT * FROM `member`
WHERE `name` <> '김춘추';

SELECT * FROM `member`
WHERE `pos` = '사원' OR `pos` ='대리';

SELECT * FROM `member`
WHERE `pos` IN('사원','대리');

SELECT * FROM `member`
WHERE `dep` IN(101,102,103);

SELECT * FROM `member`
WHERE `name` LIKE '%신' ;

SELECT * FROM `member`
WHERE `name` LIKE '김%';

SELECT * FROM `memeber`
WHERE `name` LIKE '김__'


SELECT * FROM `member`
WHERE `name` LIKE '정_';


SELECT * FROM `sales`
WHERE `sale`  >50000;

SELECT * FROM `sales`
WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;

SELECT * FROM `sales`
WHERE `sale` BETWEEN 50000 AND 100000;

#4-1
SELECT * FROM `sales`
ORDER BY `sale`;

SELECT * FROM `sales`
ORDER BY `sale` ASC;

SELECT * FROM `sales`
ORDER BY `sale` DESC;

SELECT * FROM `sales`
WHERE `sale` > 50000
ORDER BY `sale` DESC;

SELECT * FROM `sales`
WHERE `sale` > 50000
ORDER BY 
	`year` ASC,
	`month` ASC,
	`sale` DESC;
#4-1

SELECT * FROM `sales`
LIMIT 3;

SELECT * FROM `sales`
LIMIT 0,3;

SELECT * FROM `sales`
LIMIT 1,2;

SELECT * FROM `sales`
LIMIT 5,3;

SELECT * FROM `sales`
WHERE `sale` > 50000
ORDER BY 
	`year` DESC,
	`month`,
	`sale` DESC
LIMIT 5;

#4-6

SELECT SUM(`sale`) AS `합계` FROM `sales`; 

SELECT AVG(`sale`) AS `평균` FROM `sales`;

SELECT COUNT(*) AS `갯수` FROM `sales`;

SELECT SUBSTRING(`hp`,10,4) AS `전화번호 끝자리` FROM `member`;

INSERT INTO `member` VALUES ('b101','을지문덕','010-5555-1234','사장',107,NOW());


#4-7
SELECT SUM(sale) AS `합계` FROM `sales`
WHERE `year` = 2018 AND `MONTH` =1;

#4-8
SELECT SUM(sale), AVG(sale) FROM `sales`
WHERE `year` = 2019 AND `MONTH` =2 AND `sale` >= 50000;

#4-9


SELECT VERSION();
#4-10
SELECT `uid` FROM `sales` 
GROUP BY `uid`;

SELECT `year` From `sales`
GROUP BY `year`;

SELECT `uid` ,`year` FROM `sales` 
GROUP BY `year`,`uid`;

SELECT `uid`,`year`,SUM(sale) AS `합계` FROM `sales`
GROUP BY `uid`,`year`;

SELECT `uid`,`year`,SUM(sale) AS `합계` FROM `sales`
WHERE `sale` >=50000
GROUP BY `uid`,`year`
ORDER BY `합계` DESC;

#4-11
SELECT `uid`,`year`,SUM(sale) AS `합계` FROM `sales`
WHERE `sale` >=50000
GROUP BY `uid`,`year`
HAVING `합계` >=200000
ORDER BY `합계` DESC;

#4-12
CREATE TABLE `sales2` LIKE `sales`;

INSERT INTO `sales2` SELECT * FROM `sales`;

UPDATE `sales2` SET 
`year` =`year`+3;

SELECT * FROM  `sales` union 
SELECT * FROM  `sales`;

SELECT  `uid`,`year`,`sale`FROM `sales`
UNION
SELECT `uid`,`year`,`sale` FROM `sales2`;

SELECT `uid`,`year`,SUM(sale) AS `합계` FROM `sales`
GROUP BY `uid`,`year`
UNION
SELECT `uid`,`year`,SUM(sale) AS `합계` FROM `sales`
GROUP BY `uid`,`year`
ORDER BY `year` ASC, `합계` DESC;


#4-13
SELECT * FROM `sales` 
inner JOIN `member`
ON `sales`.uid = `member`.uid;

SELECT * FROM `member`
inner JOIN `department`
ON `member`.dep = `department`.depno;

SELECT * FROM `sales` AS a
JOIN `member` AS b
ON a.uid=b.uid;

SELECT * FROM `member` AS a
JOIN `department` AS b
ON a.dep = b.depno;

SELECT  * FROM `sales` AS a, `member` AS b 
WHERE a.uid =b.uid;

SELECT * FROM `member` AS a, `department` AS b
WHERE a.dep =b.depno;

SELECT a.`seq`, a.`uid`,`sale`,`name`,`pos` FROM `sales` AS a
JOIN `member` AS b 
ON a.`uid`=b.`uid`;

SELECT a.`seq`, a.`uid`,`sale`,`name`,`pos` FROM `sales` AS a
JOIN `member` AS b
USING(`uid`);

SELECT a.`seq`,a.`uid`,`sale`,`name`,`pos` FROM `sales` AS a
JOIN `member` AS b
ON a.`uid`=b.`uid`
WHERE `sale` >= 100000;

SELECT * FROM `sales` AS a
JOIN `member` AS b ON a.uid=b.uid
JOIN `department` AS c ON b.dep=c.depno;

SELECT a.`seq`,a.`uid`,a.`sale`,b.`name`,b.`pos`,c.`name` FROM `sales` AS a
JOIN `member` AS b ON a.uid=b.uid
JOIN `department` AS c ON b.dep=c.depno;

#4-14
INSERT INTO `sales` (`uid`,`year`,`month`,`sale`) VALUES ('p101',2018,1,35000);

SELECT * FROM `sales` AS a LEFT JOIN `member`AS b ON a.uid=b.uid;

SELECT * FROM `sales` AS a RIGHT JOIN `member` AS b ON a.uid=b.uid;

#4-15
SELECT a.`uid`,a.`name`,a.`pos`,`dep` FROM `member` AS a
JOIN `department` AS b
ON a.dep=b.depno;



#4-16
SELECT a.`name`,`year`,SUM(sale) FROM `member` AS a
JOIN `sales` AS b
ON a.uid=b.uid
WHERE YEAR =2019 AND `name`='김유신'
GROUP BY a.`name`,`year`;


#4-17
SELECT b.`name`,c.`name`,b.`pos`,`year`,SUM(sale) AS `합계` FROM `sales` AS a
JOIN `member` AS b ON a.uid=b.uid 
JOIN `department` AS c on b.dep=c.depno
WHERE `sale` >= 50000 AND `year` = 2019
GROUP BY b.`name`,c.`name`,b.`pos`,`year
HAVING `합계` >=100000
ORDER BY SUM(sale) DESC;
