
/* p188
    서브쿼리
- 하나의 SELECT 문장이 절안에 포함된 또 하나의 SELECT 문장이다.
  서브쿼리는 메인쿼리에 사용할 값을 반환한다.
  즉, 서브쿼리에서 실행된 결과가 메인쿼리에 전달되어 최종적인 결과를 출력한다.
- 메인쿼리 : 서브쿼리를 포함하고 있는 쿼리문
- 서브쿼리 : 포함된 또 하나의 쿼리문으로, 비교연산자의 오른쪽에 기술하고, 반드시 괄호안에 넣어야 한다,
            메인쿼리가 실행되기전에 한번만 실행된다.
- 종류 : 단일행 서브쿼리, 다중행 서브쿼리

단일행 서브쿼리 : 수행결과가 오직 하나의 행만을 반환하는 서브쿼리
      연산자 : >,>=,<,<=,=,<>
다중행 서브쿼리 : 수행결과가 하나 이상의 행을 반환하는 서브쿼리
      연산자 : IN, ANY, SOME, ALL, EXISTS
      

*/

-- 1. 단일행 서브쿼리
-- 'Chen'의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여를 구하시오(급여는 오름차순)

SELECT employee_id
     , last_name
     , salary
FROM employees
WHERE salary > (SELECT salary
                    FROM employees
                    WHERE last_name = 'Chen')
ORDER BY salary ASC;          

-- 'Chen'과 같은 부서에서 일하는 사원의 사번, 이름, 부서번호, 부서명 검색

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
 
                        
                            
                            

                            
