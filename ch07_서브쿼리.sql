
/* p188
    ��������
- �ϳ��� SELECT ������ ���ȿ� ���Ե� �� �ϳ��� SELECT �����̴�.
  ���������� ���������� ����� ���� ��ȯ�Ѵ�.
  ��, ������������ ����� ����� ���������� ���޵Ǿ� �������� ����� ����Ѵ�.
- �������� : ���������� �����ϰ� �ִ� ������
- �������� : ���Ե� �� �ϳ��� ����������, �񱳿������� �����ʿ� ����ϰ�, �ݵ�� ��ȣ�ȿ� �־�� �Ѵ�,
            ���������� ����Ǳ����� �ѹ��� ����ȴ�.
- ���� : ������ ��������, ������ ��������

������ �������� : �������� ���� �ϳ��� �ุ�� ��ȯ�ϴ� ��������
      ������ : >,>=,<,<=,=,<>
������ �������� : �������� �ϳ� �̻��� ���� ��ȯ�ϴ� ��������
      ������ : IN, ANY, SOME, ALL, EXISTS
      

*/

-- 1. ������ ��������
-- 'Chen'�� �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ���Ͻÿ�(�޿��� ��������)

SELECT employee_id
     , last_name
     , salary
FROM employees
WHERE salary > (SELECT salary
                    FROM employees
                    WHERE last_name = 'Chen')
ORDER BY salary ASC;          

-- 'Chen'�� ���� �μ����� ���ϴ� ����� ���, �̸�, �μ���ȣ, �μ��� �˻�

SELECT e.employee_id
     , e.last_name
     , d.department_id
     , d.department_name
FROM employees e , departments d
WHERE e.department_id = d.department_id
    AND d.department_name = (SELECT d.department_name
                            FROM employees
                            WHERE last_name = 'Chen');
                            
                            
SELECT e.employee_id
     , e.last_name
     , e.job_id
     , e.salary
FROM employees e
WHERE e.job_id = (SELECT e.job_id
                        FROM jobs
                        WHERE job_title LIKE '%Programmer%');
 
                        
                            
                            

                            
