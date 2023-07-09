# 날짜 : 2023/06/22
# 이름 : 하민수
# 내용 : 7장 연습문제3

CREATE DATABASE `college`;
CREATE USER `admin3`@`%` IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON college.* TO `admin`@`%`;
FLUSH PRIVILEGES;

#3-1
CREATE TABLE `student`(
	`stdno` VARCHAR(8) PRIMARY KEY,
	`stdname` VARCHAR(20) NOT NULL,
	`stdhp` VARCHAR(13) UNIQUE KEY NOT NULL,
	`stdyear` INT NOT NULL,
	`stdaddress` VARCHAR(100) DEFAULT NULL
); 

DROP TABLE `student`;

CREATE TABLE `lecture`(
	`lecno` INT PRIMARY KEY,
	`lecname` VARCHAR(20) NOT NULL,
	`leccredit` INT NOT NULL,
	`lectime` INT NOT NULL,
	`lecclass` VARCHAR(10) DEFAULT NULL
);

DROP TABLE `lecture`;

CREATE TABLE `register`(
	`regstdno` VARCHAR(8) NOT NULL,
	`reglecno` INT NOT NULL,
	`regmidscore` INT DEFAULT NULL,
	`regfinalscore` INT default NULL,
	`regtotalscore` INT default NULL,
	`reggrade` VARCHAR(1) DEFAULT null
);

DROP TABLE `register`;

#3-3
INSERT INTO `student`(`stdno`,`stdname`,`stdhp`,`stdyear`) VALUES ('20201016','김유신','010-1234-1001',3);
INSERT INTO `student`VALUES ('20201126','김춘추','010-1234-1002',3,'경상남도 경주시');  
INSERT INTO `student`VALUES ('20210216','장보고','010-1234-1003',2,'전라남도 완도시');
INSERT INTO `student`VALUES ('20210326','강감찬','010-1234-1004',2,'서울시 영등포구');    
INSERT INTO `student`VALUES ('20220416','이순신','010-1234-1005',1,'부산시 부산진구');  
INSERT INTO `student`VALUES ('20220521','송상현','010-1234-1006',3,'부산시 동래구');  

INSERT INTO `lecture`VALUES (159,'인지행동심리학',3,40,'본304');  
INSERT INTO `lecture`VALUES (167,'운영체제론',3,25,'본B05'); 
INSERT INTO `lecture`VALUES (234,'중급 영문법',3,20,'본201'); 
INSERT INTO `lecture`VALUES (239,'세법개론',3,40,'본204'); 
INSERT INTO `lecture`VALUES (248,'빅데이터개론',3,20,'본B01'); 
INSERT INTO `lecture`VALUES (253,'컴퓨팅사고와 코딩',2,10,'본B02'); 
INSERT INTO `lecture`VALUES (349,'사회복지 마케팅',2,50,'본301'); 

INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20201126',234); 
INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20201016',248);
INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20201016',253);
INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20201126',239);
INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20210216',349);
INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20210326',349);
INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20201016',167);
INSERT INTO `register`(`regstdno`,`reglecno`)VALUES ('20220416',349);

#3-4
SELECT * FROM `lecture`;

#3-5
SELECT * FROM `student`;

#3-6
SELECT * FROM `register`;

#3-7
SELECT * FROM `student`
WHERE stdyear =3;

#3-8
SELECT * FROM `lecture`
WHERE leccredit =2;

#3-9
UPDATE `register` SET
`regmidscore` =36, `regfinalscore` =42
WHERE `regstdno`='20201126' AND `reglecno`=234;

UPDATE `register` SET
`regmidscore` =24, `regfinalscore` =62
WHERE `regstdno`='20201016' AND `reglecno`=248;

UPDATE `register` SET
`regmidscore` =28, `regfinalscore` =40
WHERE `regstdno`='20201016' AND `reglecno`=253;

UPDATE `register` SET
`regmidscore` =37, `regfinalscore` =57
WHERE `regstdno`='20201126' AND `reglecno`=239;

UPDATE `register` SET
`regmidscore` =28, `regfinalscore` =68
WHERE `regstdno`='20210216' AND `reglecno`=349;

UPDATE `register` SET
`regmidscore` =16, `regfinalscore` =65
WHERE `regstdno`='20210326' AND `reglecno`=349;

UPDATE `register` SET
`regmidscore` =18, `regfinalscore` =38
WHERE `regstdno`='20201016' AND `reglecno`=167;

UPDATE `register` SET
`regmidscore` =25, `regfinalscore` =58
WHERE `regstdno`='20220416' AND `reglecno`=349;

