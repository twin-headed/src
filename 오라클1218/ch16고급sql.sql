/* 9����
16. ��� SQL
HR�������� ����
 1) UNION ������(������).. �ߺ����� ������ �� Query�� ���� ��ȯ
 2) UNION ALL ������(������).. �ߺ����� ���ž��� �� Query�� ���� ��ȯ 
 3) INTERSECT ������(������)
 4) MINUS ������(������)
 -- 1) UNION ������(������).. �ߺ����� ������ �� Query�� ���� ��ȯ
 -- 1) ��� ����� ���� �� ���� ���� ���λ����� ��ȸ�ϵ�, �� ��������� �ѹ��� ��ȸ
*/
SELECT employee_id
     , job_id
  FROM employees;  --107��(100~206)
UNION -- 115��
SELECT employee_id
     , job_id
  FROM job_history; --10��(���� �������)
ORDER BY employee_id;

SELECT employee_id
     , job_id
  FROM employees;  --107��(100~206)
UNION ALL-- 117��
SELECT employee_id
     , job_id
  FROM job_history; --10��(���� �������)
ORDER BY employee_id;
  
-- 3) INTERSECT ������(������)
-- ������̺��� ���� ������ ���������� ������ ������� ���
SELECT employee_id
     , job_id
  FROM job_history
ORDER BY employee_id;
--101	AC_ACCOUNT
--101	AC_MGR
--102	IT_PROG
--114	ST_CLERK
--122	ST_CLERK
--176	SA_REP
--176	SA_MAN
--200	AD_ASST
--200	AC_ACCOUNT
--201	MK_REP

SELECT employee_id
     , job_id
  FROM employees
 WHERE employee_id IN(101, 102, 114, 122, 176, 200, 201);
 
--101	AD_VP
--102	AD_VP
--114	PU_MAN
--122	ST_MAN
--176	SA_REP
--200	AD_ASST
--201	MK_MAN

-- INTERSECT ������(������) 2��
SELECT employee_id
     , job_id
  FROM employee
INTERSECT
SELECT employee_id
     , job_id;
  FROM job_history;
  
--176	SA_REP
--200	AD_ASST

