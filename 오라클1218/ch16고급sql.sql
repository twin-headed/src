/* 9일차
16. 고급 SQL
HR계정에서 실행
 1) UNION 연산자(합집합).. 중복행을 제거한 두 Query의 행을 반환
 2) UNION ALL 연산자(합집합).. 중복행을 제거안한 두 Query의 행을 반환 
 3) INTERSECT 연산자(교집합)
 4) MINUS 연산자(차집합)
 -- 1) UNION 연산자(합집합).. 중복행을 제거한 두 Query의 행을 반환
 -- 1) 모든 사원의 현재 및 이전 직무 세부사항을 조회하되, 각 사원정보는 한번만 조회
*/
SELECT employee_id
     , job_id
  FROM employees;  --107건(100~206)
UNION -- 115건
SELECT employee_id
     , job_id
  FROM job_history; --10건(이전 사원정보)
ORDER BY employee_id;

SELECT employee_id
     , job_id
  FROM employees;  --107건(100~206)
UNION ALL-- 117건
SELECT employee_id
     , job_id
  FROM job_history; --10건(이전 사원정보)
ORDER BY employee_id;
  
-- 3) INTERSECT 연산자(교집합)
-- 사원테이블에서 예전 직무와 현재직무가 동일한 사원정보 출력
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

-- INTERSECT 연산자(교집합) 2건
SELECT employee_id
     , job_id
  FROM employee
INTERSECT
SELECT employee_id
     , job_id;
  FROM job_history;
  
--176	SA_REP
--200	AD_ASST

