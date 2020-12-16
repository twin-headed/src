/* p270
    11��. ��
1. ���� ����� ����ϱ�
��(View)�� �Ѹ���� �������� ���̺��� �ٰ��� ������ �������̺�
��ũ ���� ������ �Ҵ���� �ʴ´�.
��, ���������� �����͸� �������� �ʰ�, ������ ������, �並 ������ �� ����� �������� ����Ǿ� �ִ�.
������ ������� ���̺��� �Ļ��� ��ü ���̺�� �����ϱ� ������ �������̺��̶� �Ѵ�.
���� ���Ǵ� USER_VIEWS ������ ������ ���� ��ȸ�� �����ϴ�.

2. ���ۿ���
��� �����͸� �����ϰ� ���� ���� �������̺��̹Ƿ� ��ü�� ����.
�䰡 ���̺�ó�� ���� �� �ִ� ������, �並 ������ �� CREATE VIEW ��ɾ� ������
AS ���� ����� �������� ��ü�� �����ϰ� �ִٰ� �̸� �����ϱ� �����̴�.

SELECT���� FROM ������ v_emp�� ����Ͽ� �����ϸ�, ����Ŭ ������ USER_VIEWS���� v_emp�� ã�´�.
����ߴ� ���� ���������� ����� text���� view �� v_emp ��ġ�� �����ͼ� �����Ѵ�. 275p �׸� ����

3.�並 ����ϴ� ����
���Ȱ� ����� ���Ǽ� ����
���Ѻ��� ������ ���ѵǾ ������ ���̺� �����ϴ� ������� �ٸ� �信 �����ϵ��� �� �� �ִ�.

*/
-- view �������� �߰�, SYSTEM �������� ����
grant create view to scott;

-- SCOTT �������� ����
CREATE OR REPLACE VIEW v_emp_dept   --view�̸��� user_views ������ ������ view_name�� ����
AS
-- SQL���� user_views �����ͻ����� text�� ����
SELECT e.empno
     , e.ename
     , e.hire_date
     , e.deptno
     , d.deptname
     , d.loc
    FROM emp e
        ,dept d
 WHERE d.deptno = e.deptno;
 
 SELECT * FROM v_emp_dept;
 
 -- ������ �������� �並 ��ȸ
 /*
    user_views : ������ ������ user ���̺�
    view_name : ���̸�
    test : �� ����(=��������)
*/
SELECT view_name, text
    FROM user_views;
/*
 p278
�� �����ϱ�
[����] DROP VIEW ���̸�;
��� ���簡 ���� �������̺��̱� ������ �並 �����Ѵٴ� ���� USER_VIEWS ������ ������
����Ǿ� �ִ� ���� ���Ǹ� �����Ѵٴ� ���� �ǹ�
�����ص� �並 ������ �⺻���̺��� ������ �����Ϳ��� ������ ����.
*/

DROP VIEW v_emp_dept;
SELECT view_name, text
 FROM user_views; -- �䰡 ������

/* p280
CREATE OR REPLACE VIEW
�̹� �����ϴ� �信 ���ؼ� �� ������ ���Ӱ� �����Ͽ� �����
�䰡 ������ ���Ӱ� �����ϰ�, �����ϸ� ����

WITH CHECK OPTION
�ش� �並 ���ؼ� �����ִ� ���� �������� UPDATE �Ǵ� INSERT�� �����ϴ�.

WITH READ ONLY
�ش� �並 ���ؼ��� SELECT�� �����ϸ�, INSERT/UPDATE/DELETE�� �� �� ����.
���� �̰��� ������, �並 ����Ͽ� INSERT/UPDATE/DELETE ��� �����ϴ�.
 */
 
-- WITH READ ONLY
CREATE OR REPLACE VIEW v_emp_readonly
AS
SELECT empno
     , ename
     , email
     , hire_date
     , deptno
 FROM emp
 WITH READ ONLY;
 
 INSERT INTO v_emp_readonly(empno, ename, email, hire_date, deptno)
  VALUES(1001,'����','boa@naer.com','20/12/14',101);
  
-- WITH CHECK OPTION
CREATE OR REPLACE VIEW v_emp_option
AS
SELECT empno
     , ename
     , email
     , hire_date
     , deptno
 FROM emp
 WHERE empno IN(2001, 2002) -- INSERT, UPDATE ������
 WITH CHECK OPTION;
 
 INSERT INTO v_emp_option(empno, ename, email, hire_date, deptno)
  VALUES(2001,'��ȿ��','hyo@naer.com','20/12/14',101); -- INSERT OK
  
 INSERT INTO v_emp_option(empno, ename, email, hire_date, deptno)
  VALUES(2002,'�̻��','sang@naer.com','20/12/14',101); -- INSERT OK
COMMIT;
SELECT * FROm v_emp_option;

 INSERT INTO v_emp_option(empno, ename, email, hire_date, deptno)
  VALUES(2003,'���缮','yuu@naer.com','20/12/14',101); -- INSERT NG
  
UPDATE v_emp_option
    SET email = 'leehr@naver.com'
 WHERE empno = '2001';  -- UPDATE OK
 
UPDATE v_emp_option
    SET email = 'leess@naver.com'
 WHERE empno = '2002';  -- UPDATE OK
 
UPDATE v_emp_option
    SET email = 'leehr@naver.com'
 WHERE empno = '2003'   -- UPDATE NG
 
SELECT * FROm v_emp_option; --INSERT, UPDATE ��� ����(2001, 2002�� ��츸)
--2001	��ȿ��	leehr@naver.com	20/12/14	101
--2002	�̻��	leess@naver.com	20/12/14	101

