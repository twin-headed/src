/* [����]
Equi Join -- �ſ� �߿�
- ���� ��� ���̺��� ���� �÷��� '='(equal) �񱳸� ���� ���� ���� ���������� ����

1. ���� : ���� ���� ���Ǵ� ���ι������ , ���� ����� �Ǵ� �� ���̺��� ���������� �����ϴ� �÷��� ���� ��ġ�ϴ� ���� �����Ͽ� �˻������ �����ϴ� ���

- FROM ���� ���� ��� ���̺��� ����ϰ�, ���̺��� �޸�(,)�� �����Ѵ�.
- WHERE ���� ������ ���� �÷���� '=' �����ڸ� ����Ͽ� ���������� ����Ѵ�.
- ���ǿ� ���Ǵ� �÷��� �Ϲ������� �⺻Ű�� �ܷ�Ű�� ���������� �����ϴ� �÷����� ����Ѵ�.

- �⺻Ű(PK : Primary Key) : �ߺ����� �ʾƾ� �ϸ�, NOT NULL �̾�� �Ѵ�.
- �ܷ�Ű(FK : Foreign Key) : �ٸ� ���̺��� �⺻Ű�� �����ϸ�, �ݵ�� NOT NULL�� �ƴϴ�.
��) �⺻Ű : �μ����̺�, �μ�ID    �ܷ�Ű : ������̺�.�μ�ID
   �θ����̺� : �μ����̺�          �ڽ����̺� : ������̺�
   
   
2. �ߺ��÷�(��ȣ�� �÷�)�� ��� �÷���տ� ���̺��(�Ǵ� ��Ī)�� ����Ͽ�
   ��� ���̺� �Ҽ����� �����Ѵ�.
   
3. ���� 
  SELECT t1.column, t2.column
     FROM table t1, table t2
  WHERE t1.column = t2.column
    AND ���ǽ�;
    
4. JOIN-ON
 ���̺��� ���̺�� ���̿� �޸�(,) ��� JOIN�� ����ϰ�
 �������� �����ϴ� Ű�� ���ϴ� WHERE ��ſ� on�� ����Ѵ�.
 �ٸ� �˻��̳� ���������� WHERE���� �и��ؼ� ����Ѵ�.
 */


-- ������̺�, �μ����̺��� ����� 103���� ����� ���, �μ���ȣ, �μ���, manager_id, location_id
SELECT e.employee_id
     , e.department_id
     , d.department_id
     , d.department_name
     , d.manager_id -- ���� ��ο� �ִ� Į���� ��� �Ҽ��� ������ߵȴ�.
     , location_id  -- ���� ���̺��� �ִ� Į���� ��� �Ҽ��� �����ʾƵ� ������ �ȳ���.
FROM employees e, departments d
WHERE e.department_id = d.department_id
 AND e.employee_id = 103
ORDER BY e.employee_id ASC;

-- JOIN-ON
SELECT e.employee_id
     , e.department_id
     , d.department_id
     , d.department_name
     , d.manager_id -- ���� ��ο� �ִ� Į���� ��� �Ҽ��� ������ߵȴ�.
     , location_id  -- ���� ���̺��� �ִ� Į���� ��� �Ҽ��� �����ʾƵ� ������ �ȳ���.
FROM employees e JOIN departments d
ON e.department_id = d.department_id
 AND e.employee_id = 103
ORDER BY e.employee_id ASC;

--100���� ����� jobs ���� ��ȸ  ��� �⽺ �������
SELECT e.job_id
     , j.job_id
     , j.job_title   
     , j.min_salary
     , j.max_salary
FROM employees e JOIN jobs j
ON j.job_id = e.job_id  --PK�� �������� ���̴°� ����.                   
 AND e.employee_id = 100;
 
-- �μ� ID�� 10���϶��� �μ�ID, �μ���, �����̼�����
SELECT d.department_id
     , d.department_name
     , d.location_id
     , l.*
