/*
3일차
5-1장. 그룹함수
5-2장. GROUP by
5-3장. HAVING절
*/
/*
- 그룹함수 : 테이블의 전체 데이터에서 통계적인 결과를 구하기 위해서 행 집합에 적용하여 하나의 결과를 생산
구분      설명
SUM     그룹의 누적 합계를 반환
AVG     그룹의 평균을 반환
COUNT   그룹의 총 개수를 반환
MAX     그룹의 최대값을 반환
MIN     그룹의 최소값을 반환
*/

-- 1. SUM : 합계 그룹함수
SELECT SUM(salary)
FROM employees;
-- 2. AVG : 평균 그룹함수
-- 급여평균 : 소수점 3째자리에서 반올림
SELECT ROUND(AVG(salary),2)
FROM employees;
-- 급여평균 : 정수 출력(반올림)
SELECT ROUND(AVG(salary),0)
FROM employees;

SELECT FLOOR(AVG(salary))
FROM employees;
-- 3.MAX, MIN : 최대값, 최소값 그룹함수
-- 최대급여, 최소급여
SELECT MAX(salary)
FROM employees;
SELECT MIN(salary)
FROM employees;
-- 최근 입사일, 가장 오래된 입사일
SELECT MAX(hire_date)
FROM employees;

SELECT MIN(hire_date)
FROM employees;

-- 4. COUNT(*) : 전체행(=row, record) 갯수를 구하는 그룹함수
-- NULL값으로 된 행, 중복된 행을 비롯하여 선택된 모든행을 가운트한 갯수
-- 사원수
SELECT COUNT(*)
  FROM employees; -- 107

-- COUNT(컬럼명) : 컬럼명으로 식별되는 열에서 NULL이 아닌 행의 갯수
-- NULL에 대한갯수를 세지 않는다...COUNT(*) + WHERE 컬럼명 IS NOT NULL 과 동일
-- "커미션을 받는 사원수"

SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT COUNT(commission_pct)
FROM employees;

-- job_id 갯수 -- 중복 갯수
SELECT COUNT(job_id)
FROM employees;

-- job_id  갯수 -- 중복안된 갯수
SELECT COUNT(DISTINCT job_id)
FROM employees;

-- 매치 불가 ==> 에러
SELECT employee_id  -- 107rjs
     , MAX(salary)   -- 1건
  FROM employees;
  
  
/*
02. 데이터 그룹 : GROUP BY
- 특정 컬럼을 기준으로 그룹별로 나눌때 사용
- 형식
 SELECT 컬럼명1, 컬럼명2, 그룹함수
    FROM 테이블명
  WHERE 조건(연산자)
  GROUP BY 컬럼명1, 컬렴명2
  ORDER BY 컬럼 ASC | DESC;
  
- 어떤 컬럼값을 기준으로 그룸함수를 적용할지 기술할 경우에는
  SELECT문의 GROUP BY 해당컬럼을 기술
  
- GROUP BY절 다음에 컬럼의 별칭은 사용불가
- 그룹함수가 아닌 SELECT 리스트의 모든 일반 컬럼은 GROUP BY 절에 반드시 기술해야 한다.
  그러나 반대로 GROUP BY 절에기술된 컬럼이 반드시 SELECT 리스트에 있어야 하는건 아니다.
  단지 결과가 무의미하다.
  
- 그룹함수는 두번까지 중첩해서 사용가능하다. 예) MAX(AVG(salary))
  중첩그룹함수는 select list에 일반컬럼 사용불가 -> HAVING 조건절과 subquery를 사용
*/
-- 부서별 최대급여(단 부서번호 오름차순 정렬)
SELECT department_id , MAX(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 부서별 최대 평균 급여(단 부서번호 오름차순 정렬)
SELECT department_id, MAX(AVG(salary)) -- 중첩그룹함수는 select list에 일반컬럼 사용불가
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 부서별, 직무별  인원수, 최대급여, 최소급여, 급여합계, 급여평균
-- 부서, 직무는 오름차순 정렬(단 부서는 NULL 허용안함)
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

/*  매우 중요
03. 그룹 결과 제한 : HAVING절
 - 표시할 그룹을 지정하여 집계 정보를 기준으로 그룹 결과를 제한
 - HAVING + 그룹함수 조건절
 CF) WHERE + 일반컬럼 조건절
 
 - 형식
  SELECT 컬럼명1, 컬럼명2, 그룹함수
    FROM 테이블명
  WHERE 조건(연산자)
  GROUP BY 컬럼명1, 컬렴명2
  HAVING 그룹함수 조건절
  ORDER BY 컬럼 ASC | DESC;
*/
-- 부서별 최대급여, 총급여(단 총급여가 15000이상), 부서코드 오름차순 정렬
-- 부서코드가 없으면 스킵

SELECT department_id
     , MAX(salary)
     , SUM(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING SUM(salary) >= 15000
ORDER BY department_id ASC;

-- 직무별 급여평균, 급여총액 구하기, 단 급여평균이 5000이상
-- 소수점 이하는 무조건 절삭, 직무 정렬, IT 부서 스킵

SELECT job_id
     , ROUND(AVG(salary),0)
     , ROUND(SUM(salary),0)
FROM employees
WHERE job_id NOT LIKE '%IT%'
GROUP BY job_id
HAVING AVG(salary) >= 5000
ORDER BY job_id

