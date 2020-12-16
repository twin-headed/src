/*  p336
01. PL/SQL
-PL/SQL(Oracle's Procdeural Language extension to SQL)
=> SQL���� ����� ����Ŭ�� ������ ���α׷��� ��� 
SQL������ ����� �� ���� ������ ���α׷��� ������� SQL�� ������ ����
PL/SQL ��ϱ��� : �����, �����, ����ó����  
*/
-- ����Ŭ���� ȭ���� ��� : ��Ű����.put_line ���ν����� �̿�
-- ȯ�溯�� serveroutput�� ȭ������� ���� ON���� ����
-- �������� �����ϱ� ���ؼ� '/'�� �ԷµǾ�� �ϸ�, PL/SQL ����� '/'�� ������ ����� ������ �����Ѵ�.
set serveroutput on
BEGIN
    dbms_output.put_line('Welcome to plsql');
END;
/
--(����) set���� /���� ��ϼ��� �� ����
-- Welcome to plsql
-- PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

/*
03. ��������(DECLARE)
1) ��Į��
-����, ����, ��¥, BOOLEAN 4����

2) ���۷���
- %TYPE�� ������ ������Ÿ���� �����÷��� ���߾� ����
������ TABLE��.COLUMN��%TYPE -- �÷������� ������ Ÿ���� ����


- %ROWTYPE�� �ο�(��)��ü�� ���� ������ Ÿ���� ����
���̺�� ���̺��%rowtype;  --���̺��� �÷�����,������Ÿ��, ũ����� �����ϰ� ���
*/

--�����ȣ ����̸� �޿� ���� ����ϱ�..last_name='Nayer' (HR����)
--v_sabun
--v_name
--v_salary
--v_job_id

set serveroutput on
declare
    v_sabun     employees.employee_id%type;
    v_name      employees.last_name%type;
    v_salary    employees.salary%type;
    v_job_id    employees.job_id%type;
BEGIN
    SELECT employee_id,last_name,salary,job_id into v_sabun,v_name,v_salary,v_job_id
    FROM employees
    WHERE last_name = 'Nayer';
    dbms_output.put_line(v_sabun ||'  '|| v_name ||'  '|| 
                         v_salary ||'  '|| v_job_id);
END;
/


-- �����ȣ ����̸� ���� �μ��ڵ� �μ��� ����ϱ� .. last_name = 'Nayer'
-- �μ��ڵ� : �μ��� ==> 10: ACCOUNTING 20: RESERACH 30: SALES 40: OPERATIONS 50 : IT
set serveroutput on
declare
    v_employees employees%rowtype;
    v_department_name varchar2(30):= null;
    annsal number(7,2);
    
BEGIN
    SELECT * INTO v_employees
    FROM employees
    WHERE last_name = 'Nayer';
    
    if(v_employees.commission_pct is null) then
        v_employees.commission_pct := 0;
    end if;
    
    annsal := v_employees.salary*12 + v_employees.commission_pct;
    
    if(v_employees.department_id = 10) then
        v_department_name := 'ACCOUNTING';
        elsif(v_employees.department_id = 20) then
        v_department_name := 'RESEARCH';
        elsif(v_employees.department_id = 30) then
        v_department_name := 'SALES';
        elsif(v_employees.department_id = 40) then
        v_department_name := 'OPERATIONS';
        elsif(v_employees.department_id = 50) then
        v_department_name := 'IT';
    end if;
/*
    3.2 LOOP��
*/
-- 2�����
 SET serveroutput on
 DECLARE
    dan number :=2;
    i number :=1;
 BEGIN
    LOOP
        dbms_output.put_line(
           dan || ' * ' || i || '=' || (dan*i));
        i := i+1;
        IF i>9 THEN
            EXIT;
        END IF;
    END LOOP;
 END;
 /

/*
    p351
   04. Ŀ��
   SELECT���� �������� �������� �ο�� �������� ��� �ο쿡 ���� ó���� �Ϸ��� Ŀ���� ����Ѵ�.
   Ŀ���� �������� ���ؼ� ��ȯ�Ǵ� ��������� �����ϴ� �޸� ����
   CURSOR ���� -> OPEN -> FETCH -> CLOSE
   FETCH���� �����(Ŀ��)���� �ο� ������ �����͸� �о���δ�.
   FETCH �Ŀ� CURSOR�� ����¿��� ���������� �̵��Ѵ�.
   FETCH ������ ���� �࿡ ���� ������ �о�ͼ�
   INTO �ڿ� ����� ������ ������ �� ����ϰ�, ���� ������ �̵��Ѵ�.
   ����� �������� �ο쿡 ���� ������� ��� ó���Ϸ��� �ݺ����� FETCH���� ����Ѵ�.
   
   [����]
   DECLARE
    CURSOR Ŀ����
    IS
    SELECT ����;  -- INTO ���� ���Խ�Ű�� �ʾƾ� �Ѵ�.
   BEGIN
    OPEN Ŀ����;
    LOOP
        FETCH Ŀ����
        INTO ������;
    END LOOP;
    CLOSE Ŀ����;
 END;
 /
*/

--Ŀ���κ��� �μ����̺��� ��� ������ ��ȸ�ϱ�(HR)

SET serveroutput on
 DECLARE
    v_dept  departments%rowtype;
    --1. Ŀ�� ����
    CURSOR C1
    IS
    SELECT * FROM departments;
BEGIN
    --2. OPEN
    OPEN C1;
    LOOP
    --3. FETCH
        FETCH C1 INTO v_dept.department_id, v_dept.department_name, v_dept.manager_id, v_dept.location_id;
        EXIT WHEN C1%NOTFOUND;
        dbms_output.put_line(v_dept.department_id
                         || ' ' || v_dept.department_name
                         || ' ' || v_dept.manager_id
                         || ' ' || v_dept.location_id);
    END LOOP;
    --4. CLOSE
    CLOSE C1;
END;
/

--CURSOR FOR LOOP C2�� ������

SET serveroutput on
 DECLARE
    v_dept departments%rowtype;
    CURSOR C2
    IS
    SELECT * FROM departments;
 BEGIN
    dbms_output.put_line('�μ���ȣ  �μ���     ������');
    dbms_output.put_line('------------------------');
    FOR v_dept IN C2 LOOP
        EXIT WHEN C2%NOTFOUND;
        dbms_output.put_line(v_dept.department_id || '  ' || v_dept.department_name || '  ' || v_dept.location_id);
    end loop;
  end;
  /

