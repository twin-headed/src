/*
3����
5-1��. �׷��Լ�
5-2��. GROUP by
5-3��. HAVING��
*/
/*
- �׷��Լ� : ���̺��� ��ü �����Ϳ��� ������� ����� ���ϱ� ���ؼ� �� ���տ� �����Ͽ� �ϳ��� ����� ����
����      ����
SUM     �׷��� ���� �հ踦 ��ȯ
AVG     �׷��� ����� ��ȯ
COUNT   �׷��� �� ������ ��ȯ
MAX     �׷��� �ִ밪�� ��ȯ
MIN     �׷��� �ּҰ��� ��ȯ
*/

-- 1. SUM : �հ� �׷��Լ�
SELECT SUM(salary)
FROM employees;
-- 2. AVG : ��� �׷��Լ�
-- �޿���� : �Ҽ��� 3°�ڸ����� �ݿø�
SELECT ROUND(AVG(salary),2)
FROM employees;
-- �޿���� : ���� ���(�ݿø�)
SELECT ROUND(AVG(salary),0)
FROM employees;

SELECT FLOOR(AVG(salary))
FROM employees;
-- 3.MAX, MIN : �ִ밪, �ּҰ� �׷��Լ�
-- �ִ�޿�, �ּұ޿�
SELECT MAX(salary)
FROM employees;
SELECT MIN(salary)
FROM employees;
-- �ֱ� �Ի���, ���� ������ �Ի���
SELECT MAX(hire_date)
FROM employees;

SELECT MIN(hire_date)
FROM employees;

-- 4. COUNT(*) : ��ü��(=row, record) ������ ���ϴ� �׷��Լ�
-- NULL������ �� ��, �ߺ��� ���� ����Ͽ� ���õ� ������� ����Ʈ�� ����
-- �����
SELECT COUNT(*)
  FROM employees; -- 107

-- COUNT(�÷���) : �÷������� �ĺ��Ǵ� ������ NULL�� �ƴ� ���� ����
-- NULL�� ���Ѱ����� ���� �ʴ´�...COUNT(*) + WHERE �÷��� IS NOT NULL �� ����
-- "Ŀ�̼��� �޴� �����"

SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT COUNT(commission_pct)
FROM employees;

-- job_id ���� -- �ߺ� ����
SELECT COUNT(job_id)
FROM employees;

-- job_id  ���� -- �ߺ��ȵ� ����
SELECT COUNT(DISTINCT job_id)
FROM employees;

-- ��ġ �Ұ� ==> ����
SELECT employee_id  -- 107rjs
     , MAX(salary)   -- 1��
  FROM employees;
  
  
/*
02. ������ �׷� : GROUP BY
- Ư�� �÷��� �������� �׷캰�� ������ ���
- ����
 SELECT �÷���1, �÷���2, �׷��Լ�
    FROM ���̺��
  WHERE ����(������)
  GROUP BY �÷���1, �÷Ÿ�2
  ORDER BY �÷� ASC | DESC;
  
- � �÷����� �������� �׷��Լ��� �������� ����� ��쿡��
  SELECT���� GROUP BY �ش��÷��� ���
  
- GROUP BY�� ������ �÷��� ��Ī�� ���Ұ�
- �׷��Լ��� �ƴ� SELECT ����Ʈ�� ��� �Ϲ� �÷��� GROUP BY ���� �ݵ�� ����ؾ� �Ѵ�.
  �׷��� �ݴ�� GROUP BY ��������� �÷��� �ݵ�� SELECT ����Ʈ�� �־�� �ϴ°� �ƴϴ�.
  ���� ����� ���ǹ��ϴ�.
  
- �׷��Լ��� �ι����� ��ø�ؼ� ��밡���ϴ�. ��) MAX(AVG(salary))
  ��ø�׷��Լ��� select list�� �Ϲ��÷� ���Ұ� -> HAVING �������� subquery�� ���
*/
-- �μ��� �ִ�޿�(�� �μ���ȣ �������� ����)
SELECT department_id , MAX(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- �μ��� �ִ� ��� �޿�(�� �μ���ȣ �������� ����)
SELECT department_id, MAX(AVG(salary)) -- ��ø�׷��Լ��� select list�� �Ϲ��÷� ���Ұ�
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- �μ���, ������  �ο���, �ִ�޿�, �ּұ޿�, �޿��հ�, �޿����
-- �μ�, ������ �������� ����(�� �μ��� NULL ������)
SELECT department_id
     , job_id
     , COUNT(*)
     , MAX(salary)
     , MIN(salary)
     , SUM(salary)
     , AVG(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

/*  �ſ� �߿�
03. �׷� ��� ���� : HAVING��
 - ǥ���� �׷��� �����Ͽ� ���� ������ �������� �׷� ����� ����
 - HAVING + �׷��Լ� ������
 CF) WHERE + �Ϲ��÷� ������
 
 - ����
  SELECT �÷���1, �÷���2, �׷��Լ�
    FROM ���̺��
  WHERE ����(������)
  GROUP BY �÷���1, �÷Ÿ�2
  HAVING �׷��Լ� ������
  ORDER BY �÷� ASC | DESC;
*/
-- �μ��� �ִ�޿�, �ѱ޿�(�� �ѱ޿��� 15000�̻�), �μ��ڵ� �������� ����
-- �μ��ڵ尡 ������ ��ŵ

SELECT department_id
     , MAX(salary)
     , SUM(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING SUM(salary) >= 15000
ORDER BY department_id ASC;

-- ������ �޿����, �޿��Ѿ� ���ϱ�, �� �޿������ 5000�̻�
-- �Ҽ��� ���ϴ� ������ ����, ���� ����, IT �μ� ��ŵ

SELECT job_id
     , ROUND(AVG(salary),0)
     , ROUND(SUM(salary),0)
FROM employees
WHERE job_id NOT LIKE '%IT%'
GROUP BY job_id
HAVING AVG(salary) >= 5000
ORDER BY job_id

