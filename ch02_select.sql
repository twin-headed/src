/*
    ������ �����ͺ��̽��� ������ ���̺� ���·� �����Ѵ�.
    ���̺��� 2���� ������ ǥó�� �� �� �ֵ��� �ο�(ROW:��)�� �÷�(COLUMN:��)���� �����Ǿ��ִ�.
*/



/* 3.4 ������ ��ȸ
    SELECT �÷���
    FROM   ���̺��
    WHERE  �ο�(��)�� ���ǽ�
     AND(OR)... ���ǽ�
     ...
    ORDER BY �÷���(ASC, ���� : ������������ | DESC : ������������)
   -- ���ǹ��� �÷���, ������, ����� �� �� �ִ�.
   -- ���ڿ� ��¥ Ÿ���� ������� �ݵ�� ���� ����ǥ(�̱���Ʈ)�� ���´�.
   -- '����', '������'�� ���� ����ǥ������ ��ҹ��� ����

*/
-- SELECT * FROM ���̺��;
-- ������̺� ��� ����(*) �˻�
SELECT * FROM employees;     -- ���T

SELECT *
    FROM employees
 WHERE employee_id = 197; -- �ڹٿ� �ٸ��� =�� ����.
 
-- Last_name�� Chen
SELECT *
    FROM employees
 WHERE last_name = 'Chen'; -- ���ڿ��� �̱���Ʈ�� ���Ѵ�. 

/*
    ���̺��� ���� ��ȸ - DESC
    - DESC ���̺��
*/

DESC employees;
DESC departments;
-- ������̺� ���ϴ� �÷� �˻�
SELECT employee_id
    , last_name
    , email
    , salary
    , hire_date
 FROM employees;
------------------------------------------------------
-- ������̺��� ���,����,�μ� �˻�

-- �μ����̺��� �μ�ID, �μ��� �˻�
SELECT employee_id
    , job_id
    , department_id --�������� �ڵ鸵
 FROM employees;

SELECT department_id
    , department_name
 FROM departments;
 
 ------------------------------------------------------
 --�μ����̺��� �μ�ID�� 100���� �μ��� �μ�ID�� �μ��� �˻�
 SELECT department_id
    , department_name
   FROM departments
WHERE department_id = 100;

--������̺��� salaly�� 10000�� �̻��̸鼭 ����� 200�̻��� ����� ����� ���, �̸��� �˻�
 SELECT employee_id
    , email
    , salary
   FROM employees
WHERE salary >= 10000 --�࿡ ���� �ڵ鸵
 AND employee_id >= 200
 ORDER BY salary ASC; -- �������� ����
 
 --�μ����̺��� �μ�ID�� 100�������� �μ��� �μ� ID�� �μ��� �˻�
  SELECT department_id
    , department_name
   FROM departments
WHERE department_id <= 100
 ORDER BY department_id DESC;
 
 -- ������̺��� (����� 150�� �̸�]�� ����� ���, last_name, salary, �μ�ID�� �˻�
 -- (��, �μ�ID�� ����,������������ �����ϰ� �޿��� �������� �����Ͻÿ�.)
 SELECT employee_id
    , last_name
    , salary
    , department_id
   FROM employees
WHERE employee_id <150
 ORDER BY department_id DESC;
 
  SELECT employee_id
    , last_name
    , salary
    , department_id
   FROM employees
WHERE employee_id <150
 ORDER BY department_id, salary ASC, employee_id ASC;  -- �μ� ID, salary�� �����ϸ� ��� ��������
 
 -- ������̺��� �޿��� 10000�� �̻��� ����� ���, last_name, salary, job_id�� �˻�, �� �޿��� ��������
   SELECT employee_id
    , last_name
    , salary
    , job_id
   FROM employees
WHERE salary >= 10000
 ORDER BY salary ASC;
 
 -- ������̺��� job_id�� 'IT_PROG'�� ��� ��� �̸� �̸��� ��ȸ (�� ��� �������� ����)
    SELECT employee_id
    , last_name
    , salary
    , email
    , job_id
   FROM employees