FROM locations l JOIN departments d
ON d.location_id = l.location_id
 AND d.department_id = 10;
 
-- IT�� ���Ե� �μ����� ���� �μ��� ���, �̸�(Last_name + first_name), �Ի���, �μ��ڵ�, �μ��� ��ȸ

SELECT d.department_id �μ����
     , e.first_name || e.last_name �̸�
     , e.hire_date �Ի���
     , d.department_name �μ���
FROM employees e JOIN departments d
ON d.department_id = e.department_id
 AND d.department_name LIKE '%IT%';
 
 SELECT d.department_id �μ����
     , e.first_name || e.last_name �̸�
     , e.hire_date �Ի���
     , d.department_name �μ���
FROM employees e , departments d
WHERE d.department_id = e.department_id
 AND d.department_name LIKE '%IT%';
 
SELECT e.employee_id AS ���
     , e.last_name || ' ' || e.first_name AS �̸�
     , e.hire_date AS �Ի���
     , d.department_id AS �μ��ڵ�
     , d.department_name AS �μ���
  FROM employees e
    , departments d
 WHERE d.department_id = e.department_id
   AND d.department_name LIKE '%IT%';
   
-- 4����
-- country_id�� 'US'�� ������ country_id, �����, ����ID, ������
SELECT c.country_id
     , c.country_name
     , r.region_id
     , r.region_name
FROM regions r , countries c
WHERE c.country_id = 'US'
    AND r.region_id = c.region_id;
    
--JOIN-ON
SELECT c.country_id
     , c.country_name
     , r.region_id
     , r.region_name
FROM regions r JOIN countries c
ON c.country_id = 'US'
    AND r.region_id = c.region_id;

-- 'Seattle'�̶�� city���� �ٹ��ϴ� ����� ���, last_name, salary, -������̺�
--   �μ��� , city ��ȸ  - ��ġ���̺�

SELECT e.employee_id
     , e.last_name
     , e.salary
     , d.department_name
     , l.city
FROM employees e ,departments d ,locations l
WHERE d.department_id = e.department_id
    AND l.location_id = d.location_id
    AND l.city LIKE '%Seattle%';

-- �μ� �ڵ尡 100���� ����� ���, last_name, �μ��ڵ�, �μ���
-- job_title, max_salary, min_salary

SELECT e.employee_id
     , e.last_name
     , d.department_id
     , d.department_name
     , j.job_title
     , MAX(salary)
     , MIN(salary)
FROM departments d , employees e , jobs j
WHERE d.department_id = e.department_id
    AND e.job_id = j.job_id
    AND d.department_id = 100
GROUP BY e.employee_id, e.last_name, d.department_id, d.department_name, j.job_title;

SELECT e.employee_id
     , e.last_name
     , d.department_id
     , d.department_name
     , j.job_title
     , MAX(salary)
     , MIN(salary)
FROM departments d 
    JOIN employees e
    ON d.department_id = e.department_id
    JOIN jobs j
    ON e.job_id = j.job_id
WHERE d.department_id = 100
GROUP BY e.employee_id, e.last_name, d.department_id, d.department_name, j.job_title;


--����� 101��, job_history�� start_date�� '97/09/21'�� ����� ���, last_name,
--�μ�����, ��ġ����, ��������, ��������, ��������, ����history ���� ��������

SELECT e.employee_id
     , e.last_name
     , c.*
     , d.*
     , j.*
     , b.*
     , l.*
     , r.*
FROM employees e, departments d, countries c, job_history j, jobs b, locations l, regions r
WHERE e.employee_id = 101
    AND j.start_date = '97/09/21'
    AND b.job_id = j.job_id
    AND e.employee_id = j.employee_id
    AND d.department_id = e.department_id
    AND l.location_id = d.location_id
    AND c.country_id = l.country_id
    AND r.region_id = c.region_id;
   

    
