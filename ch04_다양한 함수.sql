/*
    ch04. �پ��� �Լ�
    01. ���� ó�� �Լ�(��ҹ��� ��ȯ�Լ�)
    
    1.LOWER : �ҹ��ڷ� ��ȯ
    2.UPPER : �빮�ڷ� ��ȯ
    3.INITCAT : ù���ڸ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ��ȯ
*/


--������̺��� last_name�� King�� ��� ��ȸ

SELECT last_name
FROM employees
WHERE INITCAP(last_name) = 'King';

--������̺��� �̸����� 'TFOX'�� ��� email��ȸ
SELECT email
FROM employees
WHERE LOWER(email) = 'tfox';

/*
    p105
    01.���� ó�� �Լ�(���� ���� �Լ�)
    ����      ����
    CONCAT - ������ ���� �����Ѵ�.('||'�� ����)
    SUBSTR - ���ڸ� �߶� �����Ѵ�.
    INSTR - Ư�� ������ ��ġ���� ��ȯ�Ѵ�.
    LPAD, RPAD - �Է¹��� ���ڿ��� ��ȣ�� �����ؼ� Ư�� ������ ���ڿ��� ��ȯ�Ѵ�.
    TRIM - �߶󳻰� ���� ���ڸ� ǥ���Ѵ�.
*/

--1. CONCAT - ������ ���� �����Ѵ�.('||'�� ����)
-- '03/06/17'�� �Ի��� ����� ���, �Ի���(03/06/17 -> 2003/06/17) , �̸�(first_name + ' ' + last_name) ��Ī�ο�

SELECT CONCAT('20', hire_date) "�Ի���"
      ,first_name || ' ' || last_name "�̸�"
      ,employee_id "���"
FROM employees
WHERE hire_date = '03/06/17';

/*
2. SUBSTR - ���ڸ� �߶� ����
    ���� : SUBSTR(���,������ġ,�����Ұ���)
    -���� ��ġ�� ����� ��� ���� 1���� �����ϰ�, ������ ��� ���ʺ��� �����Ѵ�.
*/
-- welcome to oracle -- come ��� : �տ�������, �ڿ������� ���
SELECT SUBSTR('welcome to oracle',4,4)
FROM DUAL;

-- �Ի�⵵�� 04���̰ų� 06�⵵�� ����� ���, �Ի���(----�� --�� --��) ��ȸ, �Ի��� ������ ����

SELECT employee_id "���"
      ,'20' || SUBSTR(hire_date,1,2) || '��' || SUBSTR(hire_date,4,2) || '��' || SUBSTR(hire_date,7,2) || '��' "�Ի���"
FROM employees
WHERE SUBSTR(hire_date,1,2) = '04' OR SUBSTR(hire_date,1,2) = '06' -- SUBSTR(hire_date,1,2) IN('04','06')
ORDER BY hire_date;

/*
3. INSTR - ���ڿ� ���� �ش� ���ڰ� ��� ��ġ�� �����ϴ��� �˷���
- ���� : INSTR(���, ã�� ����, ������ġ, ���° �߰�)
        ���� ��ġ�� ���° �߰��� ������ ��� 1�� ����
*/

-- 'Oracle mania'���� a�� 1���� ����, 1���� �߰ߵ� ��ġ
-- 'Oracle mania'���� a�� 5���� ����, 2��° �߰ߵ� ��ġ

SELECT INSTR('oracle mania','a')
FROM DUAL;

/*
110p
4. ���� LAPD(�÷���, �ڸ���, 'Ư�� ��ȣ')
RPAD
-��� ���ڿ��� ��õ� �ڸ������� ���ʿ� ��Ÿ����, ���� ������ �ڸ��� Ư�� ��ȣ�� ä����
LPAD
-��� ���ڿ��� ��õ� �ڸ������� �����ʿ� ��Ÿ����, ���� ���� �ڸ��� Ư�� ��ȣ�� ä��
*/

/*
5.TRIM : ���ʿ��� ��������
- Į���̳� ����ڿ����� Ư�� ���ڰ� ù��° �����̰ų� ������ �����̸� �߶󳻰� ���� ���ڿ��� ��ȯ

*/
SELECT ' Oracle mania '
     , LTRIM(' Oracle mania ')
     , RTRIM(' Oracle mania ')
   FROM dual;
   
