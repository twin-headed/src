/* p175
SELF JOIN : 중요
- 하나의 테이블에 있는 컬럼끼리 연결해야 하는 조인이 필요한 경우 사용
- 자기자신과 조인을 맺는것
- 같은 테이블이 하나 더 존재하는 것처럼 생각할 수 있도록, 테이블 별칭을 사용한다.
- 사원테이블에서는 manager_id 컬럼이 존재하는데, 이 컬럼은 각 사원의 담당매니저 사번이다.
- 사원테이블 : employees e 매니저테이블 : employees m 
- 같은 테이블이지만 매니저도 사원이므로 e.manager_id = m.employee_id 처럼 비교할 수 있다.
*/

-- SELF JOIN
--156번 사원의 사번, last_name, 매니저_id, 매니저 last_name
SELECT e.employee_id  "사번"
     , e.last_name    "사번명"
     , e.manager_id   "매니저 ID"
     , m.last_name    "매니저명"
  FROM employees e -- 사원T
    , employees m -- 매니저T
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
 
-- 10~110부서의 부서명을 조회(120~270번 부서의 부서명 조회안됨)
-- 부서정보 출력, 사원테이블 부서코드가 null일지라도 부서테이블의 부서정보를 출력,

SELECT DISTINCT e.department_id
        , d.department_name
FROM employees e
    , departments d
WHERE e.department_id(+) = d.department_id --(+)힘내라 라이터아우터 조인과 같지
ORDER BY department_id;

SELECT DISTINCT e.department_id
        , d.department_name
FROM employees e
    RIGHT JOIN departments d
ON e.department_id = d.department_id --(+)힘내라  RIGHT OUTER JOIN - 기준은 오른쪽(PK)이고, null(FK)쪽에 (+)추가 기준의 의미는 데이터가 많은 쪽
ORDER BY department_id;

/*
 OUTER JOIN
 EQUI JOIN에서 양측 컬럼값 중 하나가 NULL이지만 조인 결과로 출력할 필요가 있는 경우에 OUTER JOIN을 사용
 - 두개 이상의 테이블이 조인될 때 어느한쪽의 테이블(부서)에는 해당 데이터가 존재하는데,
 다른 테이블(사원)에는 데이터가 존재ㅑ하지 않는 경우, 부서 데이터가 출력되지 않는 문제를 해결하기 위한 조인이다,
 NULL값을 가진 행은 조인결과로 얻어지지않는다.
 NULL에 대해서 어떤 연산을 적용하더라도 연산결과는 NULL이기 때문이다.
 따라서 OUTER JOIN을 이용하면 NULL이기에 배제된 행을 결과에 포함할 수 있으며,
 (+)기호를 조인조건에서 정보가 부족한 테이블의 컬럼이름뒤에 붙인다.
 
 RIGHT, LEFT, FULL 3가지가 있다.
 -RIGHT OUTER JOIN : 테이블 기준은 오른쪽 기준이며, 왼쪽 테이블에 조인시킬 컬럼의 값이 없는 경우에 사용
                    반드시 기준이 되는 쪽은, 데이터가 모두 출력되어야 한다.
    => 왼쪽 테이블 컬럼뒤에(+)를 추가한 것과 동일(FROM 절의 왼쪽 테이블이 NULL 이더라도 출력되어야 한다.)

 -LEFT OUTER JOIN : 테이블 기준은 왼쪽 기준이며, 오른쪽 테이블에 조인시킬 컬럼의 값이 없는 경우에 사용
                    반드시 기준이 되는 쪽은, 데이터가 모두 출력되어야 한다.
    => 오른쪽 테이블 컬럼뒤에(+)를 추가한 것과 동일(FROM 절의 오른쪽 테이블이 NULL 이더라도 출력되어야 한다.)
    
   -FULL OUTER JOIN : 양쪽 테이블 모두 OUTER JOIN 걸어야 하는 경우 사용한다.
   => 양쪽 테이블 컬럼뒤에 (+)를 추가
    
 
 */
 
 
-- OUTER JOIN, SELF JOIN을 이용하여 매니저가 없는 사원을 포함하여,
-- 사번, 사원명, 매니저ID, 매니저명 출력(사번 오름차순)

SELECT e.employee_id
     , e.last_name
     , m.employee_id
     , m.last_name
FROM employees e 
    RIGHT JOIN employees m
ON e.manager_id = m.employee_id ;

-- SELF JOIN을 이용하여 매니저보다 먼저 입사한 사원의 
-- 사번, 사원명, 사원입사일, 매니저ID, 매니저명 출력(사번 오름차순)

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
