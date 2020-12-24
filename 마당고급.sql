-- 3-44 Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
INSERT INTO Book
VALUES(11,'스포츠의학','한솔의학서적',90000);

-- 3-45 Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO Book(bookid,bookname,publisher)
VALUES(12,'스포츠의학','한솔의학서적');

--3-46 수입도서 목록(Imported_book)을 Book 테이블에 모두 삽입하시오.
--(Imported_book 테이블은 스크립트 Book 테이블과 같이 이미 만들어져 있음)

INSERT INTO BOOK
SELECT * FROM imported_book;

--3-47 Customer 테이블에 고객번호가 5인 
--고객의 주소를 '대한민국 부산'으로 변경하시오.
UPDATE CUSTOMER
SET address='대한민국 부산'
WHERE custid=5;

SELECT * FROM CUSTOMER;

--3-48 Customer 테이블에서 박세리 고개의 주소를 김연아 고객의 주소로 변경하시오.
UPDATE CUSTOMER
SET address=(SELECT address
            FROM customer
            WHERE name='김연아')
WHERE name='박세리';

--3-49 Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE CUSTOMER
WHERE custid=5;

--3-50 모든 고객을 삭제하시오.
TRUNCATE TABLE CUSTOMER;

--4-1 -78과 +78의 절댓값을 구하시오.

--4-2 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오.
SELECT ROUND(4.875,1)
FROM DUAL;

--4-3 고객별 평균 주문 금액을 백 원 단위로 반올림한 값을 구하시오.
SELECT custid, ROUND(AVG(saleprice),-2)
FROM ORDERS
GROUP BY custid;

--4-4 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
UPDATE BOOK
SET bookname = '농구'
WHERE bookname LIKE '%야구%';

SELECT *
FROM customer;

--4-5 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수를 확인하시오.
--    (한글은 2바이트 혹은 UNICODE 경우는 3바이트를 차지함)
SELECT bookname, LENGTH(bookname)
FROM book
WHERE publisher = '굿스포츠';

--4-6 마당서점의 고객 중에서 
--같은 성을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
SELECT SUBSTR(name,1,1),count(SUBSTR(name,1,1))
FROM CUSTOMER
WHERE SUBSTR(name,1,1)IN(SELECT SUBSTR(name,1,1)
                         FROM CUSTOMER)
GROUP BY SUBSTR(name,1,1);

--4-7 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT ORDERDATE+10
FROM ORDERS;
--마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 
--단 주문일은 'yyyy-mm-dd 요일' 형태로 표시한다.
SELECT ORDERID
     , CUSTID
     , BOOKID
     , TO_CHAR(orderdate,'yyyy-mm-dd')
FROM  ORDERS
WHERE orderdate = '2014/7/7';
--DBMS 서버에 설정된 현재 시간과 오늘 날짜를 확인하시오.
SELECT to_char(sysdate,'YYYY-mm-dd, HH24:MI:SS')
FROM dual;
    

                         




    
    