SELECT * FROM `register`;


#3-10
UPDATE `register` SET
	`regTotalScore`= `regMidScore` + `regFinalScore`,
	`regGrade` = if(`regTotalScore` >= 90, 'A',
	if(`regTotalScore` >= 80, 'B',
	if(`regTotalScore` >= 70, 'C',
	if(`regTotalScore` >= 60, 'D', 'F'))));

SELECT * FROM `register`;
#3-11
SELECT * FROM `register`
ORDER BY reggrade;


#3-12
SELECT * FROM `register`
WHERE reglecno = 349
ORDER BY reggrade;


#3-13
SELECT * FROM `lecture` 
WHERE lectime >=30;

#3-14
SELECT `lecname`,`lecclass` FROM `lecture`;


#3-15
SELECT `stdno`,`stdname` FROM `student`;


#3-16
SELECT * FROM `student`
WHERE stdaddress IS NULL;

#3-17
SELECT * FROM `student`
WHERE `stdaddress` LIKE '부산시%';



#3-18
SELECT * FROM `student` AS a
left JOIN `register` AS b ON a.stdno=b.regstdno;


#3-19
SELECT 
	`stdno`,
	`stdname`,
	`reglecno`,
	`regmidscore`,
	`regfinalscore`,
	`regtotalscore`,
	`reggrade`
FROM `student` AS a, `register` AS b 
WHERE a.stdno=b.regstdno;

#3-20
SELECT `stdname` , `stdno`,`reglecno` FROM `student` AS a
JOIN `register` AS b
ON a.stdno = b.regstdno
WHERE reglecno =349;

#3-21
SELECT 
	`stdno`,
	ANY_VALUE(`stdname`),
	COUNT(`stdno`) AS `수강신청건수`,
	SUM(`regtotalscore`) AS `종합점수`,
	SUM(`regtotalscore`) / COUNT(`stdno`) AS `평균`
FROM `student` AS a
JOIN `register` AS b
ON a.stdno = b.regstdno
GROUP BY `stdno`;

#3-22
SELECT * FROM `register` AS a
JOIN `lecture` AS b ON a.reglecno=b.lecno;

#3-23
SELECT 
	`regstdno`,
	`reglecno`,
	`lecname`,
	`regmidscore`,
	`regfinalscore`,
	`regtotalscore`,
	`reggrade`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo;

#3-24
SELECT 
	COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
	AVG(`regtotalscore`) AS `사회복지 마케팅 평균`
FROM `register` AS a JOIN `lecture` AS b ON a.reglecno=b.lecno
WHERE `lecName`='사회복지 마케팅';

#3-25
SELECT `regstdno`,`lecname` FROM `register` AS a 
JOIN `lecture` AS b ON a.reglecno=b.lecno
WHERE `reggrade` ='A';




#3-26
SELECT * FROM `student` AS a
JOIN `register` AS b ON a.stdno=b.regstdno
JOIN `lecture` AS c ON b.reglecno=c.lecno;





#3-27
SELECT 
	`stdno`,
	`stdname`,
	`lecno`,
	`lecname`,
	`regmidscore`,
	`regfinalscore`,
	`regtotalscore`,
	`reggrade`
FROM `student` AS a
JOIN `register` AS b ON a.stdno=b.regstdno
JOIN `lecture` AS c ON b.reglecno=c.lecno
ORDER BY `regtotalscore` desc;



#3-28
SELECT 
	`stdno`,
	`stdname`,
	`lecname`,
	`regtotalscore`,
	`reggrade`
FROM `student` AS a
JOIN `register` AS b ON a.stdno=b.regstdno
JOIN `lecture` AS c ON b.reglecno=c.lecno
WHERE `reggrade` ='F';



#3-29
SELECT 
	`stdno`,
	ANY_VALUE(`stdname`),
	SUM(`leccredit`)AS `이수학점`
FROM `student` AS a
JOIN `register` AS b ON a.stdno=b.regstdno
JOIN `lecture` AS c ON b.reglecno=c.lecno
WHERE `regTotalScore` >=60
GROUP BY `stdno`;




#3-30
SELECT 
	`stdno`,
	ANY_VALUE(`stdname`),
	GROUP_CONCAT(`lecname`)AS `신청과목`,
	GROUP_CONCAT(if(`regtotalscore`>=60, `lecname`,NULL)) AS `이수과목`
FROM `student` AS a
JOIN `register` AS b ON a.stdno=b.regstdno
JOIN `lecture` AS c ON b.reglecno=c.lecno
GROUP BY `stdno`;


