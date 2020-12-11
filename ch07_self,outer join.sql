/* p175
SELF JOIN : �߿�
- �ϳ��� ���̺� �ִ� �÷����� �����ؾ� �ϴ� ������ �ʿ��� ��� ���
- �ڱ��ڽŰ� ������ �δ°�
- ���� ���̺��� �ϳ� �� �����ϴ� ��ó�� ������ �� �ֵ���, ���̺� ��Ī�� ����Ѵ�.
- ������̺����� manager_id �÷��� �����ϴµ�, �� �÷��� �� ����� ���Ŵ��� ����̴�.
- ������̺� : employees e �Ŵ������̺� : employees m 
- ���� ���̺������� �Ŵ����� ����̹Ƿ� e.manager_id = m.employee_id ó�� ���� �� �ִ�.
*/

-- SELF JOIN
--156�� ����� ���, last_name, �Ŵ���_id, �Ŵ��� last_name
SELECT e.employee_id  "���"
     , e.last_name    "�����"
     , e.manager_id   "�Ŵ��� ID"
     , m.last_name    "�Ŵ�����"
  FROM employees e -- ���T
    , employees m -- �Ŵ���T
 WHERE e.manager_id = m.employee_id
   AND e.employee_id = 156;    --156 King 146 Partners

-------------------------------------------
/* p175
   OUTER JOIN

*/
SELECT DISTINCT department_id
FROM employees
ORDER BY department_id ASC;

SELECT department_id
 FROM departments
 ORDER BY department_id;
 
-- 10~110�μ��� �μ����� ��ȸ(120~270�� �μ��� �μ��� ��ȸ�ȵ�)
-- �μ����� ���, ������̺� �μ��ڵ尡 null������ �μ����̺��� �μ������� ���,

SELECT DISTINCT e.department_id
        , d.department_name
FROM employees e
    , departments d
WHERE e.department_id(+) = d.department_id --(+)������ �����;ƿ��� ���ΰ� ����
ORDER BY department_id;

SELECT DISTINCT e.department_id
        , d.department_name
FROM employees e
    RIGHT JOIN departments d
ON e.department_id = d.department_id --(+)������  RIGHT OUTER JOIN - ������ ������(PK)�̰�, null(FK)�ʿ� (+)�߰� ������ �ǹ̴� �����Ͱ� ���� ��
ORDER BY department_id;

/*
 OUTER JOIN
 EQUI JOIN���� ���� �÷��� �� �ϳ��� NULL������ ���� ����� ����� �ʿ䰡 �ִ� ��쿡 OUTER JOIN�� ���
 - �ΰ� �̻��� ���̺��� ���ε� �� ��������� ���̺�(�μ�)���� �ش� �����Ͱ� �����ϴµ�,
 �ٸ� ���̺�(���)���� �����Ͱ� ��������� �ʴ� ���, �μ� �����Ͱ� ��µ��� �ʴ� ������ �ذ��ϱ� ���� �����̴�,
 NULL���� ���� ���� ���ΰ���� ��������ʴ´�.
 NULL�� ���ؼ� � ������ �����ϴ��� �������� NULL�̱� �����̴�.
 ���� OUTER JOIN�� �̿��ϸ� NULL�̱⿡ ������ ���� ����� ������ �� ������,
 (+)��ȣ�� �������ǿ��� ������ ������ ���̺��� �÷��̸��ڿ� ���δ�.
 
 RIGHT, LEFT, FULL 3������ �ִ�.
 -RIGHT OUTER JOIN : ���̺� ������ ������ �����̸�, ���� ���̺� ���ν�ų �÷��� ���� ���� ��쿡 ���
                    �ݵ�� ������ �Ǵ� ����, �����Ͱ� ��� ��µǾ�� �Ѵ�.
    => ���� ���̺� �÷��ڿ�(+)�� �߰��� �Ͱ� ����(FROM ���� ���� ���̺��� NULL �̴��� ��µǾ�� �Ѵ�.)

 -LEFT OUTER JOIN : ���̺� ������ ���� �����̸�, ������ ���̺� ���ν�ų �÷��� ���� ���� ��쿡 ���
                    �ݵ�� ������ �Ǵ� ����, �����Ͱ� ��� ��µǾ�� �Ѵ�.
    => ������ ���̺� �÷��ڿ�(+)�� �߰��� �Ͱ� ����(FROM ���� ������ ���̺��� NULL �̴��� ��µǾ�� �Ѵ�.)
    
   -FULL OUTER JOIN : ���� ���̺� ��� OUTER JOIN �ɾ�� �ϴ� ��� ����Ѵ�.
   => ���� ���̺� �÷��ڿ� (+)�� �߰�
    
 
 */
 
 
-- OUTER JOIN, SELF JOIN�� �̿��Ͽ� �Ŵ����� ���� ����� �����Ͽ�,
-- ���, �����, �Ŵ���ID, �Ŵ����� ���(��� ��������)

SELECT e.employee_id
     , e.last_name
     , m.employee_id
     , m.last_name
FROM employees e 
    RIGHT JOIN employees m
ON e.manager_id = m.employee_id ;

-- SELF JOIN�� �̿��Ͽ� �Ŵ������� ���� �Ի��� ����� 
-- ���, �����, ����Ի���, �Ŵ���ID, �Ŵ����� ���(��� ��������)

SELECT e.employee_id
     , e.last_name
     , e.hire_date
     , m.hire_date
     , m.employee_id
     , m.last_name
FROM employees e
    JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;
