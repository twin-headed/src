/*
p238
Ʈ�����(Transaction)����
Ʈ������� ������ ó������ ������ �ϳ��� �۾� ������ �ǹ��Ѵ�.
ALL or Nothing : �������� ��ɾ� ������ ���������� ó���Ǹ� ���������ϰ�,
    ��ɾ���� �ϳ��� �߸��ȴٸ� ��ü�� ����Ѵ�.
DML �Լ��� �۾��� ���������� ó���Ǿ��ٸ� COMMIT�� ����ؾ� �Ѵٸ� ROLLBACk ����� �����Ѵ�.
DDL, DCL���� ����Ǵ� ��쿡�� �ڵ����� COMMIT �ȴ�.
COMMIT - Ʈ������� ó�������� �ݿ��Ͽ� ����� ������ ���������Ѵ�. ��� �۾����� ����ó��Ȯ�� ��ɾ��̴�.
        INSERT, UPDATE, DELETE(�� DML) �� COMMIT�� �ؾ� �Ѵ�.
ROLLBACK - Ʈ������� ó�������� �߻��� ��������� ����ϸ�, �ϳ��� ����ó���� ���۵Ǳ� �������·� ���ư���.
        COMMIT���� �ؾ��Ѵ�.
SAVEPOINT - ������ Ʈ������� �۰� �����Ѵ�. ��ҹ��� ������
    ����� SAVEPOINT�� ROLLBACK TO SAVEPOINT ���� ����Ͽ� ǥ���� ������ �ѹ��� �� �ִ�.
    1) SAVEPOINT SAVEPOINT��;
    2) ROLLBACK TO SAVEPOINT��;
    
�� ���̺�����Ʈ�� �����ؾߵǳ�

*/

CREATE TABLE dept_tr(
    deptno NUMBER(2) PRIMARY KEY,
    deptname    VARCHAR(50) NOT NULL,
    loc     VARCHAR2(50)
);

--10, IT, ����
--20, ��ȹ��, ��õ
--30, ������, �뱸
--40, ������, ����
--50, �濵����, ��⵵

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(10,'IT','����');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(20,'��ȹ��','��õ');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(30,'������','�뱸');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(40,'������','����');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(50,'�濵����','��⵵');

COMMIT;

SELECT *
FROM dept_tr;               -- Ȯ�ι���
-- Ʈ�����
-- 1) 40�� �μ� ���� �� COMMIT
DELETE dept_tr
 WHERE deptno = 40;
COMMIT;
-- 2) 30�� �μ� ���� �� SAVEPOINT S1 ����
DELETE dept_tr
 WHERE deptno = 30;
SAVEPOINT S1;
-- 3) 20�� �μ� ���� �� SAVEPOINT S2 ����
DELETE dept_tr
 WHERE deptno = 20;
SAVEPOINT S2;
-- 4) 10�� �μ� ���� 
DELETE dept_tr
 WHERE deptno = 10;
-- Ʈ����� �߰��ܰ�� �ǵ�����
-- 5) 10�� �μ� ���� ���
ROLLBACK TO S2; -- �ѹ� �Ϸ�.(10�� ȸ��)
-- 6) 20�� �μ� ���� ���
ROLLBACK TO S1; -- �ѹ� �Ϸ�.(20�� ȸ��)
-- 7) 30�� �μ� ���� ���
ROLLBACK; -- �ѹ� �Ϸ�.(30�� ȸ��) SAVEPOINT�� �����Ƿ� ROLLBACk���
-- 8) 40�� �μ� ���� ���
ROLLBACK; -- 40���� COMMIT(��������)�� �����̹Ƿ� ROLLBACK �Ұ