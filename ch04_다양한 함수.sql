/*
    ch04. 다양한 함수
    01. 문자 처리 함수(대소문자 변환함수)
    
    1.LOWER : 소문자로 변환
    2.UPPER : 대문자로 변환
    3.INITCAT : 첫글자만 대문자로, 나머지 글자는 소문자로 변환
*/


--사원테이블의 last_name이 King일 경우 조회

SELECT last_name
FROM employees
WHERE INITCAP(last_name) = 'King';

--사원테이블의 이메일이 'TFOX'일 경우 email조회
SELECT email
FROM employees
WHERE LOWER(email) = 'tfox';

/*
    p105
    01.문자 처리 함수(문자 조작 함수)
    구분      설명
    CONCAT - 문자의 값을 연결한다.('||'와 동일)
    SUBSTR - 문자를 잘라서 추출한다.
    INSTR - 특정 문자의 위치값을 반환한다.
    LPAD, RPAD - 입력받은 문자열과 기호를 정렬해서 특정 길이의 문자열로 반환한다.
    TRIM - 잘라내고 남은 문자를 표시한다.
*/

--1. CONCAT - 문자의 값을 연결한다.('||'와 동일)
-- '03/06/17'에 입사한 사원의 사번, 입사일(03/06/17 -> 2003/06/17) , 이름(first_name + ' ' + last_name) 별칭부여

SELECT CONCAT('20', hire_date) "입사일"
      ,first_name || ' ' || last_name "이름"
      ,employee_id "사번"
FROM employees
WHERE hire_date = '03/06/17';

/*
2. SUBSTR - 문자를 잘라 추출
    형식 : SUBSTR(대상,시작위치,추출할갯수)
    -시작 위치가 양수인 경우 앞쪽 1부터 시작하고, 음수인 경우 뒤쪽부터 시작한다.
*/
-- welcome to oracle -- come 출력 : 앞에서부터, 뒤에서부터 출력
SELECT SUBSTR('welcome to oracle',4,4)
FROM DUAL;

-- 입사년도가 04년이거나 06년도인 사원의 사번, 입사일(----년 --월 --일) 조회, 입사일 순서로 정렬

SELECT employee_id "사번"
      ,'20' || SUBSTR(hire_date,1,2) || '년' || SUBSTR(hire_date,4,2) || '월' || SUBSTR(hire_date,7,2) || '일' "입사일"
FROM employees
WHERE SUBSTR(hire_date,1,2) = '04' OR SUBSTR(hire_date,1,2) = '06' -- SUBSTR(hire_date,1,2) IN('04','06')
ORDER BY hire_date;

/*
3. INSTR - 문자열 내에 해당 문자가 어느 위치에 존재하는지 알려줌
- 형식 : INSTR(대상, 찾을 글자, 시작위치, 몇번째 발견)
        시작 위치와 몇번째 발견이 생략시 모두 1로 간주
*/

-- 'Oracle mania'에서 a가 1부터 시작, 1번쨰 발견된 위치
-- 'Oracle mania'에서 a가 5부터 시작, 2번째 발견된 위치

SELECT INSTR('oracle mania','a')
FROM DUAL;

/*
110p
4. 문법 LAPD(컬럼명, 자릿수, '특정 기호')
RPAD
-대상 문자열을 명시된 자릿수에서 왼쪽에 나타내고, 남은 오른쪽 자리를 특정 기호로 채워라
LPAD
-대상 문자열을 명시된 자릿수에서 오른쪽에 나타내고, 남은 왼쪽 자리를 특정 기호로 채움
*/

/*
5.TRIM : 불필요한 공백제거
- 칼럼이나 대상문자열에서 특정 문자가 첫번째 글자이거나 마지막 글자이면 잘라내고 남은 문자열만 반환

*/
SELECT ' Oracle mania '
     , LTRIM(' Oracle mania ')
     , RTRIM(' Oracle mania ')
   FROM dual;
   
SELECT ' Oracle mania '
     , TRIM('O' FROM 'Oracle mania')
FROM dual;

/*
02. 숫자함수
 ROUND : 특정 자릿수에서 반올림한다.
 TRUNC : 특정자릿수에서 잘라낸다.(버림)
 MOD : 입력받은 수를 나눈 나머지 값을 반환한다.
 */
 --1. ROUND : 특정 자릿수에서 반올림한다.
 --두번째 인자값이 0이면 소수점이하 1번째 자리를 반올림하고, -1이면 일의 자리에서 반올림하고, 일의자리는 0으로 채운다.
 SELECT ROUND(98.7654,2)
      , ROUND(98.7654,1)
      , ROUND(98.7654,0)
      , ROUND(98.7654,-1)
      , ROUND(94.7654,-1)
  FROM dual;
--98.77 98.8    99  100 90

--2,TRUNC : 특정자릿수에서 잘라낸다.(버림)
-- 두번째 인자값이 0이면 소수점이하에서 버리고, -1이면 일의 자리에서 버리고, 일의 자리는 0으로 채운다.
SELECT TRUNC(98.7654,2)
     , TRUNC(98.7654,1)
     , ㅇTRUNC(98.7654,0)
     , TRUNC(98.7654,-1)
     , TRUNC(94.7654,-1)
  FROM dual;
