/* [3����] p134
5. DECODE : �ڹ��� switch case���� ����
- ���ǿ� ���� �پ��� ������ ����
- ���� : DECODE(ǥ����, ����1, ���1,
                        ����2, ���2,
                        ����3, ���3,
                        ����4, ���4,
                        �⺻���n);
*/


/*
    ������̺��� �μ�ID�� 10~50�� ��� �μ�ID�� �μ��� ���
    �� �ܴ� '�μ�����' ���� ���
    �μ� ID�� �����Ѵ�.
    �� �μ�ID�� �ߺ����� �ʾƾ� �ϸ�, �μ�ID�� NULL�̸� ��µ��� �ʾƾ� �Ѵ�.
*/

SELECT DISTINCT department_id
    , DECODE(department_id, 10, 'Administration',
                             20, 'Marketing',
                             30, 'Purchasing',
                             40, 'Human_Resource',
                             50, 'Shipping',
                             '�μ�����') AS �μ���                 
FROM employees
WHERE department_id IS NOT NULL
ORDER BY department_id;

/* p135
5.6 CASE�Լ� : �ڹ��� if else�� ������ ������ ������.
- ����
CASE ǥ����
    WHEN ����1 THEN ���1
    WHEN ����2 THEN ���2
    WHEN ����3 THEN ���3
    WHEN ����4 THEN ���4
    ELSE ���n
 END;
 
 ǥ������ �ȿ� �� ���̽�
 CASE 
    WHEN ǥ���� = ����1 THEN ���1
    WHEN ǥ���� = ����2 THEN ���2
    WHEN ǥ���� = ����3 THEN ���3
    WHEN ǥ���� = ����4 THEN ���4
    ELSE ���n
 END;

*/

/*
    ������̺��� �μ�ID�� 10~50�� ��� �μ�ID�� �μ��� ���
    �� �ܴ� '�μ�����' ���� ���
    �μ� ID�� �����Ѵ�.
    �� �μ�ID�� �ߺ����� �ʾƾ� �ϸ�, �μ�ID�� NULL�̸� ��µ��� �ʾƾ� �Ѵ�.
*/

SELECT DISTINCT department_id,
    CASE department_id
        WHEN 10 THEN 'Administration'
        WHEN 20 THEN 'Marketing'
        WHEN 30 THEN 'Purchasing'
        WHEN 40 THEN 'Human_Resource'
        WHEN 50 THEN 'Shipping'
        ELSE '�μ�����'
    END
FROM employees
WHERE department_id IS NOT NULL
ORDER BY department_id;