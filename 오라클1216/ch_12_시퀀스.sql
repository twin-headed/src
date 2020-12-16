/* 7일차
12장 시퀀스
시퀀스 : PRIMARY KEY로 지정한 컬럼에 일련번호를 자동으로 부여받기 위해 사용
시퀀스는 테이블내의 유일한 숫자를 자동으로 생성해 주고, 주로 기본키로 사용된다.
(예. 게시판의 글번호, 부서테이블의 부서번호)
[형식]
<시퀀스 생성>
CREATE SEQUENCE 시퀀스명
[START WITH n]
[INCREMENT BY n]
[MAXVALUE n | MINVALUE n]
[CYCLE n | NOCYCLE]
[CACHE n | NOCACHE]

- CURRVAL : 시퀀스의 현재값을 알아낸다.
- CURRVAL에 새로운 값이 할당되기 위해 NEXTVAL에 새로운 값을 생성해야 한다.
- NEXTVAL : 시퀀스의 다음값을 알아내기 위해 사용

<시퀀스 변경>
ALTER SEQUENCE 시퀀스명
[START WITH n] : 사용불가이며, 다른 번호에서 다시 시작하려면 이전 시퀀스를 제거하고 다시 생성한다.
[INCREMENT BY n]
[MAXVALUE n | MINVALUE n]
[CYCLE n | NOCYCLE]
[CACHE n | NOCACHE]
*/

DROP SEQUENCE emp_seq;
CREATE SEQUENCE emp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999
    CYCLE;

DROP SEQUENCE dept_seq;
CREATE SEQUENCE dept_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999
    CYCLE;

-- 새로 만든 시퀀스에 nextval을 사용하지 않고 바로 currval 을 사용하면 오류가 발생한다.
SELECT emp_seq.currval
    FROM dual; -- NG : EMP_SEQ.CURRVAL is not yet defined in this session

-- nextval로 emp_seq 시퀀스의 새로운 값 생성하기
-- 현재값을 알기 위해서 반드시 nextval을 먼저 가져와야 함
SELECT emp_seq.nextval
    FROM dual;  -- 결과값 1

--currval로 emp_seq 시퀀스의 현재값 알아내기
SELECT emp_seq.currval
    FROM dual;  -- 결과값 1

-- nextval로 dept_seq 시퀀스의 새로운 값 생성하기
SELECT dept_seq.nextval
    FROM dual;

--currval로 dept_seq 시퀀스의 현재값 알아내기
SELECT dept_seq.currval
    FROM dual;

--시퀀스 데이터사전에서 시퀀스 조회
SELECT * FROM user_sequences;

-- 시퀀스 삭제
DROP SEQUENCE emp_seq;
DROP SEQUENCE dept_seq;

-- 데이터 사전 조회
SELECT sequence_name
 FROM user_sequences
 WHERE sequence_name = 'DEPT_SEQ';  --시퀀스가 졸라많으면 296p처럼 in을 붙여 조회
 
-- 부서 테이블 생성후 시퀀스를 이용해 PK값을 주자
CREATE TABLE dept_seq_tbl(
 deptno		NUMBER(3) CONSTRAINT dept_seq__deptno_pk PRIMARY KEY,
 deptname	VARCHAR2(50) NOT NULL,
 loc		VARCHAR2(50)
);
DROP TABLE dept_seq_tbl;
DROP TABLE emp_seq_tbl;
CREATE TABLE emp_seq_tbl(
 empno		NUMBER(4) CONSTRAINT emp_seq_tbl_empno_pk PRIMARY KEY,
 ename		VARCHAR2(20) NOT NULL,
 hire_date	DATE DEFAULT sysdate,
 salary		NUMBER(9) CONSTRAINT emp_seq_tbl_min_salary CHECK(salary > 0),
 deptno		NUMBER(3) REFERENCES dept_seq_tbl ON DELETE CASCADE,
 email		VARCHAR2(60)CONSTRAINT emp_seq_tbl_email_uu UNIQUE
);