-- 4) MINUS ������(������) : ��ü-������(emp 107�� - tkqjs(176, 200) = 105��
SELECT employee_id
     , job_id
  FROM employee
MINUS
SELECT employee_id
     , job_id;
  FROM job_history;
  
/*
    �߿�
2-1. �並 �̿��ؼ� TOP_N ���ϱ�
-- �Ի��� ���� ������ 5�� ���(�ζ��� ��)
-- HR �������� ����
*/

SELECT ROWNUM
     , employee_id
     , last_name
     , hire_date
     , salary
  FROM ( SELECT employee_id
              , last_name
              , hire_date
              , salary
           FROM employees
          ORDER BY hire_date ASC);
 WHERE ROWNUM <= 5
   AND hire_date IS NOT NULL;
   
-- �޿��� ���� ������� 10�� ���(�ζ��� ��)
SELECT ROWNUM --�� �࿡ ��ȣ�� �ѹ���
     , employee_id
     , last_name
     , hire_date
     , salary
  FROM ( SELECT employee_id -- ���̺�� ��ſ� ���������� �� �̰� ���̺�� ����
              , last_name
              , hire_date
              , salary
           FROM employees
          ORDER BY salary ASC) -- �ζ��� ��
 WHERE ROWNUM <= 10 
   AND salary IS NOT NULL;
   
/*      �߿�
  �м��Լ�
- ���̺� �ִ� �����͸� Ư���뵵�� �м��Ͽ� ����� ��ȯ�ϴ� �Լ�
- ������ ����� �ܼ��ϰ� ó�����ִ� �Լ�
- ������� Set�� ������� ����� �����ϴ� �Լ�
- SELECT������ �����
  FROM, WHERE, GROUP BY������ ��� �Ұ�
  ORDER BY ���������� ��밡��
  ����Ŭ 8.1.6 ���� �м��Լ� ����

-- �׷��Լ� VS �м��Լ�
 �׷��Լ��� �׷캰 �ִ�, �ּ�, �հ�, ���, �Ǽ� ���� ���Ҷ� ���Ǹ�,
 �׷캰 1���� ���� ��ȯ�Ѵ�.
 �м��Լ��� �׷������ ���� ����Ѵٴ� ������ ����������,
 �׷츶�ٰ� �ƴ϶� ��� Set�� ���ึ�� �������� �����ش�.
 �� �м��Լ��� �׷캰 ������� ���ึ�� �����ش�.
-OVER : �м��Լ����� ��Ÿ���� Ű����
- PARTITION BY : ��� ��� �׷��� ���Ѵ�.


/* �߿�
   �����Լ�
 - RANK �Լ��� ������ �ο��ϴ� �Լ��� ���� ���� ó���� �����ϴ�.
  (�ߺ� ���� ���� ������ �ǳʶ� - 1,2,2,4)
 
 - DENSE RANK �Լ��� RANK �Լ��� ���� ������ �ϳ�, ���� ����� ������ ������ ���� �ʴ´�.
 (�ߺ� ���� ���� ������ ���� -1,2,2,4)
 
-- ROW NUMBER() �Լ��� Ư�� ������ �Ϸù�ȣ�� �����ϴ� �Լ���, ���� ���� ó���� �Ұ����ϴ�.
 (�ߺ� �������� ���ϰ� - 1,2,3,4)
 
- ���� �Լ� ���� �ݵ�� ORDER BY ���� �ʼ�

-NTILE(�з�) �Լ��� ������ ����� n���� �׷����� �з��ϴ� ����� �����Ѵ�.
_NTILE(�з�����) �Լ��� ������ �з����ڸ�ŭ�� �׷����� �з��Ѵ�.

*/
-- ������ ���Ϻμ��� �޿��հ� .. HR �������� ����
SELECT department_id
     , employee_id
     , salary
     , SUM(salary) OVER(PARTITION BY department_id) sum_sal
  FROM employees
 ORDER BY department_id;
 
-- �޿��� ������� 
SELECT department_id
     , employee_id
     , salary
     , RANK() OVER(ORDER BY salary DESC) rank
  FROM employees;
  
--�����Լ� ��
SELECT department_id
     , employee_id
     , salary
     , RANK() OVER(ORDER BY salary DESC) rank
     , DENSE_RANK() OVER(ORDER BY salary DESC) d_rank
     , ROW_NUMBER() OVER(ORDER BY salary DESC) r_number
  FROM employees;
  
-- �����Լ� NTILE(�з�)
SELECT employee_id
    , NTILE(2) OVER(ORDER BY employee_id) grp2 -- ��ü�� 2����Ͽ� 1,2�� ǥ��
    , NTILE(3) OVER(ORDER BY employee_id) grp3 -- ��ü�� 3����Ͽ� 1,2,3�� ǥ��
    , NTILE(5) OVER(ORDER BY employee_id) grp5 -- ��ü�� 5����ؼ� 1,2,3,4,5�� ǥ��
  FROM employees;

/* ������ �Լ�
- �м��Լ� �߿��� ��������(WINDOWING)�� ����ϴ� �Լ��� �������Լ���� �Ѵ�.
- ���������� ����ϰ� �Ǹ� PARTITION BY ���� ��õ� �׷��� ���� ���������� �׷����� �� �ִ�.
- ���������� �м��Լ� �߿��� �Ϻ�(AVG, SUM, MAX, MIN, COUNT)�� ����� �� �ִ�.
- ROWS : �������� ROW ������ �������� �����Ѵ�.
- RANGE : ������ �������� �������� �����Ѵ�.
*/

-- ROWS ��뿹��
-- �μ����� ���� ROW�� �޿��� ���� ROW�� �޿� �հ踦 ���
-- ROWS 2 PRECEDING -> ���� + ���� + �� ����
SELECT employee_id
     , last_name
     , department_id
     , salary
     , SUM(salary) OVER(PARTITION BY department_id
                   ORDER BY employee_id                
                   ROW 2 PRECEDING)pre_sum
  FROM employees;

/* RANGE ��뿹�� - �߿�
-- �������� �ý��� �м� ȭ�鿡 ������, �����, �б⺰ �հ�, �б⺰ ���
*/
WITH test AS
(
    SELECT '202001' yyyymm, 100 amt FROM dual
    UNION ALL SELECT '202002' yyyymm, 200 amt FROM dual
    UNION ALL SELECT '202003' yyyymm, 300 amt FROM dual
    UNION ALL SELECT '202004' yyyymm, 400 amt FROM dual
    UNION ALL SELECT '202005' yyyymm, 500 amt FROM dual
    UNION ALL SELECT '202006' yyyymm, 600 amt FROM dual
    UNION ALL SELECT '202008' yyyymm, 800 amt FROM dual
    UNION ALL SELECT '202009' yyyymm, 900 amt FROM dual
    UNION ALL SELECT '202010' yyyymm, 1000 amt FROM dual
    UNION ALL SELECT '202011' yyyymm, 1100 amt FROM dual
    UNION ALL SELECT '202012' yyyymm, 1200 amt FROM dual
)
SELECT yyyymm
     , amt
     , SUM(amt) OVER(ORDER BY TO_DATE(yyyymm, 'yyyymm')
       RANGE BETWEEN INTERVAL '3' MONTH PRECEDING
                 AND INTERVAL '1' MONTH PRECEDING) amt_pre3 -- ���� 3����(������� ������)
     , SUM(amt) OVER(ORDER BY TO_DATE(yyyymm, 'yyyymm')
       RANGE BETWEEN INTERVAL '1' MONTH FOLLOWING
                 AND INTERVAL '3' MONTH FOLLOWING) amt_post3 -- ���� 3����(������� ������)
  FROM test;      
  
/* �ſ� �߿� : ROLLUP
-- GROUP BY ������ ����� �Ұ� �� �հ� ������ �߰��� ��Ÿ���� �Լ�
-- ROLLUP : �ܰ躰 �Ұ�
*/
-- ROLLUP ����
-- ���1. �μ��� �޿� �հ�� ��ü �հ踦 ��ȸ
SELECT department_id
     , sum(salary)
  FROM employees
  GROUP BY ROLLUP(department_id);

-- ROLLUP ����2
-- ���2. �μ��� �޿� �հ�� ��ü �հ�(�Ѱ�)�� ��ȸ - UNION ALL
SELECT department_id
     , sum(salary) s_sal
  FROM employees
 GROUP BY department_id     --�μ��� �հ�
UNION ALL
SELECT null "department_id"
     , sum(salary) s_sal
  FROM employees
 ORDER BY department_id;    --�����հ�
 
 
 --ROLLUP ����2
-- �μ��� �޿� �հ�� ��ü �հ�(�Ѱ�)�� ��ȸ
SELECT department_id
     , employee_id
     , sum(salary) s_sal
  FROM employees
 WHERE department_id IS NOT NULL
  GROUP BY ROLLUP(department_id, employee_id);
  
-- ROLLUP ����3. �߿�
-- �μ���, job_id�� �޿��� ������ �հ�
-- �μ���, job_id�� �Ұ�, �޿��հ�, ������ �հ�

SELECT d.department_name
     , e.job_id
     , sum(e.salary)
     , COUNT(e.employee_id)
  FROM employees e, departments d
 WHERE d.department_id = e.department_id
   AND d.department_name IS NOT NULL
    GROUP BY ROLLUP(d.department_name, e.job_id);
    
