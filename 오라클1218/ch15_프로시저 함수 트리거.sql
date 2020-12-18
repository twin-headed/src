/*9����
ch 15. ���ν��� �Լ� Ʈ����
1. ���ν��� - �ſ� �߿�
- ���ν��� : PL/SQL�� ���α׷� ������ ���ν����� �����Ͽ� ��ü ���·� ����Ѵ�.
            ���ν����� �Ϲ� ���α׷��� ���� ����ϴ� �Լ��� ����� �������� 
            �۾������� ������ ������ ���α׷��� ��������� ���Ѵ�.
            ���ν����� ���ǵ� ����, ����Ŭ(DBMS)�� ����ǹǷ� �������ν���(STORED PROCEDURE)��� �Ѵ�.
- ����Ŭ���� �Լ��� �ݵ�� RETURN���� ����Ͽ� ����� ��ȯ������, ���ν����� ����� ��ȯ�Ҽ���, ��ȯ���� ���� ���� �ִ�.
- CallableStatement : DB�� ������ �������ν����� execute()�� ȣ���ؼ� ��밡��.. jsp, spring�� �ڹٿ��� ȣ�Ⱑ��

[����]
CREATE [OR REPLACE] PROCEDURE ���ν�����(�Ű����� data_type,...)
IS
    ���ú���;   -- ��������
BEGIN
    statement1;
    statement2;
END;

���� : EXECUTE ���ν�����;
���� : DROP PROCEDURE ���ν�����;

- [MODE]]�� IN,OUT,INOUT �������� ����� �� �ִ�.
IN : ���ν����� �����͸� ���޹����� ���
OUT : ���ν������� ����� ������� ���޹����� ���
INOUT : �ΰ��� ������ ��� ���
*/
-- last_name = 'Nayer'�� �޿� ���
-- 

SET serveroutput ON
CREATE OR REPLACE PROCEDURE emp_salary_ename
IS
    v_salary employees.salary%type;
BEGIN
    SELECT salary INTO v_salary
     FROM employee
    WHERE last_name = 'Nayer';
    dbms_output.put_line('Nayer�� �޿��� ' || v_salary);
END;
/

EXECUTE emp_salary_ename;

/*
02.�Լ�
�Լ��� ������� �ǵ����ֱ� ���� �뵵�� ���ȴ�.
[����]
CREATE [OR REPLACE] FUNCTION function_name(
    �Ű�����1 [mode] ������Ÿ��,
    �Ű�����2 [mode] ������Ÿ��,...
)
    RETURN ������Ÿ��
IS
BEGIN
    statement1;
    statement2;
    RETURN ������
END;
/

�Լ��� ����� �ǵ����ޱ� ���ؼ� �Լ��� �ǵ������� �ڷ����� ���� ����ؾ� �Ѵ�.
EXECUTE :variable_name := function_name(�Ű�����_list)
/*
-- HR �������� ����
--'Chen'�� �޿��� �Լ��� �̿��� ���
fn_salary_last_name
*/

