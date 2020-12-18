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
  VALUES (1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (2, '�౸�ƴ� ����', '������', 13000);  
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (3, '�౸�� ����', '���ѹ̵��', 22000);    
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (4, '�������̺�', '���ѹ̵��', 35000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (5, '�ǰܱ���', '�½�����', 8000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (6, '���� �ܰ躰���', '�½�����', 6000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (7, '�߱��� �߾�', '�̻�̵��', 20000);   
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (8, '�߱��� ��Ź��', '�̻�̵��', 13000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (9, '�ø��� �̾߱�', '�Ｚ��', 7500); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (10, 'Olympic Champions', 'Person', 13000);   

  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(1, '������', '���� ��ü����', '000-5000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(2, '�迬��', '���ѹα� ����', '000-6000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(3, '��̶�', '���ѹα� ������', '000-7000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(4, '�߽ż�', '�̱� Ŭ���귣��', '000-8000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(5, '�ڼ���', '���ѹα� ����', NULL);  
  
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
  
--��� ������ �̸��� ������ �˻��Ͻÿ�.
SELECT bookname,price
FROM Book
UNION
SELECT bookname,price
FROM imported_book
ORDER BY price;
--��� ������ ������ȣ, �����̸�,���ǻ�,������ �˻��Ͻÿ�.
SELECT bookname,price,bookid,publisher
FROM Book
UNION
SELECT bookname,price,bookid,publisher
FROM imported_book;
--���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
SELECT publisher
FROM Book;
--������ 20,000�� �̸��� ������ �˻��Ͻÿ�.
SELECT bookname, price
  FROM Book
  WHERE price < 20000
ORDER BY price;
--������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
SELECT bookname, price
  FROM Book
  WHERE price BETWEEN 10000 AND 20000
ORDER BY price;
--���ǻ簡 '�½�����'Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.
SELECT bookname
  FROM Book
 WHERE publisher IN('�½�����','���ѹ̵��');
--'�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
SELECT publisher
  FROM Book
 WHERE bookname = '�౸�� ����';
--�����̸��� '�౸'�� ������ ���ǻ縦 �˻��Ͻÿ�.
SELECT publisher, bookname
  FROM Book
 WHERE bookname LIKE '%�౸%';
--�����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻��Ͻÿ�.
SELECT bookname
  FROM Book
 WHERE bookname LIKE '_��%';
--�౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
SELECT bookname, price
  FROm Book
 WHERE bookname LIKE '%�౸%'
    AND price >= 20000;
--������ �̸������� �˻��Ͻÿ�
SELECT bookname
  FROM Book
 ORDER BY bookname;
--������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
SELECT bookname, price
  FROM Book
 ORDER BY price, bookname;
--������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ �˻��Ѵ�.
SELECT bookname, price, publisher
  FROM Book
 ORDER BY price DESC, publisher ASC; 
--���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT sum(saleprice) ���Ǹž�
  FROM ORDERS;
--2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT sum(saleprice)
  FROM orders
 WHERE custid = 2; 
--���� �ֹ��� ������ ���Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�
SELECT max(saleprice)
     , avg(saleprice)
     , min(saleprice)
     , sum(saleprice)
  FROM orders;
--���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.
SELECT count(orderid)
  FROM orders;
--������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT custid
     , count(orderid)
     , sum(saleprice)
  FROM orders
 GROUP BY custid;
--������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, �α� �̻� ������ ���� ���Ѵ�.
SELECT custid
     , count(custid)
  FROM orders
 WHERE saleprice >= 8000
 GROUP BY custid
 HAVING count(orderid) >= 2;
--���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
SELECT *
  FROM customer c, orders o
 WHERE c.custid = o.custid;
--���� ���� �ֹ��� ���� �����͸� ����ȣ ������ �����Ͽ� ���̽ÿ�.
SELECT *
  FROM customer c, orders o
 WHERE c.custid = o.custid
 ORDER BY c.custid;
--���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT c.name
     , o.saleprice
  FROM customer c, orders o
 WHERE c.custid = o.custid;
--������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
SELECT c.name
     , sum(o.saleprice)
  FROM customer c, orders o
 WHERE c.custid = o.custid
 GROUP BY c.name
 ORDER BY c.name;
--���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
SELECT b.bookname
     , c.name
  FROM Book b, orders o, customer c
 WHERE b.bookid = o.bookid
    AND c.custid = o.custid;
--������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
SELECT c.name
     , b.bookname
  FROM Book b, orders o, customer c
 WHERE b.bookid = o.bookid
    AND c.custid = o.custid
    AND o.saleprice = 20000;
--������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
SELECT c.name
     , o.saleprice
  FROM orders o, customer c
 WHERE c.custid = o.custid(+);
--���� ��� ������ �̸��� ���̽ÿ�.
SELECT bookname, price
  FROM book
 WHERE price = (SELECT MAX(price)
                  FROM book);
--������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT DISTINCT c.name
  FROM orders o, customer c
 WHERE c.custid = o.custid;
--���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT c.name
  FROM Book b, orders o, customer c
 WHERE b.bookid = o.bookid
    AND c.custid = o.custid
    AND b.publisher = '���ѹ̵��';
--���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
SELECT publisher, bookname
  FROM book b1
 WHERE price > (SELECT AVG(price)
                  FROM book b2
                  WHERE b1.publisher = b2.publisher
                  GROUP BY publisher
                  );
--������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
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
--�ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.

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

 
 

 


 
 


  






