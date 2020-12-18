/*9일차
ch 15. 프로시저 함수 트리거
1. 프로시저 - 매우 중요
- 프로시저 : PL/SQL은 프로그램 로직을 프로시저로 구현하여 객체 형태로 사용한다.
            프로시저는 일반 프로그래밍 언어에서 사용하는 함수와 비슷한 개념으로 
            작업순서가 정해진 독립된 프로그램의 수행단위를 말한다.
            프로시저는 정의된 다음, 오라클(DBMS)에 저장되므로 저장프로시저(STORED PROCEDURE)라고도 한다.
- 오라클에서 함수는 반드시 RETURN문을 사용하여 결과를 반환하지만, 프로시저는 결과를 반환할수도, 반환하지 않을 수도 있다.
- CallableStatement : DB에 생성된 저장프로시저를 execute()로 호출해서 사용가능.. jsp, spring등 자바에서 호출가능

[형식]
CREATE [OR REPLACE] PROCEDURE 프로시저명(매개변수 data_type,...)
IS
    로컬변수;   -- 변수선언
BEGIN
    statement1;
    statement2;
END;

실행 : EXECUTE 프로시저명;
삭제 : DROP PROCEDURE 프로시저명;

- [MODE]]는 IN,OUT,INOUT 세가지를 기술할 수 있다.
IN : 프로시저로 데이터를 전달받을때 사용
OUT : 프로시저에서 수행된 결과값을 전달받을때 사용
INOUT : 두가지 목적에 모두 사용
*/
-- last_name = 'Nayer'의 급여 출력
-- 

SET serveroutput ON
CREATE OR REPLACE PROCEDURE emp_salary_ename
IS
    v_salary employees.salary%type;
BEGIN
    SELECT salary INTO v_salary
     FROM employee
    WHERE last_name = 'Nayer';
    dbms_output.put_line('Nayer의 급여는 ' || v_salary);
END;
/

EXECUTE emp_salary_ename;

/*
02.함수
함수는 결과값을 되돌려주기 위한 용도로 사용된다.
[형식]
CREATE [OR REPLACE] FUNCTION function_name(
    매개변수1 [mode] 데이터타입,
    매개변수2 [mode] 데이터타입,...
)
    RETURN 데이터타입
IS
BEGIN
    statement1;
    statement2;
    RETURN 변수명
END;
/

함수는 결과를 되돌려받기 위해서 함수가 되돌려받을 자료형과 값을 기술해야 한다.
EXECUTE :variable_name := function_name(매개변수_list)
/*
-- HR 계정에서 실행
--'Chen'의 급여를 함수를 이용해 출력
fn_salary_last_name
*/

/*
03 트리거
- 트리거 사전적인 의미 : 총의 방아쇠, 연쇄반응, 인련의 사건등을 유발하는 계기, 유인, 자극
- 오라클의 트리거는 어떤 이벤트가 발생했을때 내부적으로 실행되도록 하기 위한 데이터베이스에 저장된 프로시저를 말한다.
[형식]
CREATE TRIGGER trigger_name
timing [BEFORE|AFTER] event[INSERT|UPDATE|DELETE]
ON table_name
[FOR EACH ROW]
[WHEN condition]
BEGIN
    statement;  -- 트리거 문장
END;


-- <트리거의 타이밍>
-- [BEFORE] 타이밍은 어떤 테이블에 INSERT, UPDATE, DELETE 문이 실행될 때(EVENT)
-- 해당 문장이 실행되기 전에 트리거가 가지고 있는 BEGIN-END 사이의 문장(트리거문장)을 실행한다.
-- [AFTER] 타이밍은 어떤 테이블에 INSERT, UPDATE, DELETE 문이 실행될 때(EVENT)
-- 해당 문장이 실행되고 난 후에 트리거가 가지고 있는 BEGIN-END 사이의 문장(트리거문장)을 실행한다.

--<트리거의 이벤트>
-- 사용자가 어떤 DML(INSERT, UPDATE, DELETE) 문을 실행했을 때
-- 트리거를 발생시킬 것인지를 결정한다.
-- 트리거의 몸체
   해당 타이밍에 해당 이벤트가 발생하게 되면 실행될 기본 로직이 포함되는 부분으로
   BEGIN-END에 기술한다.
*/

--SCOTT 계정에서 생성

--1. 사용자가 사용할 테이블(dept_original)생성
-- 구조만 복사
CREATE TABLE dept_original
AS
SELECT * FROM dept
WHERE 0=1;

--2. 트리거에 의해서 사용할 테이블(dept_copy)생성
-- 구조만 복사
CREATE TABLE dept_copy
AS
SELECT * FROM dept
WHERE 0=1;

-- 3. INSERT 트리거 생성
-- 삽입 트리거 : 이벤트 실행 -> dept_original INSERT 실행 -> 트리거문장 실행 -> 트리거 결과 dept_copy 테이블 삽입됨을 확인
-- :new는 새롭게 추가된 값을 가지고 있는 임시테이블이며, insert가 수행된 후 데이터가 저장되어 있는 테이블
--실행순서 1)CREATE~ /까지 컴파일
--로직 작동순서 : AFTER INSERT -> 이벤트 -> 트리거문장

CREATE OR REPLACE TRIGGER trigger_dept_copy_insert
    AFTER INSERT  -- 실행순서 1
        ON dept_original
     FOR EACH ROW --행별로
BEGIN
    INSERT INTO dept_copy -- 실행순서 2
    VALUES(:new.deptno, :new.deptname, :new.loc);
END;


--4. 이벤트 : dept_original 테이블에 데이터 추가하기
-- 실행순서 1
INSERT INTO dept_original
    vALUES(10,'ACCOUNT','NEW YORK');
INSERT INTO dept_original
    vALUES(20,'IT','한국');
INSERT INTO dept_original
    vALUES(30,'인사','프랑스');
COMMIT;

--5. 확인 : dept_copy 테이블에 데이터가 추가되었는지 확인
SELECT * FROM dept_original;
SELECT * FROM dept_copy;

----------------------------------------------------------------------------

-- 3. DELETE 트리거 생성
-- 삭제 트리거 : 이벤트 실행 -> dept_original DELETE 실행 -> 트리거문장 실행 -> 트리거 결과 dept_copy 테이블의 데이터가 삭제됨을 확인
-- :old는 기존의 값을 가지고 있는 임시테이블이며, delete가 수행되기 전에 데이터가 저장되어 있는 테이블

--4. 이벤트 : dept_original 테이블에 데이터 삭제하기
CREATE OR REPLACE TRIGGER trigger_dept_copy_delete
    AFTER DELETE
        ON dept_original
    FOR EACH ROW
BEGIN
    DELETE dept_copy
    WHERE dept_copy.dno = :old.deptno;
END;
/

DELETE dept_original
WHERE deptno = 30;
    