SELECT ' Oracle mania '
     , TRIM('O' FROM 'Oracle mania')
FROM dual;

/*
02. �����Լ�
 ROUND : Ư�� �ڸ������� �ݿø��Ѵ�.
 TRUNC : Ư���ڸ������� �߶󳽴�.(����)
 MOD : �Է¹��� ���� ���� ������ ���� ��ȯ�Ѵ�.
 */
 --1. ROUND : Ư�� �ڸ������� �ݿø��Ѵ�.
 --�ι�° ���ڰ��� 0�̸� �Ҽ������� 1��° �ڸ��� �ݿø��ϰ�, -1�̸� ���� �ڸ����� �ݿø��ϰ�, �����ڸ��� 0���� ä���.
 SELECT ROUND(98.7654,2)
      , ROUND(98.7654,1)
      , ROUND(98.7654,0)
      , ROUND(98.7654,-1)
      , ROUND(94.7654,-1)
  FROM dual;
--98.77 98.8    99  100 90

--2,TRUNC : Ư���ڸ������� �߶󳽴�.(����)
-- �ι�° ���ڰ��� 0�̸� �Ҽ������Ͽ��� ������, -1�̸� ���� �ڸ����� ������, ���� �ڸ��� 0���� ä���.
SELECT TRUNC(98.7654,2)
     , TRUNC(98.7654,1)
     , ��TRUNC(98.7654,0)
     , TRUNC(98.7654,-1)
     , TRUNC(94.7654,-1)
  FROM dual;
--98.76   98.7   98  90     90

--3.MOD : �Է¹��� ���� ���� ������ ���� ��ȯ�Ѵ�.
SELECT MOD(27,2) --1
     , MOD(27,5) --2
  FROM dual;
  
-- 4. ABS : ���밪�� ��ȯ�ϴ� �Լ�
SELECT -10   -- -10
    , ABS(-10)  -- 10
  FROM dual;

-- 5. FLOOR �Լ� : �Ҽ��� ���ϸ� ������ �Լ�
SELECT 34.56789        -- 34.56789
     , FLOOR(34.56789)      -- 34
  FROM dual;
  
/* 03. ��¥�Լ� - �ſ��߿�

p117 ǥ
 ����                             ����
SYSDATE             �ý��ۿ� ����� ���� ��¥�� �ݺ��Ѵ�.
MONTHS_BETWEEN      �� ��¥ ���̰� �� ���������� ��ȯ�Ѵ�.
ADD_MONTHS          Ư�� ��¥�� �������� ���Ѵ�.
NEXT_DAY            Ư�� ��¥���� ���ʷ� �����ϴ� ���ڷ� ���� ������ ��¥�� ��ȯ�Ѵ�.
LAST_DAY            �ش� ���� ������ ��¥�� ��ȯ�Ѵ�.
ROUND               ���ڷ� ���� ��¥�� Ư�� �������� �ݿø��Ѵ�.
TRUNC               ���ڷ� ���� ��¥�� Ư�� �������� ������.
*/

SELECT sysdate ����
    , sysdate -1 ����
    , sysdate +1 ����
    , sysdate +2 ��
 FROM dual;
 
 /*
 1. ROUND               ���ڷ� ���� ��¥�� Ư�� �������� �ݿø��Ѵ�.
  ���� : ROUND(date, format)
  format�� 'MONTH'�� ���, ���� �������� 16���� ������ �̹��� 1��, 16�̻��̸� ������ 1��
 */
 
 SELECT employee_id
      , hire_date �Ի���
      , ROUND(hire_date, 'MONTH') R_�Ի���
      , sysdate - hire_date   �ٹ��ϼ�
      , ROUND(sysdate - hire_date) R_�ٹ��ϼ�
    FROM employees
   ORDER BY hire_date;
    
/*
TRUNK : ���ڷ� ���� ��¥�� Ư�� �������� ������.
- ���� : TRUNC(date,format)
- format�� 'MONTH'�� ���, ���� �������� �ڸ���. �̹��� 1�� 
*/

 SELECT employee_id
      , hire_date �Ի���
      , TRUNC(hire_date, 'MONTH') T_�Ի���
      , sysdate - hire_date   �ٹ��ϼ�
      , TRUNC(sysdate - hire_date) T_�ٹ��ϼ�
    FROM employees
   ORDER BY hire_date;
   
