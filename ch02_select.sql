/*
    관계형 데이터베이스는 정보를 테이블 형태로 저장한다.
    테이블은 2차원 형태의 표처럼 볼 수 있도록 로우(ROW:행)와 컬럼(COLUMN:열)으로 구성되어있다.
*/



/* 3.4 데이터 조회
    SELECT 컬럼명
    FROM   테이블명
    WHERE  로우(행)의 조건식
     AND(OR)... 조건식
     ...
    ORDER BY 컬럼명(ASC, 생략 : 오름차순정렬 | DESC : 내림차순정렬)
   -- 조건문은 컬럼명, 연산자, 상수가 올 수 있다.
   -- 문자와 날짜 타입의 상수값은 반드시 작은 따옴표(싱글코트)로 묶는다.
   -- '문자', '영문자'는 작은 따옴표내에서 대소문자 구별

*/
-- SELECT * FROM 테이블명;
-- 사원테이블 모든 정보(*) 검색
SELECT * FROM employees;     -- 사원T

SELECT *
    FROM employees
 WHERE employee_id = 197; -- 자바와 다르게 =를 쓴다.
 
-- Last_name이 Chen
SELECT *
    FROM employees
 WHERE last_name = 'Chen'; -- 문자열은 싱글코트로 감싼다. 

/*
    테이블의 구조 조회 - DESC
    - DESC 테이블명
*/

DESC employees;
DESC departments;
-- 사원테이블 원하는 컬럼 검색
SELECT employee_id
    , last_name
    , email
    , salary
    , hire_date
 FROM employees;
------------------------------------------------------
-- 사원테이블의 사번,직업,부서 검색

-- 부서테이블의 부서ID, 부서명 검색
SELECT employee_id
    , job_id
    , department_id --열에대한 핸들링
 FROM employees;

SELECT department_id
    , department_name
 FROM departments;
 
 ------------------------------------------------------
 --부서테이블에서 부서ID가 100번인 부서의 부서ID와 부서명 검색
 SELECT department_id
    , department_name
   FROM departments
WHERE department_id = 100;

--사원테이블에서 salaly가 10000원 이상이면서 사번이 200이상인 사원의 사원의 사번, 이메일 검색
 SELECT employee_id
    , email
    , salary
   FROM employees
WHERE salary >= 10000 --행에 대한 핸들링
 AND employee_id >= 200
 ORDER BY salary ASC; -- 오름차순 정렬
 
 --부서테이블에서 부서ID가 100번이하인 부서의 부서 ID와 부서명 검색
  SELECT department_id
    , department_name
   FROM departments
WHERE department_id <= 100
 ORDER BY department_id DESC;
 
 -- 사원테이블에서 (사번이 150번 미만]인 사원의 사번, last_name, salary, 부서ID를 검색
 -- (단, 부서ID를 내림,오름차순으로 정렬하고 급여는 내림차순 정렬하시오.)
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
 ORDER BY department_id, salary ASC, employee_id ASC;  -- 부서 ID, salary가 동일하면 사번 오름차순
 
 -- 사원테이블에서 급여가 10000원 이상인 사원의 사번, last_name, salary, job_id를 검색, 단 급여는 오름차순
   SELECT employee_id
    , last_name
    , salary
    , job_id
   FROM employees
WHERE salary >= 10000
 ORDER BY salary ASC;
 
 -- 사원테이블에서 job_id가 'IT_PROG'인 경우 사번 이름 이메일 조회 (단 사번 오름차순 정렬)
    SELECT employee_id
    , last_name
    , salary
    , email
    , job_id
   FROM employees