--98.76   98.7   98  90     90

--3.MOD : 입력받은 수를 나눈 나머지 값을 반환한다.
SELECT MOD(27,2) --1
     , MOD(27,5) --2
  FROM dual;
  
-- 4. ABS : 절대값을 반환하는 함수
SELECT -10   -- -10
    , ABS(-10)  -- 10
  FROM dual;

-- 5. FLOOR 함수 : 소수점 이하를 버리는 함수
SELECT 34.56789        -- 34.56789
     , FLOOR(34.56789)      -- 34
  FROM dual;
  
/* 03. 날짜함수 - 매우중요

p117 표
 구분                             설명
SYSDATE             시스템에 저장된 현재 날짜를 반복한다.
MONTHS_BETWEEN      두 날짜 사이가 몇 개월인지를 반환한다.
ADD_MONTHS          특정 날짜에 개월수를 더한다.
NEXT_DAY            특정 날짜에서 최초로 도래하는 인자로 받은 요일의 날짜를 반환한다.
LAST_DAY            해당 달의 마지막 날짜를 반환한다.
ROUND               인자로 받은 날짜를 특정 기준으로 반올림한다.
TRUNC               인자로 받은 날짜를 특정 기준으로 버린다.
*/

SELECT sysdate 오늘
    , sysdate -1 어제
    , sysdate +1 내일
    , sysdate +2 모레
 FROM dual;
 
 /*
 1. ROUND               인자로 받은 날짜를 특정 기준으로 반올림한다.
  형식 : ROUND(date, format)
  format이 'MONTH'인 경우, 일을 기준으로 16보다 작으면 이번달 1일, 16이상이면 다음달 1일
 */
 
 SELECT employee_id
      , hire_date 입사일
      , ROUND(hire_date, 'MONTH') R_입사일
      , sysdate - hire_date   근무일수
      , ROUND(sysdate - hire_date) R_근무일수
    FROM employees
   ORDER BY hire_date;
    
/*
TRUNK : 인자로 받은 날짜를 특정 기준으로 버린다.
- 형식 : TRUNC(date,format)
- format이 'MONTH'인 경우, 달을 기준으로 자른다. 이번달 1일 
*/

 SELECT employee_id
      , hire_date 입사일
      , TRUNC(hire_date, 'MONTH') T_입사일
      , sysdate - hire_date   근무일수
      , TRUNC(sysdate - hire_date) T_근무일수
    FROM employees
   ORDER BY hire_date;
   
/*
3. MONTHS_BETWEEN
-형식 : MONTHS_BETWEEN(date1, date2)
-두 날짜사이가 몇 개월인지를 반환한다.
*/
-- 사번, 입사일, 근무개월수, R_근무개월수, T_근무개월수

SELECT employee_id 사번
     , hire_date 입사일
     , MONTHS_BETWEEN(sysdate, hire_date) 근무개월수
     , ROUND(sysdate - hire_date) R_근무개월수
     , TRUNC(sysdate - hire_date) T_근무개월수
FROM employees;

/*
4.ADD_MONTHS
-특정 개월수를 더한 날짜를 구하는 함수
= 형식 : ADD_MONTHS(date, number)
*/
-- 사번, 입사일, 입사 3개월
SELECT employee_id 사번
    , hire_date 입사일
    , ADD_MONTHS(hire_date,3) "입사 3개월"
FROM employees;

-- 개강6개월 차의 날짜 구하기
SELECT ADD_MONTHS('20/11/09',6)
FROM dual;

/*
5. NEXT_DAY
-NEXT_DAY 함수는 해당 날짜를 기준으로 최초로 도래하는 요일에 해당하는 날짜를 반환하는 함수이다.
- 형식 NEXT_DAY(date, 요일)
- 요일 대신 숫자가 올 수 있다. 1.일요일 2. 월요일 .... 7.토요일
*/
SELECT sysdate
     , NEXT_DAY(sysdate,'일요일')
     , NEXT_DAY(sysdate,'월요일')
     , NEXT_DAY(sysdate,'금요일')
     , NEXT_DAY(sysdate,'토요일')
     , NEXT_DAY(sysdate,5)
  FROM dual;
  
/*
6. LAST_DAY
- LAST_DAY 함수는 해당 날짜가 속한 달의 마지막 날짜를 변환하는 함수이다.
- 형식 : LAST_DAY(date)
*/
-- 사번, 입사일, "입사한 달의 마지막 날"
SELECT employee_id 사번
     , hire_date 입사일
     , LAST_DAY(hire_date) "입사한 달의 마지막 날"
FROM employees

/*p 124 매우 중요
04. 형변환 함수
- 오라클에서 데이터형으로 변환해야 하는 경우 TO_NUMBER, TO_CHAR, TO_DATE를 사용
구분                      설명
TO_CHAR                 날짜형 혹은 숫자형을 문자형으로 변환한다.
TO_DATE                 문자형을 날짜형으로 변환한다.
TO_NUMBER               문자형을 숫자형으로 변환한다.
*/

