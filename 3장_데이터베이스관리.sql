# 날짜 : 2023/06/16
# 이름 : 하민수
# 내용 : 3. 데이터베이스 관리

#실습 3-1
CREATE USER 'test'@'%' IDENTIFIED BY '1234';

#실습 3-2
GRANT ALL PRIVILEGES ON `userdb`* TO 'test'@'%';
#실습 3-3
FLUSH PRIVILEGES;

#실습 3-1
CREATE DATABASE `testdb`;
CREATE USER 'tester'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `testdb`.*TO 'tester'@'%';
FLUSH PRIVILEGES;


#실습 3-2
ALTER USER 'tester'@'%' IDENTIFIED BY '12345';
DROP USER 'tester'@'%';
FLUSH privileges;

#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
#실습 3-1