DROP SEQUENCE dept_seq;
CREATE SEQUENCE dept_seq
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 999;

DROP SEQUENCE emp_seq;
CREATE SEQUENCE emp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999;

-- dept 에 next emp에 curr 반복
INSERT INTO dept_seq_tbl
VALUES(dept_seq.nextval,'a','서울');
INSERT INTO emp_seq_tbl(empno,ename,salary,deptno,email)
VALUES(emp_seq.nextval,'김',4000000,dept_seq.currval,'a@naver.com');

SELECT *
FROM dept_seq_tbl;

SELECT *
FROm emp_seq_tbl;

/* 8일차 - p298
 03. 인덱스
인덱스는 검색 속도를 향상시키기 위해 사용
기본키나 유일키는 인덱스가 자동으로 생성된다.
USER_COLUMNS, USER_IND_COULUMNS 데이터 사전을 통해 확인

[형식]
 CREATE INDEX index_name
 ON table_name(column_name);
 
- 인덱스를 생성하는 것이 좋은 컬럼
1) WHERE절이나 JOIN조건 안에서 자주 사용되는 컬럼
2) NULL값이 많이 포함되어 있는 컬럼
3) WHERE절이나 JOIN 조건안에서 자주 사용되는 두개이상의 컬럼

- 인덱스 생성 불필요한 경우
1) 테이블이 작을 때
2) 테이블이 자주 갱신될 때
*/
-- 인덱스 생성확인 : 데이터 사전
SELECT index_name, table_name, column_name
 FROM user_ind_columns
 WHERE table_name IN('EMP','DEPT');     --테이블명은 싱글로 감싸고 '대문자' : 대소문자 구별
 
-- 테이블 생성
 CREATE TABLE dept_idx
AS
 SELECT * FROM dept;    -- 구조, 데이터까지 복사
 
 CREATE TABLE emp_idx
AS
 SELECT * FROM emp;     -- 구조, 데이터까지 복사
 
SELECT * FROM dept_idx;
SELECT * FROM emp_idx;

-- 1) 비고유 인덱스 : 중복된 데이터를 갖는 컬럼에 대해서 생성하는 인덱스이며, UNIQUE를 붙이면 에러 발생
CREATE INDEX idx_emp_ename
ON emp_idx(ename);

-- 2) 고유 인덱스 : 기본키나 유일키처럼 유일한 값을 갖는 컬럼에 대해서 생성하는 인덱스이며, UNIQUE INDEX로 사용한다.
CREATE UNIQUE INDEX idx_dept_idx_deptno
ON dept_idx(deptno);
-- 3) 결합 인덱스 : 두개 이상의 컬럼으로 인덱스를 구성한다.
CREATE INDEX idx_dept_idx_com
ON dept_idx(deptname, loc);

-- 인덱스 생성확인 : 데이터 사전
SELECT index_name, table_name, column_name
 FROM user_ind_columns
 WHERE table_name IN('EMP_IDX','DEPT_IDX');
--결과값
--IDX_DEPT_IDX_DEPTNO	DEPT_IDX	DEPTNO
--IDX_DEPT_IDX_COM	DEPT_IDX	DEPTNAME
--IDX_DEPT_IDX_COM	DEPT_IDX	LOC
--IDX_EMP_ENAME	EMP_IDX	ENAME
 
-- 4) 함수기반 인덱스
 CREATE INDEX idx_emp_idx_salary
 ON emp_idx(salary * 12);
--결과값
--IDX_DEPT_IDX_DEPTNO	DEPT_IDX	DEPTNO
--IDX_DEPT_IDX_COM	DEPT_IDX	DEPTNAME
--IDX_DEPT_IDX_COM	DEPT_IDX	LOC
--IDX_EMP_ENAME	EMP_IDX	ENAME
--IDX_EMP_IDX_SALARY	EMP_IDX	SYS_NC00007$
 
 