1.TO_CHAR
-날짜형 혹은 숫자형을 문자형으로 변환한다.
-형식 : TO_CHAR(날짜데이터, '출력형식')
-날짜 출력 형식
 종류     의미
 YYYY   년도표현(4자리)
 YY     년도표현(2자리)
 MM     월을 숫자로 표현
 MON    월을 알파벳으로 표현
 DAY    요일 표현
 DY     요일을 약어로 표현
 */
 --1. TO_CHAR(날짜형 | 숫자형) -> 문자형으로 변환한다.
 --형식 : TO_CHAR(날짜데이터, '출력형식')
 SELECT sysdate -- 20/12/09
     , TO_CHAR(sysdate,'YY-MM-DD')
     , TO_CHAR(sysdate,'YY-MM-DD DAY')  -- 20-12-09 수요일
     , TO_CHAR(sysdate,'YY-MM-DD (DAY)')  -- 20-12-09 (수요일)
     , TO_CHAR(sysdate,'YY-MM-DD DY') --  20-12-09 수
     , TO_CHAR(sysdate,'YY-MM-DD(DY)') --  20-12-09(수)
 FROM dual;
 
-- 시간 표현
-- 오전 -> AM | 오후 -> PM
-- 12시간인 경우 -> HH:MI:SS     | 24시간 -> HH24:MI:SS
-- 20-12-09(수) 12시간 | 24시간
SELECT TO_CHAR(sysdate,'YY-MM-DD(DY) HH-MI-SS(DY)')
     , TO_CHAR(sysdate,'YY-MM-DD(DY) HH24:MI:SS(DY)')
FROM dual;

/*
2.TO_CHAR : 숫자 -> 문자형으로 변환
-- 형식 : TO_CHAR(숫자, '출력형식')
- L : 각 지역별 통화기호를 앞에 표시 예)한국: ￦       --ㄹ+한자키
- , : 천단위 자리 구분을 표시
- . : 소수점을 표시
- 9 : 자리수를 나타내며, 자리수가 맞지 않아도 0으로 채우지 않는다.
- 0 : 자리수를 나타내며, 자리수가 맞지 않을 경우 0으로 채운다.
*/

-- 사번, 급여, ￦500,000 ￦0,009,000
SELECT TO_CHAR(salary,'L9,999,999')
    ,TO_CHAR(salary,'L0,009,999')
FROM employees;

/*
3.TO_DATE
- 문자열을 날짜형으로 변환한다.
- 형식 : TO_DATE('문자','날짜format')
*/
-- 입사일이 03/06/17 사원의 사번, 입사일(03/06/17) 조회
SELECT employee_id 사번
     , hire_date
     , TO_CHAR(hire_date,'YYYY-MM-DD(DY)')
FROM employees
WHERE hire_date = TO_DATE('20030617','YYYY-MM-DD');

--수강일수 11/9부터 현재까지 일수

SELECT ROUND(sysdate - TO_DATE('20201109','YYYY-MM-DD'))
FROM dual;

/*
4.TO_NUMBER
- 문자열을 숫자형으로 변환한다.
*/
SELECT '100,000' - '50,000'
  FROM dual; -- 오류 : 문자열은 산술불가
  
SELECT TO_NUMBER('100,000','9,999,999') - TO_NUMBER('50,000','9,999,999')
    FROM dual;      -- 정상 : 문자열을 숫자로 변환헀으므로 산술 가능

/* p130
05. 일반함수
1 NVL 함수
2 NVL2 함수
3 NULLIF 함수
4 COALESCE 함수
*/

/*
2.NVL2 함수
-형식 : NVL2(expr1, expr2, expr3)
-expr1을 검사하여 그 결과가 null이면 expr3을 반환하고 , null이 아니면 expr2를 반환
*/
-- 사원테이블에서 사번, 이름, commission_pct, salary, 연봉 조회
-- 연봉 : commission_pct가 null 이면 salary*12반환 null이 아니면 salary*(12+commission_pct)를 반환
SELECT employee_id 사번
     , last_name 이름
     , commission_pct
     , salary
     , NVL2(commission_pct,salary*(12+commission_pct),salary*12)
FROM employees;


/*
3. NULLIF 함수
-- 형식 : NULLIF(expr1, expr2)
-- 두 표현식을 비교하여 동일한 경우에는 NULL을 반환하고, 동일하지 않으면 첫번째 표현식을 반환
*/
--131p 132p 참조

/*
4. COALESCE
-- 형식 : COALESCE(expr-1, expr-2, .. expr-n)
-- expr-1이 null이 아니면 expr-1을 반환
-- expr-1이 null이고 expr-2가 null이 아니면 expr-2를 반환
-- expr-n이 null이 아니면 expr-n을 반환 
*/
SELECT employee_id
     , last_name
     , salary
     , commission_pct
     , COALESCE(commission_pct, salary, 0) --둘다 null이면 0을 반환
   FROM employees;



