/* p226
1. ���̺� �����͸� �߰��ϴ� INSERT��

-DML(������ ���۾� : DATA Mnipulation Language)�� ���̺� �����͸� ����, ���� �����ϱ� ���� ��ɾ� �����̴�.
-INSERT���� ���̺� �����͸� �Է��ϱ� ���� ��ɹ��̴�.

- [����]
    INSERT INTO ���̺��(�÷���1,..�÷Ÿ�N)
    VALUES(��1,..��N) -- �÷�������� �÷��� ���ϴ� ���� ����
    -- ����� �÷����� ���� ����, ����, ������ Ÿ���� ��ġ�ؾ��Ѵ�.
    -- INTO ���� �÷��� ������� ������, ���̺��� ������ �� ������ �÷������� ������ ������� �Էµȴ�.
    -- �ѹ��� �ϳ��� �ุ INTO �ڿ� ����� ���̺� ���Եȴ�.
    -- ������ Ÿ���� ���ڿ� ��¥�� ��쿡�� �ݵ�� ��������ǥ('')�� ����ؾ� �Ѵ�. 
    -- COMMIT : �����ͺ��̽��� ���������� �����͸� �����ϴ� ��ɹ�
    --ROLLBACK : �Է�,����,������ ��ҽ�, COMMIT ���� ROLLBACK�� �ؾ��Ѵ�.
*/

DROP TABLE play_tab;
CREATE TABLE play_tab(
    play_code   NUMBER(3) PRIMARY KEY, -- NOT NULL, UNIQUE, �ĺ��� ����
    play_name   VARCHAR2(50) NOT NULL,  -- ���̸�
    play_place  VARCHAR2(50) NOT NULL,  -- ���
    play_price  NUMBER(8) DEFAULT 0,    -- ����
    play_number NUMBER(5) DEFAULT 0,    -- �����ο���
    play_date   DATE DEFAULT sysdate    -- ������
);


-- 1, ���̵���, ���, 40000, 2
-- 2, ����Ÿ��, ����, 50000, 2
-- 3, ��Ż�����, ȫ��, 40000, 2
-- 4, VR, ����, 30000, 3
-- 5, �ǳ� ��ī�̴��̺�, ����, 100000, 2

INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(1, '���̵���', '���', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(2, '����Ÿ��', '����', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(3, '��Ż��', 'ȫ��', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(4, 'VR', '����', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(5, '�ǳ���ī�̴��̺�', '����', 40000, 2,'');

COMMIT;

INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(6, '�ǳ���ī�̴��̺�', '����', 40000, 2,'');
ROLLBACK;

SELECT * FROM play_tab;

/*
���1) �����͸� ������ ���̺� ������ ������ �� �����͸� INSERT
play_tab_copy
*/
CREATE TABLE play_tab_copy2
AS 
SELECT * FROM play_tab
WHERE 0=1;

SELECT * FROM play_tab;

INSERT INTO play_tab_copy2
SELECT *
    FROM play_tab;
COMMIT;

/*
���2) ������, ���̺��� ��� ������ �� �����͸� INSERT
play_tab_copy2
*/
CREATE TABLE play_tab_copy
AS 
 SELECT * FROM play_tab;

SELECT * FROM play_tab_copy;

/* p232
2. ���̺��� ������ �����ϴ� UPDATE��

- UPDATE���� ���̺� ����� �����͸� �����ϱ� ���� DML�̴�.
- ���ǻ��� : KEY�� �������� �ʴ´�.(DELETE�� �� INSERT�Ѵ�.)

[����]
UPDATE ���̺��
    SET �÷�1 = ��1, �÷�2 = ��2,.. �÷�n=��n
WHERE ���ǽ�;
*/

-- play_code 5�� => ��� : ����, �ο���: 5, ���� : 2020/12/12 ����
UPDATE play_tab
SET play_place = '����', play_number = 5, play_date = '2020/12/12'
WHERE play_code = 5;
COMMIT;
-- play_code 45�� => ��� : ���ǵ���, ���� 5����, �����ο��� : 10, ���� : 2020/12/10 ����
UPDATE play_tab
SET play_name = '���ǵ���', play_price = 50000, play_date = '2020/12/10', play_number = 10
WHERE play_code = 4;
COMMIT;


/*
2-1. �ٸ� ���̺��� ������� ������ �����ϱ�
-UPDATE ���� SET������ ���������� ����ϸ�, ���������� ������ ����� ������ ����ȴ�.
*/
--play_code 3�� => ���ǵ���, ���� : 50000 , �ο��� : 10, ���� : 2020/12/10 ����
SELECT * FROM menu_tbl_copy;
-- 3�� food_name, 5�� food_price�� �о 1�� food_name, food_price�� ����
UPDATE menu_tbl_copy
  SET food_name = (SELECT food_name
                    FROM menu_tbl_copy
                    WHERE food_code ='3')
    , food_price = (SELECT food_price
                    FROM menu_tbl_copy
                    WHERE food_code='5')
    WHERE food_code = 2;
COMMIT;

UPDATE menu_tbl_copy
  SET (food_name,food_price) = (SELECT food_name,food_price
                    FROM menu_tbl_copy
                    WHERE food_code ='4')
   WHERE food_code = '1';
COMMIT;

/* p234
    3. ���̺��� ������ �����ϴ� DELETE��
    - DELETE���� ����Ͽ� ������ ����� �����͸� ������ �� �ִ�.
    - WHERE ���� �����ϸ� ���̺� �ִ� ��� �ष�� �����ȴ�.
    
    [����]
    DELETE[FROM] ���̺��
    WHERE ����;
*/
-- D : menu_tbl_copy => food_code '1'�� ������ ����
    DELETE menu_tbl_copy
    where food_code = 1;
-- I : menu_tbl_copy => food_code '1'�� ������ �Է� [1,'���õ��','ko','���̵���',7000, 2, 20/12/13
    INSERT INTO menu_tbl_copy (food_code, restaurant_name, food_kind, food_name, food_price, starpoint, start_date)
    VALUES (1,'���õ��','ko','���̵���',7000, 2, '20/12/13');
    
-- U : menu_tbl_copy => food_code '5'�� ������ ���� [5, '�����强','ch','��ä����',6000,2, 20/12/13
    UPDATE menu_tbl_copy
    SET food_code = 1, restaurant_name = '�����强', food_kind = 'ch' , food_name = '��ä����' , food_price = 6000, starpoint = 2, start_date = ''
    WHERE food_code = 5;
-- D : menu_tbl_copy => food_name '������ ������ ������ ����
    DELETE menu_tbl_copy
    WHERE food_name LIKE '%����%';




