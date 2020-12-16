/* 7����
12�� ������
������ : PRIMARY KEY�� ������ �÷��� �Ϸù�ȣ�� �ڵ����� �ο��ޱ� ���� ���
�������� ���̺��� ������ ���ڸ� �ڵ����� ������ �ְ�, �ַ� �⺻Ű�� ���ȴ�.
(��. �Խ����� �۹�ȣ, �μ����̺��� �μ���ȣ)
[����]
<������ ����>
CREATE SEQUENCE ��������
[START WITH n]
[INCREMENT BY n]
[MAXVALUE n | MINVALUE n]
[CYCLE n | NOCYCLE]
[CACHE n | NOCACHE]

- CURRVAL : �������� ���簪�� �˾Ƴ���.
- CURRVAL�� ���ο� ���� �Ҵ�Ǳ� ���� NEXTVAL�� ���ο� ���� �����ؾ� �Ѵ�.
- NEXTVAL : �������� �������� �˾Ƴ��� ���� ���

<������ ����>
ALTER SEQUENCE ��������
[START WITH n] : ���Ұ��̸�, �ٸ� ��ȣ���� �ٽ� �����Ϸ��� ���� �������� �����ϰ� �ٽ� �����Ѵ�.
[INCREMENT BY n]
[MAXVALUE n | MINVALUE n]
[CYCLE n | NOCYCLE]
[CACHE n | NOCACHE]
*/

DROP SEQUENCE emp_seq;
CREATE SEQUENCE emp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999
    CYCLE;

DROP SEQUENCE dept_seq;
CREATE SEQUENCE dept_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999
    CYCLE;

-- ���� ���� �������� nextval�� ������� �ʰ� �ٷ� currval �� ����ϸ� ������ �߻��Ѵ�.
SELECT emp_seq.currval
    FROM dual; -- NG : EMP_SEQ.CURRVAL is not yet defined in this session

-- nextval�� emp_seq �������� ���ο� �� �����ϱ�
-- ���簪�� �˱� ���ؼ� �ݵ�� nextval�� ���� �����;� ��
SELECT emp_seq.nextval
    FROM dual;  -- ����� 1

--currval�� emp_seq �������� ���簪 �˾Ƴ���
SELECT emp_seq.currval
    FROM dual;  -- ����� 1

-- nextval�� dept_seq �������� ���ο� �� �����ϱ�
SELECT dept_seq.nextval
    FROM dual;

--currval�� dept_seq �������� ���簪 �˾Ƴ���
SELECT dept_seq.currval
    FROM dual;

--������ �����ͻ������� ������ ��ȸ
SELECT * FROM user_sequences;

-- ������ ����
DROP SEQUENCE emp_seq;
DROP SEQUENCE dept_seq;

-- ������ ���� ��ȸ
SELECT sequence_name
 FROM user_sequences
 WHERE sequence_name = 'DEPT_SEQ';  --�������� �������� 296pó�� in�� �ٿ� ��ȸ
 
-- �μ� ���̺� ������ �������� �̿��� PK���� ����
CREATE TABLE dept_seq_tbl(
 deptno		NUMBER(3) CONSTRAINT dept_seq__deptno_pk PRIMARY KEY,
 deptname	VARCHAR2(50) NOT NULL,
 loc		VARCHAR2(50)
);
DROP TABLE dept_seq_tbl;
DROP TABLE emp_seq_tbl;
CREATE TABLE emp_seq_tbl(
 empno		NUMBER(4) CONSTRAINT emp_seq_tbl_empno_pk PRIMARY KEY,
 ename		VARCHAR2(20) NOT NULL,
 hire_date	DATE DEFAULT sysdate,
 salary		NUMBER(9) CONSTRAINT emp_seq_tbl_min_salary CHECK(salary > 0),
 deptno		NUMBER(3) REFERENCES dept_seq_tbl ON DELETE CASCADE,
 email		VARCHAR2(60)CONSTRAINT emp_seq_tbl_email_uu UNIQUE
);

