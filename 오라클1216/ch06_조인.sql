/* [면접]
Equi Join -- 매우 중요
- 조인 대상 테이블에서 공통 컬럼을 '='(equal) 비교를 통해 같은 값을 가지는행을 연결

1. 정의 : 가장 많이 사용되는 조인방법으로 , 조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치하는 행을 연결하여 검색결과를 생성하는 방법

- FROM 절은 조인 대상 테이블을 기술하고, 테이블은 콤마(,)로 구분한다.
- WHERE 절은 조인을 위한 컬럼명과 '=' 연산자를 사용하여 조인조건을 기술한다.
- 조건에 사용되는 컬럼은 일반적으로 기본키와 외래키에 공통적으로 존재하는 컬럼명을 사용한다.

- 기본키(PK : Primary Key) : 중복되지 않아야 하며, NOT NULL 이어야 한다.
- 외래키(FK : Foreign Key) : 다른 테이블의 기본키를 참조하며, 반드시 NOT NULL은 아니다.
예) 기본키 : 부서테이블, 부서ID    외래키 : 사원테이블.부서ID
   부모테이블 : 부서테이블          자식테이블 : 사원테이블
   
   
2. 중복컬럼(모호한 컬럼)일 경우 컬럼명앞에 테이블명(또는 별칭)을 기술하여
   어느 테이블 소속인지 구분한다.
   
3. 형식 
  SELECT t1.column, t2.column
     FROM table t1, table t2
  WHERE t1.column = t2.column
    AND 조건식;
    
4. JOIN-ON
 테이블명과 테이블명 사이에 콤마(,) 대신 JOIN을 사용하고
 공통으로 존재하는 키를 비교하는 WHERE 대신에 on을 사용한다.
 */


-- 사원테이블, 부서테이블에서 사번이 103번인 사원의 사번, 부서번호, 부서명, manager_id, location_id
SELECT e.employee_id
     , e.department_id
     , d.department_id
     , d.department_name
     , d.manager_id -- 양쪽 모두에 있는 칼럼의 경우 소속을 적어줘야된다.
     , location_id  -- 한쪽 테이블에만 있는 칼럼의 경우 소속을 적지않아도 에러는 안난다.
FROM employees e, departments d
WHERE e.department_id = d.department_id
 AND e.employee_id = 103
ORDER BY e.employee_id ASC;

-- JOIN-ON
SELECT e.employee_id
     , e.department_id
     , d.department_id
     , d.department_name
     , d.manager_id -- 양쪽 모두에 있는 칼럼의 경우 소속을 적어줘야된다.
     , location_id  -- 한쪽 테이블에만 있는 칼럼의 경우 소속을 적지않아도 에러는 안난다.
FROM employees e JOIN departments d
ON e.department_id = d.department_id
 AND e.employee_id = 103
ORDER BY e.employee_id ASC;

--100번인 사원의 jobs 정보 조회  사번 잡스 모든정보
SELECT e.job_id
     , j.job_id
     , j.job_title   
     , j.min_salary
     , j.max_salary
FROM employees e JOIN jobs j
ON j.job_id = e.job_id  --PK가 앞쪽으로 놓이는게 좋다.                   
 AND e.employee_id = 100;
 
-- 부서 ID가 10번일때의 부서ID, 부서명, 로케이션정보
SELECT d.department_id
     , d.department_name
     , d.location_id
     , l.*
FROM locations l JOIN departments d
ON d.location_id = l.location_id
 AND d.department_id = 10;
 
-- IT가 포함된 부서명을 가진 부서의 사번, 이름(Last_name + first_name), 입사일, 부서코드, 부서명 조회

SELECT d.department_id 부서사번
     , e.first_name || e.last_name 이름
     , e.hire_date 입사일
     , d.department_name 부서명
FROM employees e JOIN departments d
ON d.department_id = e.department_id
 AND d.department_name LIKE '%IT%';
 
 SELECT d.department_id 부서사번
     , e.first_name || e.last_name 이름
     , e.hire_date 입사일
     , d.department_name 부서명
FROM employees e , departments d
WHERE d.department_id = e.department_id
 AND d.department_name LIKE '%IT%';
 
SELECT e.employee_id AS 사번
     , e.last_name || ' ' || e.first_name AS 이름
     , e.hire_date AS 입사일
     , d.department_id AS 부서코드
     , d.department_name AS 부서명
  FROM employees e
    , departments d
 WHERE d.department_id = e.department_id
   AND d.department_name LIKE '%IT%';
 

