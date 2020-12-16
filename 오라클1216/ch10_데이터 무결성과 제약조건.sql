/* 6���� ���� 1:00
10��. ������ ���Ἲ�� �������� - �߿�, ����

1. ��������
���������̶� ���̺� ��ȿ���� ���� (��������) �����Ͱ� �ԷµǴ� ����
�����ϱ� ���ؼ� ���̺� ������ �� �÷��� ���� �����ϴ� ��Ģ�̴�.

Oracle�� �������� ����
����                  ����
NOT NULL - �÷��� NULL���� �������� ���ϵ��� �����Ѵ�.
UNIQUE - ���̺��� ��� �ο쿡 ���ؼ� ������ ���� ������ �Ѵ�.
PRIMARY KEY - ���̺��� �� ���� �ĺ��ϱ� ���� ������ NULL�� �ߺ��� ���� ��� ������� �ʴ´�.
            ��, NOT NULL ���� + UNIQUE
FOREIGN KEY - �����Ǵ� ���̺� �÷����� �׻� �����ؾ� �Ѵ�.
CHECK - ���� ������ ������ ���� ������ ������ �����Ͽ� ������ ������ ����Ѵ�.

�������Ǹ� : �ߺ��� ������� �ʴ´�.(�����ؾ��Ѵ�.) ���̺��_�÷���_Ű �ߺ����x
- �������ǿ� ���� INSERT, DELETE.. �߿�(INSERT�� �θ����̺����, DELETE�� �ڽ����̺����)
1. �θ����̺��� PKĮ��(�μ�,�μ���ȣ)�� �����Ͱ� �����ؾ�
   �ڽ����̺��� FK�÷�(���,�μ���ȣ)�� �����Ͱ� INSERT �����ϴ�.
   
2.�ڽ����̺��� FK �÷�(���,�μ���ȣ)�� ���Ǵ� ���� �����ϸ�, �ڽ� FK�����͸� ���� ������ ��
  �θ����͸� �����Ѵ�.
  
3. ON DELETE CASCADE : �ڽ����̺� �����ϸ�, �θ� ���̺� ������ ������, �ڽĵ� �Բ� ����
*/

----------------
-- ���̺� ���� --
----------------

--�μ� ���̺� ����
SELECT * FROm tab;
DROP TABLE dept;
CREATE TABLE dept(
    deptno     NUMBER(3),  --PK
    deptname    VARCHAR2(50) NOT NULL,
    loc         VARCHAR2(50),
    CONSTRAINT dept_deptno_pk PRIMARY KEY(deptno) --���̺� ����
);

-- ������̺� ����
DROP TABLE emp;
CREATE TABLE emp(
    empno   NUMBER(4),  --pk
    ename   VARCHAR(20) NOT NULL,
    hire_date   DATE DEFAULT sysdate,
    salary  NUMBER(9) CONSTRAINT emp_salary_min CHECK(salary > 0),
    deptno  NUMBER(3), --fk
    email   VARCHAR(60), --unique
    CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
    CONSTRAINT emp_deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno)
        ON DELETE CASCADE,
    CONSTRAINT emp_email UNIQUE(email)
);

SELECT * FROM tab;

--INSERT : dept -> emp �θ���� �ڽ�
--101, IT, ����
--102, ACCOUNT, ����
--103, HR, �ĸ�
--104, ADVERTISING, �̰���
--105, MARKETING, ����ũǪ��Ʈ
INSERT INTO dept
 VALUES(101,'IT','����');
INSERT INTO dept
 VALUES(102,'ACCOUNT','����');
INSERT INTO dept
 VALUES(103,'HR','�ĸ�');
INSERT INTO dept
 VALUES(104,'ADVERTISING','�̰���');
INSERT INTO dept
 VALUES(105,'MARKETING','����ũǪ��Ʈ');
INSERT INTO dept
 VALUES(106,'IT','ĳ����');
COMMIT;
--1001, ������, 2020/12/01, 10000, 101, so@naver.com
--1002, ����, 2020/12/02, 20000, 102, hb@naver.com
--1003, ������, 2020/12/03, 30000, 103, jt@naver.com
--1004, ������, 2020/12/04, 40000, 104, jj@naver.com
--1005, �̺���, 2020/12/05, 50000, 105, bh@naver.com
INSERT INTO emp
 VALUES(1001, '������', '2020/12/01', 10000, 101, 'so@naver.com');
INSERT INTO emp
 VALUES(1002, '����', '2020/12/02', 20000, 102, 'hb@naver.com');
INSERT INTO emp
 VALUES(1003, '������', '2020/12/03', 30000, 103, 'jt@naver.com');
INSERT INTO emp
 VALUES(1004, '������', '2020/12/04', 40000, 104, 'jj@naver.com');
INSERT INTO emp
 VALUES(1005, '�̺���', '2020/12/05', 50000, 105, 'bh@naver.com');
COMMIT;
-- parent key not fount ==> �ذ�å : �θ����̺� 106�� �μ� �ż�
INSERT INTO emp
 VALUES(1006, '������', '2020/12/05', 50000, 106, 'th@naver.com');
COMMIT;

--unique constraint violated : �̸��� �ߺ� ==> �ذ�å : �̸��� ������ �ٽ� �õ�
INSERT INTO emp
 VALUES(1007, '������2', '2020/12/05', 50000, 106, 'th2@naver.com');
COMMIT;

--check constraint violated : �޿��� ���� => �ذ�å : ����� ����
INSERT INTO emp
 VALUES(1008, '������2', '2020/12/05', 50000, 106, 'th3@naver.com');
COMMIT;


SELECT * FROM dept;
SELECT * FROM emp;

--
----------------
-- �÷� ���� --
----------------

--�μ� ���̺� ����
SELECT * FROm tab;
DROP TABLE dept_re;
CREATE TABLE dept_re(
    deptno     NUMBER(3) PRIMARY KEY,  --PK
    deptname    VARCHAR2(50) NOT NULL,
    loc         VARCHAR2(50)
    --CONSTRAINT dept_deptno_pk PRIMARY KEY(deptno) --���̺� ����
);

-- ������̺� ����
DROP TABLE emp_re;
CREATE TABLE emp_re(
    empno   NUMBER(4) PRIMARY KEY,  --pk
    ename   VARCHAR(20) NOT NULL,
    hire_date   DATE DEFAULT sysdate,
    salary  NUMBER(9) CONSTRAINT emp_salary_min CHECK(salary > 0),
    deptno  NUMBER(3) REFERENCES dept_re(deptno),--fk
    email   VARCHAR(60) UNIQUE --unique
    --CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
    --CONSTRAINT emp_deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno)
       -- ON DELETE CASCADE,
    --CONSTRAINT emp_email UNIQUE(email)
);

SELECT * FROM tab;

DELETE dept
WHERE deptno = 106;  -- �ڽ� ���̺��� deptno�� 106�� �����͵� ���ÿ� ����
COMMIT;
SELECT * FROM dept;
SELECT * FROM emp;

DELETE dept_re
WHERE deptno = 106; -- �ڽ� ���̺��� deptno�� 106�� �����͵� ���ÿ� ����

-- �������� ���� ��������
SELECT constraint_name, constraint_type, table_name
    FROM sys.user_constraints; -- SCOTT �������� ����