-- 3-44 Book ���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�. ������ ������ �Ѽ����м������� �Ⱓ������ ������ 90,000���̴�.
INSERT INTO Book
VALUES(11,'����������','�Ѽ����м���',90000);

-- 3-45 Book ���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�. ������ ������ �Ѽ����м������� �Ⱓ������ ������ �����̴�.
INSERT INTO Book(bookid,bookname,publisher)
VALUES(12,'����������','�Ѽ����м���');

--3-46 ���Ե��� ���(Imported_book)�� Book ���̺� ��� �����Ͻÿ�.
--(Imported_book ���̺��� ��ũ��Ʈ Book ���̺�� ���� �̹� ������� ����)

INSERT INTO BOOK
SELECT * FROM imported_book;

--3-47 Customer ���̺� ����ȣ�� 5�� 
--���� �ּҸ� '���ѹα� �λ�'���� �����Ͻÿ�.
UPDATE CUSTOMER
SET address='���ѹα� �λ�'
WHERE custid=5;

SELECT * FROM CUSTOMER;

--3-48 Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
UPDATE CUSTOMER
SET address=(SELECT address
            FROM customer
            WHERE name='�迬��')
WHERE name='�ڼ���';

--3-49 Customer ���̺��� ����ȣ�� 5�� ���� �����Ͻÿ�.
DELETE CUSTOMER
WHERE custid=5;

--3-50 ��� ���� �����Ͻÿ�.
TRUNCATE TABLE CUSTOMER;

--4-1 -78�� +78�� ������ ���Ͻÿ�.

--4-2 4.875�� �Ҽ� ù° �ڸ����� �ݿø��� ���� ���Ͻÿ�.
SELECT ROUND(4.875,1)
FROM DUAL;

--4-3 ���� ��� �ֹ� �ݾ��� �� �� ������ �ݿø��� ���� ���Ͻÿ�.
SELECT custid, ROUND(AVG(saleprice),-2)
FROM ORDERS
GROUP BY custid;

--4-4 �������� �߱��� ���Ե� ������ �󱸷� ������ �� ���� ����� ���̽ÿ�.
UPDATE BOOK
SET bookname = '��'
WHERE bookname LIKE '%�߱�%';

SELECT *
FROM customer;

--4-5 �½��������� ������ ������ ����� ������ ���� ���� Ȯ���Ͻÿ�.
--    (�ѱ��� 2����Ʈ Ȥ�� UNICODE ���� 3����Ʈ�� ������)
SELECT bookname, LENGTH(bookname)
FROM book
WHERE publisher = '�½�����';

--4-6 ���缭���� �� �߿��� 
--���� ���� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
SELECT SUBSTR(name,1,1),count(SUBSTR(name,1,1))
FROM CUSTOMER
WHERE SUBSTR(name,1,1)IN(SELECT SUBSTR(name,1,1)
                         FROM CUSTOMER)
GROUP BY SUBSTR(name,1,1);

--4-7 ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT ORDERDATE+10
FROM ORDERS;
--���缭���� 2014�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. 
--�� �ֹ����� 'yyyy-mm-dd ����' ���·� ǥ���Ѵ�.
SELECT ORDERID
     , CUSTID
     , BOOKID
     , TO_CHAR(orderdate,'yyyy-mm-dd')
FROM  ORDERS
WHERE orderdate = '2014/7/7';
--DBMS ������ ������ ���� �ð��� ���� ��¥�� Ȯ���Ͻÿ�.
SELECT to_char(sysdate,'YYYY-mm-dd, HH24:MI:SS')
FROM dual;
    

                         




    
    








