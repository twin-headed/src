/* [3일차] p134
5. DECODE : 자바의 switch case문과 동일
- 조건에 따라 다양한 선택이 가능
- 형식 : DECODE(표현식, 조건1, 결과1,
                        조건2, 결과2,
                        조건3, 결과3,
                        조건4, 결과4,
                        기본결과n);
*/


/*
    사원테이블의 부서ID가 10~50인 경우 부서ID와 부서명 출력
    그 외는 '부서미정' 으로 출력
    부서 ID로 정렬한다.
    단 부서ID는 중복되지 않아야 하며, 부서ID가 NULL이면 출력되지 않아야 한다.
*/

SELECT DISTINCT department_id
    , DECODE(department_id, 10, 'Administration',
                             20, 'Marketing',
                             30, 'Purchasing',
                             40, 'Human_Resource',
                             50, 'Shipping',
                             '부서미정') AS 부서명                 
FROM employees
WHERE department_id IS NOT NULL
ORDER BY department_id;

/* p135
5.6 CASE함수 : 자바의 if else와 유사한 구조를 가진다.
- 형식
CASE 표현식
    WHEN 조건1 THEN 결과1
    WHEN 조건2 THEN 결과2
    WHEN 조건3 THEN 결과3
    WHEN 조건4 THEN 결과4
    ELSE 결과n
 END;
 
 표현식이 안에 들어간 케이스
 CASE 
    WHEN 표현식 = 조건1 THEN 결과1
    WHEN 표현식 = 조건2 THEN 결과2
    WHEN 표현식 = 조건3 THEN 결과3
    WHEN 표현식 = 조건4 THEN 결과4
    ELSE 결과n
 END;

*/

/*
    사원테이블의 부서ID가 10~50인 경우 부서ID와 부서명 출력
    그 외는 '부서미정' 으로 출력
    부서 ID로 정렬한다.
    단 부서ID는 중복되지 않아야 하며, 부서ID가 NULL이면 출력되지 않아야 한다.
*/

SELECT DISTINCT department_id,
    CASE department_id
        WHEN 10 THEN 'Administration'
        WHEN 20 THEN 'Marketing'
        WHEN 30 THEN 'Purchasing'
        WHEN 40 THEN 'Human_Resource'
        WHEN 50 THEN 'Shipping'
        ELSE '부서미정'
    END
FROM employees
WHERE department_id IS NOT NULL
ORDER BY department_id;