-- 4) MINUS 연산자(차집합) : 전체-교집합(emp 107건 - tkqjs(176, 200) = 105건
SELECT employee_id
     , job_id
  FROM employee
MINUS
SELECT employee_id
     , job_id;
  FROM job_history;
  
/*
    중요
2-1. 뷰를 이용해서 TOP_N 구하기
-- 입사일 빠른 순서로 5명 출력(인라인 뷰)
-- HR 계정에서 실행
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
   
-- 급여가 적은 사람부터 10명 출력(인라인 뷰)
SELECT ROWNUM --각 행에 번호를 넘버링
     , employee_id
     , last_name
     , hire_date
     , salary
  FROM ( SELECT employee_id -- 테이블명 대신에 서브쿼리가 옴 이걸 테이블로 봐라
              , last_name
              , hire_date
              , salary
           FROM employees
          ORDER BY salary ASC) -- 인라인 뷰
 WHERE ROWNUM <= 10 
   AND salary IS NOT NULL;
   
/*      중요
  분석함수
- 테이블에 있는 데이터를 특정용도로 분석하여 결과를 반환하는 함수
- 복잡한 계산을 단순하게 처리해주는 함수
- 쿼리결과 Set을 대상으로 계산을 수행하는 함수
- SELECT절에서 수행됨
  FROM, WHERE, GROUP BY절에서 사용 불가
  ORDER BY 구문에서는 사용가능
  오라클 8.1.6 부터 분석함수 지원

-- 그룹함수 VS 분석함수
 그룹함수는 그룹별 최대, 최소, 합계, 평균, 건수 등을 구할때 사용되며,
 그룹별 1개의 행을 반환한다.
 분석함수는 그룹단위로 값을 계산한다는 점에서 유사하지만,
 그룹마다가 아니라 결과 Set의 각행마다 집계결과를 보여준다.
 즉 분석함수는 그룹별 계산결과를 각행마다 보여준다.
-OVER : 분석함수임을 나타내는 키워드
- PARTITION BY : 계산 대상 그룹을 정한다.


/* 중요
   순위함수
 - RANK 함수는 순위를 부여하는 함수로 동일 순위 처리가 가능하다.
  (중복 순위 다음 순서는 건너뜀 - 1,2,2,4)
 
 - DENSE RANK 함수는 RANK 함수와 같은 역할을 하나, 동일 등수가 순위에 영향을 주지 않는다.
 (중복 순위 다음 순서는 연속 -1,2,2,4)
 
-- ROW NUMBER() 함수는 특정 순위로 일련번호를 제공하는 함수로, 동일 순위 처리가 불가능하다.
 (중복 순위없이 유일값 - 1,2,3,4)
 
- 순위 함수 사용시 반드시 ORDER BY 절은 필수

-NTILE(분류) 함수는 쿼리의 결과를 n개의 그룹으로 분류하는 기능을 제공한다.
_NTILE(분류숫자) 함수는 지정한 분류숫자만큼의 그룹으로 분류한다.

*/
-- 각각의 동일부서의 급여합계 .. HR 계정에서 실행
SELECT department_id
     , employee_id
     , salary
     , SUM(salary) OVER(PARTITION BY department_id) sum_sal
  FROM employees
 ORDER BY department_id;
 
-- 급여가 높은대로 
SELECT department_id
     , employee_id
     , salary
     , RANK() OVER(ORDER BY salary DESC) rank
  FROM employees;
  
--순위함수 비교
SELECT department_id
     , employee_id
     , salary
     , RANK() OVER(ORDER BY salary DESC) rank
     , DENSE_RANK() OVER(ORDER BY salary DESC) d_rank
     , ROW_NUMBER() OVER(ORDER BY salary DESC) r_number
  FROM employees;
  
-- 순위함수 NTILE(분류)
SELECT employee_id
    , NTILE(2) OVER(ORDER BY employee_id) grp2 -- 전체를 2등분하여 1,2로 표현
    , NTILE(3) OVER(ORDER BY employee_id) grp3 -- 전체를 3등분하여 1,2,3로 표현
    , NTILE(5) OVER(ORDER BY employee_id) grp5 -- 전체를 5등분해서 1,2,3,4,5로 표현
  FROM employees;

/* 윈도우 함수
- 분석함수 중에서 윈도우절(WINDOWING)을 사용하는 함수를 윈도우함수라고 한다.
- 윈도우절을 사용하게 되면 PARTITION BY 절에 명시된 그룹을 좀더 세부적으로 그룹핑할 수 있다.
- 윈도우절은 분석함수 중에서 일부(AVG, SUM, MAX, MIN, COUNT)만 사용할 수 있다.
- ROWS : 물리적인 ROW 단위로 행집합을 지정한다.
- RANGE : 논리적인 상대번지로 행집합을 지정한다.
*/

-- ROWS 사용예제
-- 부서별로 이전 ROW의 급여와 현재 ROW의 급여 합계를 출력
-- ROWS 2 PRECEDING -> 현재 + 이전 + 그 이전
SELECT employee_id
     , last_name
     , department_id
     , salary
     , SUM(salary) OVER(PARTITION BY department_id
                   ORDER BY employee_id                
                   ROW 2 PRECEDING)pre_sum
  FROM employees;

/* RANGE 사용예제 - 중요
-- 영업정보 시스템 분석 화면에 전월비교, 전년비교, 분기별 합계, 분기별 평균
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
                 AND INTERVAL '1' MONTH PRECEDING) amt_pre3 -- 이전 3개월(현재달은 미포함)
     , SUM(amt) OVER(ORDER BY TO_DATE(yyyymm, 'yyyymm')
       RANGE BETWEEN INTERVAL '1' MONTH FOLLOWING
                 AND INTERVAL '3' MONTH FOLLOWING) amt_post3 -- 이후 3개월(현재달은 미포함)
  FROM test;      
  
/* 매우 중요 : ROLLUP
-- GROUP BY 구문의 결과에 소계 및 합계 정보를 추가로 나타내는 함수
-- ROLLUP : 단계별 소계
*/
-- ROLLUP 예제
-- 방법1. 부서별 급여 합계와 전체 합계를 조회
SELECT department_id
     , sum(salary)
  FROM employees
  GROUP BY ROLLUP(department_id);

-- ROLLUP 예제2
-- 방법2. 부서별 급여 합계와 전체 합계(총계)를 조회 - UNION ALL
SELECT department_id
     , sum(salary) s_sal
  FROM employees
 GROUP BY department_id     --부서별 합계
UNION ALL
SELECT null "department_id"
     , sum(salary) s_sal
  FROM employees
 ORDER BY department_id;    --최종합계
 
 
 --ROLLUP 예제2
-- 부서별 급여 합계와 전체 합계(총계)를 조회
SELECT department_id
     , employee_id
     , sum(salary) s_sal
  FROM employees
 WHERE department_id IS NOT NULL
  GROUP BY ROLLUP(department_id, employee_id);
  
-- ROLLUP 예제3. 중요
-- 부서명, job_id별 급여와 직원수 합계
-- 부서명, job_id별 소계, 급여합계, 직원수 합계

SELECT d.department_name
     , e.job_id
     , sum(e.salary)
     , COUNT(e.employee_id)
  FROM employees e, departments d
 WHERE d.department_id = e.department_id
   AND d.department_name IS NOT NULL
    GROUP BY ROLLUP(d.department_name, e.job_id);
    
