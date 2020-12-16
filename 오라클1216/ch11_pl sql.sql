/*  p336
01. PL/SQL
-PL/SQL(Oracle's Procdeural Language extension to SQL)
=> SQL문을 사용한 오라클의 절차적 프로그래밍 언어 
SQL에서는 사용할 수 없는 절차적 프로그래밍 기능으로 SQL의 단점을 보완
PL/SQL 블록구조 : 선언부, 실행부, 예외처리부  
*/
-- 오라클에서 화면을 출력 : 패키지명.put_line 프로시저를 이용
-- 환경변수 serveroutput을 화면출력을 위해 ON으로 변경
-- 쿼리문을 수행하기 위해서 '/'가 입력되어야 하며, PL/SQL 블록은 '/'가 있으면 종결된 것으로 간주한다.
set serveroutput on
BEGIN
    dbms_output.put_line('Welcome to plsql');
END;
/
--(실행) set부터 /까지 블록설정 후 실행
-- Welcome to plsql
-- PL/SQL 프로시저가 성공적으로 완료되었습니다.

/*
03. 변수선언(DECLARE)
1) 스칼라
-숫자, 문자, 날짜, BOOLEAN 4가지

2) 레퍼런스
- %TYPE은 변수의 데이터타입을 기존컬럼에 맞추어 선언
변수명 TABLE명.COLUMN명%TYPE -- 컬럼단위로 데이터 타입을 참조


- %ROWTYPE은 로우(행)전체에 대한 데이터 타입을 참조
테이블명 테이블명%rowtype;  --테이블의 컬럼순서,데이터타입, 크기까지 동일하게 사용
*/

--사원번호 사원이름 급여 직무 출력하기..last_name='Nayer' (HR계정)
--v_sabun
--v_name
--v_salary
--v_job_id

set serveroutput on
declare
    v_sabun     employees.employee_id%type;
    v_name      employees.last_name%type;
    v_salary    employees.salary%type;
    v_job_id    employees.job_id%type;
BEGIN
    SELECT employee_id,last_name,salary,job_id into v_sabun,v_name,v_salary,v_job_id
    FROM employees
    WHERE last_name = 'Nayer';
    dbms_output.put_line(v_sabun ||'  '|| v_name ||'  '|| 
                         v_salary ||'  '|| v_job_id);
END;
/


-- 사원번호 사원이름 연봉 부서코드 부서명 출력하기 .. last_name = 'Nayer'
-- 부서코드 : 부서명 ==> 10: ACCOUNTING 20: RESERACH 30: SALES 40: OPERATIONS 50 : IT
set serveroutput on
declare
    v_employees employees%rowtype;
    v_department_name varchar2(30):= null;
    annsal number(7,2);
    
BEGIN
    SELECT * INTO v_employees
    FROM employees
    WHERE last_name = 'Nayer';
    
    if(v_employees.commission_pct is null) then
        v_employees.commission_pct := 0;
    end if;
    
    annsal := v_employees.salary*12 + v_employees.commission_pct;
    
    if(v_employees.department_id = 10) then
        v_department_name := 'ACCOUNTING';
        elsif(v_employees.department_id = 20) then
        v_department_name := 'RESEARCH';
        elsif(v_employees.department_id = 30) then
        v_department_name := 'SALES';
        elsif(v_employees.department_id = 40) then
        v_department_name := 'OPERATIONS';
        elsif(v_employees.department_id = 50) then
        v_department_name := 'IT';
    end if;
/*
    3.2 LOOP문
*/
-- 2단출력
 SET serveroutput on
 DECLARE
    dan number :=2;
    i number :=1;
 BEGIN
    LOOP
        dbms_output.put_line(
           dan || ' * ' || i || '=' || (dan*i));
        i := i+1;
        IF i>9 THEN
            EXIT;
        END IF;
    END LOOP;
 END;
 /

/*
    p351
   04. 커서
   SELECT문의 수행결과가 여러개의 로우로 구해지는 경우 로우에 대한 처리를 하려면 커서를 사용한다.
   커서는 쿼리문에 의해서 반환되는 결과값들을 저장하는 메모리 공간
   CURSOR 선언 -> OPEN -> FETCH -> CLOSE
   FETCH문은 결과셋(커서)에서 로우 단위로 데이터를 읽어들인다.
   FETCH 후에 CURSOR는 결과셋에서 다음행으로 이동한다.
   FETCH 문장은 현재 행에 대한 정보를 읽어와서
   INTO 뒤에 기술한 변수에 저장한 후 출력하고, 다음 행으로 이동한다.
   얻어진 여러개의 로우에 대한 결과값을 모두 처리하려면 반복문에 FETCH문을 사용한다.
   
   [형식]
   DECLARE
    CURSOR 커서명
    IS
    SELECT 문장;  -- INTO 절을 포함시키지 않아야 한다.
   BEGIN
    OPEN 커서명;
    LOOP
        FETCH 커서명
        INTO 변수명;
    END LOOP;
    CLOSE 커서명;
 END;
 /
*/

--커서로부터 부서테이블의 모든 내용을 조회하기(HR)

SET serveroutput on
 DECLARE
    v_dept  departments%rowtype;
    --1. 커서 선언
    CURSOR C1
    IS
    SELECT * FROM departments;
BEGIN
    --2. OPEN
    OPEN C1;
    LOOP
    --3. FETCH
        FETCH C1 INTO v_dept.department_id, v_dept.department_name, v_dept.manager_id, v_dept.location_id;
        EXIT WHEN C1%NOTFOUND;
        dbms_output.put_line(v_dept.department_id
                         || ' ' || v_dept.department_name
                         || ' ' || v_dept.manager_id
                         || ' ' || v_dept.location_id);
    END LOOP;
    --4. CLOSE
    CLOSE C1;
END;
/

--CURSOR FOR LOOP C2로 만들어보기

SET serveroutput on
 DECLARE
    v_dept departments%rowtype;
    CURSOR C2
    IS
    SELECT * FROM departments;
 BEGIN
    dbms_output.put_line('부서번호  부서명     지역명');
    dbms_output.put_line('------------------------');
    FOR v_dept IN C2 LOOP
        EXIT WHEN C2%NOTFOUND;
        dbms_output.put_line(v_dept.department_id || '  ' || v_dept.department_name || '  ' || v_dept.location_id);
    end loop;
  end;
  /