WHERE job_id = 'IT_PROG'
 ORDER BY employee_id ASC;
 
 --부서테이블의 부서ID, 부서명, 매니저 ID를 검색하라( 단 부서 ID를 오름차순 정렬하시오)
 SELECT department_id
    , department_name
    , manager_id
 FROM departments
 ORDER BY department_id;
 
 -- 컬럼에 별칭 지정 : 1. 공백 별칭 2. as 별칭 3. "별칭"
 -- 사원테이블에서 사번, last_name, 이메일, 급여를 검색하시오( 단 급여가 10000원 이상이면서 사번이 150번보다 큰경우)
 -- 비교연산자( = : 같다 / <>, !=, ^= 같지않다.
 
 SELECT employee_id
    , last_name
    , email
    , salary
    , salary * 12 as 연봉
 FROM employees
 WHERE salary >= 10000 and employee_id > 150;
 
 -- 중복된 데이터를 한번씩만 출력하는 DISTINCT
 -- 사원테이블의 부서번호를 검색, 중복시 한번만 출력
  SELECT distinct department_id
 FROM departments
 ORDER BY department_id ASC;
 
 --p39
 -- DUAL 테이블 : 한 행으로 결과를 출력하기 위해 제공되는 테이블 .. 결과값을 한번 표시용
 -- DUMMY(varchar2(1)) 라는 하나의 컬럼으로 구성되어 있고, 데이터는 'x'값
 DESC dual;
 SELECT *
    FROM dual;
    
    
SELECT sysdate
    FROM dual;
    
-- 문자/날짜 데이터 조회
-- 사원테이블에서 last_name이 king이거나 입사일이 05/07/16인 사원의 사번, last_name이 , 입사일 검색

SELECT 
    employee_id
    ,last_name
    ,hire_date
    FROM employees
    WHERE last_name = 'King' OR hire_date = '05/07/16';
    
 /* p51
    BETWEEN AND 연산자(매우 중요)
    형식 : 컬럼명 BETWEEN A AND B : 컬럼의 데이터값이 하한값(A)과 상한값(B) 사이에 포함되는 로우를 검색하기 위한 연산자
    형식 : 컬럼명 NOT BETWEEN A AND B : 컬럼의 데이터값이 하한값(A)과 상한값(B) 사이에 포함되지 않는 로우를 검색하기 위한 연산자
*/

-- 사원테이블에서 사번, 이름, 급여 조회(단 급여는 10000~15000 사이), 급여, 사번은 오름차순 정렬
    SELECT 
    employee_id
    ,last_name
    ,salary
    FROM employees
    WHERE salary BETWEEN 10000 AND 15000
    ORDER BY salary ASC, employee_id ASC;

-- 사원테이블에서 사번, 입사일 조회(단 입사일이 03/01/01~04/12/31 근무), 입사일 오름차순 정렬
    SELECT 
    employee_id
    ,hire_date
    FROM employees
    WHERE hire_date BETWEEN '03/01/01' AND '04/12/31'
    ORDER BY hire_date ASC;
    
--p53
--IN 연산자 : 특정 컬럼의 값이 A, B, C 중에 하나라도 일치하면 참이 되는 연산자이다.
--형식 : 컬럼 값 IN(A, B, C);

--사원테이블에서 부서id가 70,80,110일 때의 사번, 이름, 부서ID로 조회(단 부서ID로 정렬)

    SELECT employee_id
    ,last_name
    ,department_id
    FROM employees
    WHERE department_id in(70,80,110)
    ORDER BY department_id ASC;
    
/* p55
    LIKE 연산자와 와일드 카드
    - 컬럼명 LIKE pattern
    - 와일드 카드 : % => 하나이상의 문자가 어떤값이 와도 혹은 아무값도 안와도 상관없다.
                  _ => 하나의 문자가 어떤 값이 와도 상관없다.
                  
*/
------- 사원테이블에서 last_name의 3번째, 4번째 단어가 'tt'인 사원의 last_name 조회
SELECT last_name
FROM employees
WHERE last_name like '__tt%';

------- 사원테이블에서 'JONES'가 포함된 EMAIL조회
SELECT email
FROM employees
WHERE email like '%JONES%';

------- JOBS 테이블에서 'REP'가 포함된 JOB_ID 조회
SELECT job_id
FROM jobs
WHERE job_id like '%REP%';

 
 /* 1.7 NULL 연산자를 이용한 검색
    대상컬럼 IS NULL
    대상컬럼 IS NOT NULL
    
    NULL : 미확정, 알수없는 값을 의미하며, 연산,할당,비교 불가능하므로 'IS NULL'을 사용한다.
    IS NULL 연산자 : 컬럼값 중에서 NULL을 포함하는 로우를 검색하기 위해 사용하는 연산자이다.
*/
--사원테이블에서 commission_pct가 null이 아닌 경우, 사번, 이름, salary, commission_pct 검색
SELECT employee_id
,last_name
,salary
,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
--사원테이블에서 department_id가 null인 사번, 이름, 부서아이디
SELECT employee_id
,last_name
,department_id
FROM employees
WHERE department_id IS NULL;
--사원테이블에서 department_id가 null 아닌 사번, 이름, 부서아이디
SELECT employee_id
,last_name
,department_id
FROM employees
WHERE department_id IS NOT NULL;

-- 사원테이블에서 manager_id가 null이 아닌 경우 사번, last_name, department_id, hire_date 검색
SELECT last_name
    ,department_id
    ,hire_date
    ,manager_id
    ,salary
FROM employees
WHERE manager_id IS NOT NULL
ORDER BY hire_date,salary;

/*
    nvl 함수 => 매우매우 중요
    null은 정해지지 않은(?) 혹은 무한대의 의미이기 때문에 연산, 할당, 비교가 불가능하다.
        연산시 관계 컬럼도 null로 바뀐다.
    NVL : NULL인 경우 비교, 연산, 할당이 불가능하므로, NULL인 경우 NVL을 이용해 대체
    NVL 함수 : NULL을 0또는 다른 값으로 변환한다.
    문법 : NVL(컬럼명, 초기값)
        단 두개의 값은 반드시 데이터 타입이 일치해야 한다.
*/

-- 사원테이블에서 commission_pct가 null이 아닌 경우의 사번, last_name, "NULL"연봉과 NVL 연봉을 구하라
-- 연봉 : 급여*12+commission_pct
-- 단 commission_pct가 null인 경우 0으로 계산하시오
-- NVL 적용시 commision_pct가 null 인 경우 0으로 대체되어 연봉계산시 정상계산
SELECT employee_id,last_name,salary,commission_pct
    ,salary * (12+commission_pct) "NULL 연봉"
    ,salary * (12+NVL(commission_pct,0)) "NVL 연봉"
FROM employees;



    