/*
03 Ʈ����
- Ʈ���� �������� �ǹ� : ���� ��Ƽ�, �������, �η��� ��ǵ��� �����ϴ� ���, ����, �ڱ�
- ����Ŭ�� Ʈ���Ŵ� � �̺�Ʈ�� �߻������� ���������� ����ǵ��� �ϱ� ���� �����ͺ��̽��� ����� ���ν����� ���Ѵ�.
[����]
CREATE TRIGGER trigger_name
timing [BEFORE|AFTER] event[INSERT|UPDATE|DELETE]
ON table_name
[FOR EACH ROW]
[WHEN condition]
BEGIN
    statement;  -- Ʈ���� ����
END;


-- <Ʈ������ Ÿ�̹�>
-- [BEFORE] Ÿ�̹��� � ���̺� INSERT, UPDATE, DELETE ���� ����� ��(EVENT)
-- �ش� ������ ����Ǳ� ���� Ʈ���Ű� ������ �ִ� BEGIN-END ������ ����(Ʈ���Ź���)�� �����Ѵ�.
-- [AFTER] Ÿ�̹��� � ���̺� INSERT, UPDATE, DELETE ���� ����� ��(EVENT)
-- �ش� ������ ����ǰ� �� �Ŀ� Ʈ���Ű� ������ �ִ� BEGIN-END ������ ����(Ʈ���Ź���)�� �����Ѵ�.

--<Ʈ������ �̺�Ʈ>
-- ����ڰ� � DML(INSERT, UPDATE, DELETE) ���� �������� ��
-- Ʈ���Ÿ� �߻���ų �������� �����Ѵ�.
-- Ʈ������ ��ü
   �ش� Ÿ�ֿ̹� �ش� �̺�Ʈ�� �߻��ϰ� �Ǹ� ����� �⺻ ������ ���ԵǴ� �κ�����
   BEGIN-END�� ����Ѵ�.
*/

--SCOTT �������� ����

--1. ����ڰ� ����� ���̺�(dept_original)����
-- ������ ����
CREATE TABLE dept_original
AS
SELECT * FROM dept
WHERE 0=1;

--2. Ʈ���ſ� ���ؼ� ����� ���̺�(dept_copy)����
-- ������ ����
CREATE TABLE dept_copy
AS
SELECT * FROM dept
WHERE 0=1;

-- 3. INSERT Ʈ���� ����
-- ���� Ʈ���� : �̺�Ʈ ���� -> dept_original INSERT ���� -> Ʈ���Ź��� ���� -> Ʈ���� ��� dept_copy ���̺� ���Ե��� Ȯ��
-- :new�� ���Ӱ� �߰��� ���� ������ �ִ� �ӽ����̺��̸�, insert�� ����� �� �����Ͱ� ����Ǿ� �ִ� ���̺�
--������� 1)CREATE~ /���� ������
--���� �۵����� : AFTER INSERT -> �̺�Ʈ -> Ʈ���Ź���

CREATE OR REPLACE TRIGGER trigger_dept_copy_insert
    AFTER INSERT  -- ������� 1
        ON dept_original
     FOR EACH ROW --�ະ��
BEGIN
    INSERT INTO dept_copy -- ������� 2
    VALUES(:new.deptno, :new.deptname, :new.loc);
END;


--4. �̺�Ʈ : dept_original ���̺� ������ �߰��ϱ�
-- ������� 1
INSERT INTO dept_original
    vALUES(10,'ACCOUNT','NEW YORK');
INSERT INTO dept_original
    vALUES(20,'IT','�ѱ�');
INSERT INTO dept_original
    vALUES(30,'�λ�','������');
COMMIT;

--5. Ȯ�� : dept_copy ���̺� �����Ͱ� �߰��Ǿ����� Ȯ��
SELECT * FROM dept_original;
SELECT * FROM dept_copy;

----------------------------------------------------------------------------

-- 3. DELETE Ʈ���� ����
-- ���� Ʈ���� : �̺�Ʈ ���� -> dept_original DELETE ���� -> Ʈ���Ź��� ���� -> Ʈ���� ��� dept_copy ���̺��� �����Ͱ� �������� Ȯ��
-- :old�� ������ ���� ������ �ִ� �ӽ����̺��̸�, delete�� ����Ǳ� ���� �����Ͱ� ����Ǿ� �ִ� ���̺�

--4. �̺�Ʈ : dept_original ���̺� ������ �����ϱ�
CREATE OR REPLACE TRIGGER trigger_dept_copy_delete
    AFTER DELETE
        ON dept_original
    FOR EACH ROW
BEGIN
    DELETE dept_copy
    WHERE dept_copy.dno = :old.deptno;
END;
/

DELETE dept_original
WHERE deptno = 30;
    