/*
3. MONTHS_BETWEEN
-���� : MONTHS_BETWEEN(date1, date2)
-�� ��¥���̰� �� ���������� ��ȯ�Ѵ�.
*/
-- ���, �Ի���, �ٹ�������, R_�ٹ�������, T_�ٹ�������

SELECT employee_id ���
     , hire_date �Ի���
     , MONTHS_BETWEEN(sysdate, hire_date) �ٹ�������
     , ROUND(sysdate - hire_date) R_�ٹ�������
     , TRUNC(sysdate - hire_date) T_�ٹ�������
FROM employees;

/*
4.ADD_MONTHS
-Ư�� �������� ���� ��¥�� ���ϴ� �Լ�
= ���� : ADD_MONTHS(date, number)
*/
-- ���, �Ի���, �Ի� 3����
SELECT employee_id ���
    , hire_date �Ի���
    , ADD_MONTHS(hire_date,3) "�Ի� 3����"
FROM employees;

-- ����6���� ���� ��¥ ���ϱ�
SELECT ADD_MONTHS('20/11/09',6)
FROM dual;

/*
5. NEXT_DAY
-NEXT_DAY �Լ��� �ش� ��¥�� �������� ���ʷ� �����ϴ� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ�ϴ� �Լ��̴�.
- ���� NEXT_DAY(date, ����)
- ���� ��� ���ڰ� �� �� �ִ�. 1.�Ͽ��� 2. ������ .... 7.�����
*/
SELECT sysdate
     , NEXT_DAY(sysdate,'�Ͽ���')
     , NEXT_DAY(sysdate,'������')
     , NEXT_DAY(sysdate,'�ݿ���')
     , NEXT_DAY(sysdate,'�����')
     , NEXT_DAY(sysdate,5)
  FROM dual;
  
/*
6. LAST_DAY
- LAST_DAY �Լ��� �ش� ��¥�� ���� ���� ������ ��¥�� ��ȯ�ϴ� �Լ��̴�.
- ���� : LAST_DAY(date)
*/
-- ���, �Ի���, "�Ի��� ���� ������ ��"
SELECT employee_id ���
     , hire_date �Ի���
     , LAST_DAY(hire_date) "�Ի��� ���� ������ ��"
FROM employees

/*p 124 �ſ� �߿�
04. ����ȯ �Լ�
- ����Ŭ���� ������������ ��ȯ�ؾ� �ϴ� ��� TO_NUMBER, TO_CHAR, TO_DATE�� ���
����                      ����
TO_CHAR                 ��¥�� Ȥ�� �������� ���������� ��ȯ�Ѵ�.
TO_DATE                 �������� ��¥������ ��ȯ�Ѵ�.
TO_NUMBER               �������� ���������� ��ȯ�Ѵ�.
*/

1.TO_CHAR
-��¥�� Ȥ�� �������� ���������� ��ȯ�Ѵ�.
-���� : TO_CHAR(��¥������, '�������')
-��¥ ��� ����
 ����     �ǹ�
 YYYY   �⵵ǥ��(4�ڸ�)
 YY     �⵵ǥ��(2�ڸ�)
 MM     ���� ���ڷ� ǥ��
 MON    ���� ���ĺ����� ǥ��
 DAY    ���� ǥ��
 DY     ������ ���� ǥ��
 */
 --1. TO_CHAR(��¥�� | ������) -> ���������� ��ȯ�Ѵ�.
 --���� : TO_CHAR(��¥������, '�������')
 SELECT sysdate -- 20/12/09
     , TO_CHAR(sysdate,'YY-MM-DD')
     , TO_CHAR(sysdate,'YY-MM-DD DAY')  -- 20-12-09 ������
     , TO_CHAR(sysdate,'YY-MM-DD (DAY)')  -- 20-12-09 (������)
     , TO_CHAR(sysdate,'YY-MM-DD DY') --  20-12-09 ��
     , TO_CHAR(sysdate,'YY-MM-DD(DY)') --  20-12-09(��)
 FROM dual;
 