WHERE job_id = 'IT_PROG'
 ORDER BY employee_id ASC;
 
 --�μ����̺��� �μ�ID, �μ���, �Ŵ��� ID�� �˻��϶�( �� �μ� ID�� �������� �����Ͻÿ�)
 SELECT department_id
    , department_name
    , manager_id
 FROM departments
 ORDER BY department_id;
 
 -- �÷��� ��Ī ���� : 1. ���� ��Ī 2. as ��Ī 3. "��Ī"
 -- ������̺��� ���, last_name, �̸���, �޿��� �˻��Ͻÿ�( �� �޿��� 10000�� �̻��̸鼭 ����� 150������ ū���)
 -- �񱳿�����( = : ���� / <>, !=, ^= �����ʴ�.
 
 SELECT employee_id
    , last_name
    , email
    , salary
    , salary * 12 as ����
 FROM employees
 WHERE salary >= 10000 and employee_id > 150;
 
 -- �ߺ��� �����͸� �ѹ����� ����ϴ� DISTINCT
 -- ������̺��� �μ���ȣ�� �˻�, �ߺ��� �ѹ��� ���
  SELECT distinct department_id
 FROM departments
 ORDER BY department_id ASC;
 
 --p39
 -- DUAL ���̺� : �� ������ ����� ����ϱ� ���� �����Ǵ� ���̺� .. ������� �ѹ� ǥ�ÿ�
 -- DUMMY(varchar2(1)) ��� �ϳ��� �÷����� �����Ǿ� �ְ�, �����ʹ� 'x'��
 DESC dual;
 SELECT *
    FROM dual;
    
    
SELECT sysdate
    FROM dual;
    
-- ����/��¥ ������ ��ȸ
-- ������̺��� last_name�� king�̰ų� �Ի����� 05/07/16�� ����� ���, last_name�� , �Ի��� �˻�

SELECT 
    employee_id
    ,last_name
    ,hire_date
    FROM employees
    WHERE last_name = 'King' OR hire_date = '05/07/16';
    
 /* p51
    BETWEEN AND ������(�ſ� �߿�)
    ���� : �÷��� BETWEEN A AND B : �÷��� �����Ͱ��� ���Ѱ�(A)�� ���Ѱ�(B) ���̿� ���ԵǴ� �ο츦 �˻��ϱ� ���� ������
    ���� : �÷��� NOT BETWEEN A AND B : �÷��� �����Ͱ��� ���Ѱ�(A)�� ���Ѱ�(B) ���̿� ���Ե��� �ʴ� �ο츦 �˻��ϱ� ���� ������
*/

-- ������̺��� ���, �̸�, �޿� ��ȸ(�� �޿��� 10000~15000 ����), �޿�, ����� �������� ����
    SELECT 
    employee_id
    ,last_name
    ,salary
    FROM employees
    WHERE salary BETWEEN 10000 AND 15000
    ORDER BY salary ASC, employee_id ASC;

-- ������̺��� ���, �Ի��� ��ȸ(�� �Ի����� 03/01/01~04/12/31 �ٹ�), �Ի��� �������� ����
    SELECT 
    employee_id
    ,hire_date
    FROM employees
    WHERE hire_date BETWEEN '03/01/01' AND '04/12/31'
    ORDER BY hire_date ASC;
    
--p53
--IN ������ : Ư�� �÷��� ���� A, B, C �߿� �ϳ��� ��ġ�ϸ� ���� �Ǵ� �������̴�.
--���� : �÷� �� IN(A, B, C);

--������̺��� �μ�id�� 70,80,110�� ���� ���, �̸�, �μ�ID�� ��ȸ(�� �μ�ID�� ����)

    SELECT employee_id
    ,last_name
    ,department_id
    FROM employees
    WHERE department_id in(70,80,110)
    ORDER BY department_id ASC;
    
/* p55
    LIKE �����ڿ� ���ϵ� ī��
    - �÷��� LIKE pattern
    - ���ϵ� ī�� : % => �ϳ��̻��� ���ڰ� ����� �͵� Ȥ�� �ƹ����� �ȿ͵� �������.
                  _ => �ϳ��� ���ڰ� � ���� �͵� �������.
                  
*/
------- ������̺��� last_name�� 3��°, 4��° �ܾ 'tt'�� ����� last_name ��ȸ
SELECT last_name
FROM employees
WHERE last_name like '__tt%';

------- ������̺��� 'JONES'�� ���Ե� EMAIL��ȸ
SELECT email
FROM employees
WHERE email like '%JONES%';

------- JOBS ���̺��� 'REP'�� ���Ե� JOB_ID ��ȸ
SELECT job_id
FROM jobs
WHERE job_id like '%REP%';

 
 /* 1.7 NULL �����ڸ� �̿��� �˻�
    ����÷� IS NULL
    ����÷� IS NOT NULL
    
    NULL : ��Ȯ��, �˼����� ���� �ǹ��ϸ�, ����,�Ҵ�,�� �Ұ����ϹǷ� 'IS NULL'�� ����Ѵ�.
    IS NULL ������ : �÷��� �߿��� NULL�� �����ϴ� �ο츦 �˻��ϱ� ���� ����ϴ� �������̴�.
*/
--������̺��� commission_pct�� null�� �ƴ� ���, ���, �̸�, salary, commission_pct �˻�
SELECT employee_id
,last_name
,salary
,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
--������̺��� department_id�� null�� ���, �̸�, �μ����̵�
SELECT employee_id
,last_name
,department_id
FROM employees
WHERE department_id IS NULL;
--������̺��� department_id�� null �ƴ� ���, �̸�, �μ����̵�
SELECT employee_id
,last_name
,department_id
FROM employees
WHERE department_id IS NOT NULL;

-- ������̺��� manager_id�� null�� �ƴ� ��� ���, last_name, department_id, hire_date �˻�
SELECT last_name
    ,department_id
    ,hire_date
    ,manager_id
    ,salary
FROM employees
WHERE manager_id IS NOT NULL
ORDER BY hire_date,salary;

/*
    nvl �Լ� => �ſ�ſ� �߿�
    null�� �������� ����(?) Ȥ�� ���Ѵ��� �ǹ��̱� ������ ����, �Ҵ�, �񱳰� �Ұ����ϴ�.
        ����� ���� �÷��� null�� �ٲ��.
    NVL : NULL�� ��� ��, ����, �Ҵ��� �Ұ����ϹǷ�, NULL�� ��� NVL�� �̿��� ��ü
    NVL �Լ� : NULL�� 0�Ǵ� �ٸ� ������ ��ȯ�Ѵ�.
    ���� : NVL(�÷���, �ʱⰪ)
        �� �ΰ��� ���� �ݵ�� ������ Ÿ���� ��ġ�ؾ� �Ѵ�.
*/

-- ������̺��� commission_pct�� null�� �ƴ� ����� ���, last_name, "NULL"������ NVL ������ ���϶�
-- ���� : �޿�*12+commission_pct
-- �� commission_pct�� null�� ��� 0���� ����Ͻÿ�
-- NVL ����� commision_pct�� null �� ��� 0���� ��ü�Ǿ� �������� ������
SELECT employee_id,last_name,salary,commission_pct
    ,salary * (12+commission_pct) "NULL ����"
    ,salary * (12+NVL(commission_pct,0)) "NVL ����"
FROM employees;



    