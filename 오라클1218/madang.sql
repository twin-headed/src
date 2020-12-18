DROP TABLE Book;
DROP TABLE Customer;
DROP TABLE Orders;
CREATE TABLE Book(
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);
CREATE TABLE Customer(
    custid  NUMBER(2) PRIMARY KEY,
    name    VARCHAR2(40),
    address VARCHAR2(50),
    phone   VARCHAR2(20)
);
CREATE TABLE Orders(
  orderid NUMBER(2) PRIMARY KEY,
  custid  NUMBER(2) REFERENCES Customer(custid),
  bookid  NUMBER(2) REFERENCES Book(bookid),
  saleprice NUMBER(8),
  orderdate DATE
);
CREATE TABLE Imported_Book(
    bookid      NUMBER,
    bookname    VARCHAR2(40),
    publisher   VARCHAR2(40),
    price       NUMBER(8)
);

INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (2, '축구아는 여자', '나무수', 13000);  
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (3, '축구의 이해', '대한미디어', 22000);    
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (4, '골프바이블', '대한미디어', 35000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (5, '피겨교본', '굿스포츠', 8000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (6, '역도 단계별기술', '굿스포츠', 6000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (7, '야구의 추억', '이상미디어', 20000);   
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (8, '야구를 부탁해', '이상미디어', 13000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (9, '올림픽 이야기', '삼성당', 7500); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (10, 'Olympic Champions', 'Person', 13000);   

  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(1, '박지성', '영국 멘체스터', '000-5000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(3, '장미란', '대한민국 강원도', '000-7000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(4, '추신수', '미국 클리브랜드', '000-8000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(5, '박세리', '대한민국 대전', NULL);  
  
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(1,1,1,6000,TO_DATE('2014-07-01', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(2,1,3,21000,TO_DATE('2014-07-03', 'yyyy-mm-dd'));  
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(3,2,5,8000,TO_DATE('2014-07-03', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(4,3,6,6000,TO_DATE('2014-07-04', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(5,4,7,20000,TO_DATE('2014-07-05', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(6,1,2,12000,TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(7,4,8,13000,TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(8,3,10,12000,TO_DATE('2014-07-08', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(9,2,10,7000,TO_DATE('2014-07-09', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(10,3,8,13000,TO_DATE('2014-07-10', 'yyyy-mm-dd'));  

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Person', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);
commit;  

SELECT *
  FROM Book;

SELECT *
  FROM Customer;

SELECT *
  FROM ORDERS;  

SELECT *
  FROM Imported_Book; 
  
--모든 도서의 이름과 가격을 검색하시오.
SELECT bookname,price
FROM Book
UNION
SELECT bookname,price
FROM imported_book
ORDER BY price;
--모든 도서의 도서번호, 도서이름,출판사,가격을 검색하시오.
SELECT bookname,price,bookid,publisher
FROM Book
UNION
SELECT bookname,price,bookid,publisher
FROM imported_book;
--도서 테이블에 있는 모든 출판사를 검색하시오.
SELECT publisher
FROM Book;
--가격이 20,000원 미만인 도서를 검색하시오.
SELECT bookname, price
  FROM Book
  WHERE price < 20000
ORDER BY price;
--가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
SELECT bookname, price
  FROM Book
  WHERE price BETWEEN 10000 AND 20000
ORDER BY price;
--출판사가 '굿스포츠'혹은 '대한미디어'인 도서를 검색하시오.
SELECT bookname
  FROM Book
 WHERE publisher IN('굿스포츠','대한미디어');
--'축구의 역사'를 출간한 출판사를 검색하시오.
SELECT publisher
  FROM Book
 WHERE bookname = '축구의 역사';
--도서이름에 '축구'가 포함한 출판사를 검색하시오.
SELECT publisher, bookname
  FROM Book
 WHERE bookname LIKE '%축구%';
--도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.
SELECT bookname
  FROM Book
 WHERE bookname LIKE '_구%';
--축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
SELECT bookname, price
  FROm Book
 WHERE bookname LIKE '%축구%'
    AND price >= 20000;
--도서를 이름순으로 검색하시오
SELECT bookname
  FROM Book
 ORDER BY bookname;
--도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
SELECT bookname, price
  FROM Book
 ORDER BY price, bookname;
--도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색한다.
SELECT bookname, price, publisher
  FROM Book
 ORDER BY price DESC, publisher ASC; 
--고객이 주문한 도서의 총 판매액을 구하시오.
SELECT sum(saleprice) 총판매액
  FROM ORDERS;
--2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT sum(saleprice)
  FROM orders
 WHERE custid = 2; 
--고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 구하시오
SELECT max(saleprice)
     , avg(saleprice)
     , min(saleprice)
     , sum(saleprice)
  FROM orders;
--마당서점의 도서 판매 건수를 구하시오.
SELECT count(orderid)
  FROM orders;
--고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
SELECT custid
     , count(orderid)
     , sum(saleprice)
  FROM orders
 GROUP BY custid;
--가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두권 이상 구매한 고객만 구한다.
SELECT custid
     , count(custid)
  FROM orders
 WHERE saleprice >= 8000
 GROUP BY custid
 HAVING count(orderid) >= 2;
--고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT *
  FROM customer c, orders o
 WHERE c.custid = o.custid;
--고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT *
  FROM customer c, orders o
 WHERE c.custid = o.custid
 ORDER BY c.custid;
--고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT c.name
     , o.saleprice
  FROM customer c, orders o
 WHERE c.custid = o.custid;
--고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT c.name
     , sum(o.saleprice)
  FROM customer c, orders o
 WHERE c.custid = o.custid
 GROUP BY c.name
 ORDER BY c.name;
--고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT b.bookname
     , c.name
  FROM Book b, orders o, customer c
 WHERE b.bookid = o.bookid
    AND c.custid = o.custid;
--가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT c.name
     , b.bookname
  FROM Book b, orders o, customer c
 WHERE b.bookid = o.bookid
    AND c.custid = o.custid
    AND o.saleprice = 20000;
--도서를 구매하지 않은 고객의 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT c.name
     , o.saleprice
  FROM orders o, customer c
 WHERE c.custid = o.custid(+);
--가장 비싼 도서의 이름을 보이시오.
SELECT bookname, price
  FROM book
 WHERE price = (SELECT MAX(price)
                  FROM book);
--도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT DISTINCT c.name
  FROM orders o, customer c
 WHERE c.custid = o.custid;
--대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT c.name
  FROM Book b, orders o, customer c
 WHERE b.bookid = o.bookid
    AND c.custid = o.custid
    AND b.publisher = '대한미디어';
--출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT publisher, bookname
  FROM book b1
 WHERE price > (SELECT AVG(price)
                  FROM book b2
                  WHERE b1.publisher = b2.publisher
                  GROUP BY publisher
                  );
--도서를 주문하지 않은 고객의 이름을 보이시오.
SELECT c.name
  FROM customer c, orders o
 WHERE c.custid = o.custid(+)
    AND o.custid IS NULL;

SELECT name
  FROM customer
MINUS
SELECT name
  FROM customer
 WHERE custid IN(SELECT custid
                    FROM customer);
--주문이 있는 고객의 이름과 주소를 보이시오.

SELECT name, address
  FROM customer
 WHERE custid IN(SELECT custid
                   FROM customer);
                   
CREATE TABLE NewBook (
  bookid    NUMBER,
  bookname  VARCHAR2(20),
  publisher VARCHAR2(20),
  price     NUMBER);
  
CREATE TABLE NewCustomer (
  custid    NUMBER CONSTRAINT NewCustomer_custid_pk PRIMARY KEY,
  name      VARCHAR2(40),
  address   VARCHAR2(40),
  phone     VARCHAR2(30));
  
CREATE TABLE NewOrder (
  orderid   NUMBER CONSTRAINT NewOrder_orderid_pk PRIMARY KEY,
  custid    NUMBER REFERENCES NewCustomer(custid) NOT NULL,
  bookid    NUMBER NOT NULL,
  saleprice NUMBER,
  orderdate DATE);

ALTER TABLE NewBook
ADD(isbn VARCHAR2(13));

ALTER TABLE NewBook
MODIFY(isbn NUMBER);

ALTER TABLE NewBook
DROP COLUMN isbn;

ALTER TABLE NewBook
MODIFY bookid NOT NULL;

ALTER TABLE NewBook
MODIFY bookid PRIMARY KEY;

DROP TABLE NewBook;

DROP TABLE NewOrder;

DROP TABLE NewCustomer;

 
 

 


 
 


  