-- �ð� ǥ��
-- ���� -> AM | ���� -> PM
-- 12�ð��� ��� -> HH:MI:SS     | 24�ð� -> HH24:MI:SS
-- 20-12-09(��) 12�ð� | 24�ð�
SELECT TO_CHAR(sysdate,'YY-MM-DD(DY) HH-MI-SS(DY)')
     , TO_CHAR(sysdate,'YY-MM-DD(DY) HH24:MI:SS(DY)')
FROM dual;

/*
2.TO_CHAR : ���� -> ���������� ��ȯ
-- ���� : TO_CHAR(����, '�������')
- L : �� ������ ��ȭ��ȣ�� �տ� ǥ�� ��)�ѱ�: ��       --��+����Ű
- , : õ���� �ڸ� ������ ǥ��
- . : �Ҽ����� ǥ��
- 9 : �ڸ����� ��Ÿ����, �ڸ����� ���� �ʾƵ� 0���� ä���� �ʴ´�.
- 0 : �ڸ����� ��Ÿ����, �ڸ����� ���� ���� ��� 0���� ä���.
*/

-- ���, �޿�, ��500,000 ��0,009,000
SELECT TO_CHAR(salary,'L9,999,999')
    ,TO_CHAR(salary,'L0,009,999')
FROM employees;

/*
3.TO_DATE
- ���ڿ��� ��¥������ ��ȯ�Ѵ�.
- ���� : TO_DATE('����','��¥format')
*/
-- �Ի����� 03/06/17 ����� ���, �Ի���(03/06/17) ��ȸ
SELECT employee_id ���
     , hire_date
     , TO_CHAR(hire_date,'YYYY-MM-DD(DY)')
FROM employees
WHERE hire_date = TO_DATE('20030617','YYYY-MM-DD');

--�����ϼ� 11/9���� ������� �ϼ�

SELECT ROUND(sysdate - TO_DATE('20201109','YYYY-MM-DD'))
FROM dual;

/*
4.TO_NUMBER
- ���ڿ��� ���������� ��ȯ�Ѵ�.
*/
SELECT '100,000' - '50,000'
  FROM dual; -- ���� : ���ڿ��� ����Ұ�
  
SELECT TO_NUMBER('100,000','9,999,999') - TO_NUMBER('50,000','9,999,999')
    FROM dual;      -- ���� : ���ڿ��� ���ڷ� ��ȯ�����Ƿ� ��� ����

/* p130
05. �Ϲ��Լ�
1 NVL �Լ�
2 NVL2 �Լ�
3 NULLIF �Լ�
4 COALESCE �Լ�
*/

/*
2.NVL2 �Լ�
-���� : NVL2(expr1, expr2, expr3)
-expr1�� �˻��Ͽ� �� ����� null�̸� expr3�� ��ȯ�ϰ� , null�� �ƴϸ� expr2�� ��ȯ
*/
-- ������̺��� ���, �̸�, commission_pct, salary, ���� ��ȸ
-- ���� : commission_pct�� null �̸� salary*12��ȯ null�� �ƴϸ� salary*(12+commission_pct)�� ��ȯ
SELECT employee_id ���
     , last_name �̸�
     , commission_pct
     , salary
     , NVL2(commission_pct,salary*(12+commission_pct),salary*12)
FROM employees;


/*
3. NULLIF �Լ�
-- ���� : NULLIF(expr1, expr2)
-- �� ǥ������ ���Ͽ� ������ ��쿡�� NULL�� ��ȯ�ϰ�, �������� ������ ù��° ǥ������ ��ȯ
*/
--131p 132p ����

/*
4. COALESCE
-- ���� : COALESCE(expr-1, expr-2, .. expr-n)
-- expr-1�� null�� �ƴϸ� expr-1�� ��ȯ
-- expr-1�� null�̰� expr-2�� null�� �ƴϸ� expr-2�� ��ȯ
-- expr-n�� null�� �ƴϸ� expr-n�� ��ȯ 
*/
SELECT employee_id
     , last_name
     , salary
     , commission_pct
     , COALESCE(commission_pct, salary, 0) --�Ѵ� null�̸� 0�� ��ȯ
   FROM employees;