DROP SEQUENCE dept_seq;
CREATE SEQUENCE dept_seq
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 999;

DROP SEQUENCE emp_seq;
CREATE SEQUENCE emp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999;

-- dept �� next emp�� curr �ݺ�
INSERT INTO dept_seq_tbl
VALUES(dept_seq.nextval,'a','����');
INSERT INTO emp_seq_tbl(empno,ename,salary,deptno,email)
VALUES(emp_seq.nextval,'��',4000000,dept_seq.currval,'a@naver.com');

SELECT *
FROM dept_seq_tbl;

SELECT *
FROm emp_seq_tbl;

/* 8���� - p298
 03. �ε���
�ε����� �˻� �ӵ��� ����Ű�� ���� ���
�⺻Ű�� ����Ű�� �ε����� �ڵ����� �����ȴ�.
USER_COLUMNS, USER_IND_COULUMNS ������ ������ ���� Ȯ��

[����]
 CREATE INDEX index_name
 ON table_name(column_name);
 
- �ε����� �����ϴ� ���� ���� �÷�
1) WHERE���̳� JOIN���� �ȿ��� ���� ���Ǵ� �÷�
2) NULL���� ���� ���ԵǾ� �ִ� �÷�
3) WHERE���̳� JOIN ���Ǿȿ��� ���� ���Ǵ� �ΰ��̻��� �÷�

- �ε��� ���� ���ʿ��� ���
1) ���̺��� ���� ��
2) ���̺��� ���� ���ŵ� ��
*/
-- �ε��� ����Ȯ�� : ������ ����
SELECT index_name, table_name, column_name
 FROM user_ind_columns
 WHERE table_name IN('EMP','DEPT');     --���̺���� �̱۷� ���ΰ� '�빮��' : ��ҹ��� ����
 
-- ���̺� ����
 CREATE TABLE dept_idx
AS
 SELECT * FROM dept;    -- ����, �����ͱ��� ����
 
 CREATE TABLE emp_idx
AS
 SELECT * FROM emp;     -- ����, �����ͱ��� ����
 
SELECT * FROM dept_idx;
SELECT * FROM emp_idx;

-- 1) ����� �ε��� : �ߺ��� �����͸� ���� �÷��� ���ؼ� �����ϴ� �ε����̸�, UNIQUE�� ���̸� ���� �߻�
CREATE INDEX idx_emp_ename
ON emp_idx(ename);

-- 2) ���� �ε��� : �⺻Ű�� ����Űó�� ������ ���� ���� �÷��� ���ؼ� �����ϴ� �ε����̸�, UNIQUE INDEX�� ����Ѵ�.
CREATE UNIQUE INDEX idx_dept_idx_deptno
ON dept_idx(deptno);
-- 3) ���� �ε��� : �ΰ� �̻��� �÷����� �ε����� �����Ѵ�.
CREATE INDEX idx_dept_idx_com
ON dept_idx(deptname, loc);

-- �ε��� ����Ȯ�� : ������ ����
SELECT index_name, table_name, column_name
 FROM user_ind_columns
 WHERE table_name IN('EMP_IDX','DEPT_IDX');
--�����
--IDX_DEPT_IDX_DEPTNO	DEPT_IDX	DEPTNO
--IDX_DEPT_IDX_COM	DEPT_IDX	DEPTNAME
--IDX_DEPT_IDX_COM	DEPT_IDX	LOC
--IDX_EMP_ENAME	EMP_IDX	ENAME
 
-- 4) �Լ���� �ε���
 CREATE INDEX idx_emp_idx_salary
 ON emp_idx(salary * 12);
--�����
--IDX_DEPT_IDX_DEPTNO	DEPT_IDX	DEPTNO
--IDX_DEPT_IDX_COM	DEPT_IDX	DEPTNAME
--IDX_DEPT_IDX_COM	DEPT_IDX	LOC
--IDX_EMP_ENAME	EMP_IDX	ENAME
--IDX_EMP_IDX_SALARY	EMP_IDX	SYS_NC00007$
 
 

