/* 6일차 오후 1:00
10장. 데이터 무결성과 제약조건 - 중요, 면접

1. 제약조건
제약조건이란 테이블에 유효하지 않은 (부적절한) 데이터가 입력되는 것을
방지하기 위해서 테이블 생성시 각 컬럼에 대해 정의하는 규칙이다.

Oracle의 제약조건 종류
구분                  설명
NOT NULL - 컬럼에 NULL값을 포함하지 못하도록 지정한다.
UNIQUE - 테이블의 모든 로우에 대해서 유일한 값을 갖도록 한다.
PRIMARY KEY - 테이블의 각 행을 식별하기 위한 것으로 NULL과 중복된 값을 모두 허용하지 않는다.
            즉, NOT NULL 조건 + UNIQUE
FOREIGN KEY - 참조되는 테이블에 컬럼값이 항상 존재해야 한다.
CHECK - 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값만을 허용한다.

제약조건명 : 중복을 허용하지 않는다.(유일해야한다.) 테이블명_컬럼명_키 중복허용x
- 제약조건에 따른 INSERT, DELETE.. 중요(INSERT는 부모테이블부터, DELETE는 자식테이블부터)
1. 부모테이블의 PK칼럼(부서,부서번호)에 데이터가 존재해야
   자식테이블의 FK컬럼(사원,부서번호)에 데이터가 INSERT 가능하다.
   
2.자식테이블의 FK 컬럼(사원,부서번호)로 사용되는 행이 존재하면, 자식 FK데이터를 먼저 삭제한 후
  부모데이터를 삭제한다.
  
3. ON DELETE CASCADE : 자식테이블에 설정하면, 부모 테이블 데이터 삭제시, 자식도 함께 삭제
*/

----------------
-- 테이블 레벨 --
----------------

--부서 테이블 생성
SELECT * FROm tab;
DROP TABLE dept;
CREATE TABLE dept(
    deptno     NUMBER(3),  --PK
    deptname    VARCHAR2(50) NOT NULL,
    loc         VARCHAR2(50),
    CONSTRAINT dept_deptno_pk PRIMARY KEY(deptno) --테이블 레벨
);

-- 사원테이블 생성
DROP TABLE emp;
CREATE TABLE emp(
    empno   NUMBER(4),  --pk
    ename   VARCHAR(20) NOT NULL,
    hire_date   DATE DEFAULT sysdate,
    salary  NUMBER(9) CONSTRAINT emp_salary_min CHECK(salary > 0),
    deptno  NUMBER(3), --fk
    email   VARCHAR(60), --unique
    CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
    CONSTRAINT emp_deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno)
        ON DELETE CASCADE,
    CONSTRAINT emp_email UNIQUE(email)
);

SELECT * FROM tab;

--INSERT : dept -> emp 부모부터 자식
--101, IT, 서울
--102, ACCOUNT, 뉴욕
--103, HR, 파리
--104, ADVERTISING, 싱가폴
--105, MARKETING, 프랑크푸르트
INSERT INTO dept
 VALUES(101,'IT','서울');
INSERT INTO dept
 VALUES(102,'ACCOUNT','뉴욕');
INSERT INTO dept
 VALUES(103,'HR','파리');
INSERT INTO dept
 VALUES(104,'ADVERTISING','싱가폴');
INSERT INTO dept
 VALUES(105,'MARKETING','프랑크푸르트');
INSERT INTO dept
 VALUES(106,'IT','캐나다');
COMMIT;
--1001, 소지섭, 2020/12/01, 10000, 101, so@naver.com
--1002, 현빈, 2020/12/02, 20000, 102, hb@naver.com
--1003, 유지태, 2020/12/03, 30000, 103, jt@naver.com
--1004, 이정재, 2020/12/04, 40000, 104, jj@naver.com
--1005, 이병헌, 2020/12/05, 50000, 105, bh@naver.com
INSERT INTO emp
 VALUES(1001, '소지섭', '2020/12/01', 10000, 101, 'so@naver.com');
INSERT INTO emp
 VALUES(1002, '현빈', '2020/12/02', 20000, 102, 'hb@naver.com');
INSERT INTO emp
 VALUES(1003, '유지태', '2020/12/03', 30000, 103, 'jt@naver.com');
INSERT INTO emp
 VALUES(1004, '이정재', '2020/12/04', 40000, 104, 'jj@naver.com');
INSERT INTO emp
 VALUES(1005, '이병헌', '2020/12/05', 50000, 105, 'bh@naver.com');
COMMIT;
-- parent key not fount ==> 해결책 : 부모테이블에 106번 부서 신설
INSERT INTO emp
 VALUES(1006, '김태희', '2020/12/05', 50000, 106, 'th@naver.com');
COMMIT;

--unique constraint violated : 이메일 중복 ==> 해결책 : 이메일 수정후 다시 시도
INSERT INTO emp
 VALUES(1007, '김태희2', '2020/12/05', 50000, 106, 'th2@naver.com');
COMMIT;

--check constraint violated : 급여가 음수 => 해결책 : 양수로 수정
INSERT INTO emp
 VALUES(1008, '김태희2', '2020/12/05', 50000, 106, 'th3@naver.com');
COMMIT;


SELECT * FROM dept;
SELECT * FROM emp;

--
----------------
-- 컬럼 레벨 --
----------------

--부서 테이블 생성
SELECT * FROm tab;
DROP TABLE dept_re;
CREATE TABLE dept_re(
    deptno     NUMBER(3) PRIMARY KEY,  --PK
    deptname    VARCHAR2(50) NOT NULL,
    loc         VARCHAR2(50)
    --CONSTRAINT dept_deptno_pk PRIMARY KEY(deptno) --테이블 레벨
);

-- 사원테이블 생성
DROP TABLE emp_re;
CREATE TABLE emp_re(
    empno   NUMBER(4) PRIMARY KEY,  --pk
    ename   VARCHAR(20) NOT NULL,
    hire_date   DATE DEFAULT sysdate,
    salary  NUMBER(9) CONSTRAINT emp_salary_min CHECK(salary > 0),
    deptno  NUMBER(3) REFERENCES dept_re(deptno),--fk
    email   VARCHAR(60) UNIQUE --unique
    --CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
    --CONSTRAINT emp_deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno)
       -- ON DELETE CASCADE,
    --CONSTRAINT emp_email UNIQUE(email)
);

SELECT * FROM tab;

DELETE dept
WHERE deptno = 106;  -- 자식 테이블의 deptno가 106인 데이터도 동시에 삭제
COMMIT;
SELECT * FROM dept;
SELECT * FROM emp;

DELETE dept_re
WHERE deptno = 106; -- 자식 테이블의 deptno가 106인 데이터도 동시에 삭제

-- 제약조건 정보 가져오기
SELECT constraint_name, constraint_type, table_name
    FROM sys.user_constraints; -- SCOTT 계정에서 실행