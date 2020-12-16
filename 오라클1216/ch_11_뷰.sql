/* p270
    11장. 뷰
1. 뷰의 개념과 사용하기
뷰(View)는 한마디로 물리적인 테이블을 근거한 논리적인 가상테이블
디스크 저장 공간이 할당되지 않는다.
즉, 실질적으로 데이터를 저장하지 않고, 데이터 사전에, 뷰를 정의할 때 기술한 쿼리문만 저장되어 있다.
하지만 사용방법은 테이블에서 파생된 객체 테이블과 유사하기 때문에 가상테이블이라 한다.
뷰의 정의는 USER_VIEWS 데이터 사전을 통해 조회가 가능하다.

2. 동작원리
뷰는 데이터를 저장하고 있지 않은 가상테이블이므로 실체가 없다.
뷰가 테이블처럼 사용될 수 있는 이유는, 뷰를 정의할 때 CREATE VIEW 명령어 다음의
AS 절에 기술한 쿼리문장 자체를 저장하고 있다가 이를 실행하기 때문이다.

SELECT문의 FROM 절에서 v_emp로 기술하여 정의하면, 오라클 서버는 USER_VIEWS에서 v_emp를 찾는다.
기술했던 서브 쿼리문장이 저장된 text값을 view 즉 v_emp 위치로 가져와서 실행한다. 275p 그림 참조

3.뷰를 사용하는 이유
보안과 사용의 편의성 때문
권한별로 접근이 제한되어서 동일한 테이블에 접근하는 사람마다 다른 뷰에 접근하도록 할 수 있다.

*/
-- view 생성권한 추가, SYSTEM 계정에서 실행
grant create view to scott;

-- SCOTT 계정에서 실행
CREATE OR REPLACE VIEW v_emp_dept   --view이름은 user_views 데이터 사전의 view_name에 저장
AS
-- SQL문은 user_views 데이터사전의 text에 저장
SELECT e.empno
     , e.ename
     , e.hire_date
     , e.deptno
     , d.deptname
     , d.loc
    FROM emp e
        ,dept d
 WHERE d.deptno = e.deptno;
 
 SELECT * FROM v_emp_dept;
 
 -- 데이터 사전에서 뷰를 조회
 /*
    user_views : 데이터 사전의 user 테이블
    view_name : 뷰이름
    test : 뷰 내용(=서브쿼리)
*/
SELECT view_name, text
    FROM user_views;
/*
 p278
뷰 제거하기
[형식] DROP VIEW 뷰이름;
뷰는 실재가 없는 가상테이블이기 때문에 뷰를 삭제한다는 것은 USER_VIEWS 데이터 사전에
저장되어 있는 뷰의 정의를 삭제한다는 것을 의미
삭제해도 뷰를 정의한 기본테이블의 구조나 데이터에는 영향이 없다.
*/

DROP VIEW v_emp_dept;
SELECT view_name, text
 FROM user_views; -- 뷰가 삭제됨

/* p280
CREATE OR REPLACE VIEW
이미 존재하는 뷰에 대해서 그 내용을 새롭게 변경하여 재생성
뷰가 없으면 새롭게 생성하고, 존재하면 변경

WITH CHECK OPTION
해당 뷰를 통해서 볼수있는 범위 내에서만 UPDATE 또는 INSERT가 가능하다.

WITH READ ONLY
해당 뷰를 통해서는 SELECT만 가능하며, INSERT/UPDATE/DELETE를 할 수 없다.
만약 이것을 생략시, 뷰를 사용하여 INSERT/UPDATE/DELETE 모두 가능하다.
 */
 
-- WITH READ ONLY
CREATE OR REPLACE VIEW v_emp_readonly
AS
SELECT empno
     , ename
     , email
     , hire_date
     , deptno
 FROM emp
 WITH READ ONLY;
 
 INSERT INTO v_emp_readonly(empno, ename, email, hire_date, deptno)
  VALUES(1001,'보아','boa@naer.com','20/12/14',101);
  
-- WITH CHECK OPTION
CREATE OR REPLACE VIEW v_emp_option
AS
SELECT empno
     , ename
     , email
     , hire_date
     , deptno
 FROM emp
 WHERE empno IN(2001, 2002) -- INSERT, UPDATE 허용범위
 WITH CHECK OPTION;
 
 INSERT INTO v_emp_option(empno, ename, email, hire_date, deptno)
  VALUES(2001,'이효리','hyo@naer.com','20/12/14',101); -- INSERT OK
  
 INSERT INTO v_emp_option(empno, ename, email, hire_date, deptno)
  VALUES(2002,'이상순','sang@naer.com','20/12/14',101); -- INSERT OK
COMMIT;
SELECT * FROm v_emp_option;

 INSERT INTO v_emp_option(empno, ename, email, hire_date, deptno)
  VALUES(2003,'유재석','yuu@naer.com','20/12/14',101); -- INSERT NG
  
UPDATE v_emp_option
    SET email = 'leehr@naver.com'
 WHERE empno = '2001';  -- UPDATE OK
 
UPDATE v_emp_option
    SET email = 'leess@naver.com'
 WHERE empno = '2002';  -- UPDATE OK
 
UPDATE v_emp_option
    SET email = 'leehr@naver.com'
 WHERE empno = '2003'   -- UPDATE NG
 
SELECT * FROm v_emp_option; --INSERT, UPDATE 모두 성공(2001, 2002인 경우만)
--2001	이효리	leehr@naver.com	20/12/14	101
--2002	이상순	leess@naver.com	20/12/14	101

