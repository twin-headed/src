/*
p238
트랜잭션(Transaction)관리
트랜잭션은 데이터 처리에서 논리적인 하나의 작업 단위를 의미한다.
ALL or Nothing : 여러개의 명령어 집합이 정상적으로 처리되면 정상종료하고,
    명령어들중 하나라도 잘못된다면 전체를 취소한다.
DML 입수삭 작업이 성공적으로 처리되었다면 COMMIT을 취소해야 한다면 ROLLBACk 명령을 실행한다.
DDL, DCL문이 실행되는 경우에는 자동으로 COMMIT 된다.
COMMIT - 트랜잭션의 처리과정을 반영하여 변경된 내용을 영구저장한다. 모든 작업들을 정상처리확정 명령어이다.
        INSERT, UPDATE, DELETE(즉 DML) 후 COMMIT을 해야 한다.
ROLLBACK - 트랜잭션의 처리과정중 발생한 변경사항을 취소하며, 하나의 묶음처리가 시작되기 이전상태로 돌아간다.
        COMMIT전에 해야한다.
SAVEPOINT - 현재의 트랜잭션을 작게 분할한다. 대소문자 구별함
    저장된 SAVEPOINT는 ROLLBACK TO SAVEPOINT 문을 사용하여 표시한 곳까지 롤백할 수 있다.
    1) SAVEPOINT SAVEPOINT명;
    2) ROLLBACK TO SAVEPOINT명;
    
왜 세이브포인트를 설정해야되나

*/

CREATE TABLE dept_tr(
    deptno NUMBER(2) PRIMARY KEY,
    deptname    VARCHAR(50) NOT NULL,
    loc     VARCHAR2(50)
);

--10, IT, 서울
--20, 기획부, 인천
--30, 영업부, 대구
--40, 마케팅, 광주
--50, 경영지원, 경기도

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(10,'IT','서울');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(20,'기획부','인천');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(30,'영업부','대구');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(40,'마케팅','광주');

INSERT INTO dept_tr(deptno,deptname,loc)
 VALUES(50,'경영지원','경기도');

COMMIT;

SELECT *
FROM dept_tr;               -- 확인문장
-- 트랜잭션
-- 1) 40번 부서 삭제 후 COMMIT
DELETE dept_tr
 WHERE deptno = 40;
COMMIT;
-- 2) 30번 부서 삭제 후 SAVEPOINT S1 설정
DELETE dept_tr
 WHERE deptno = 30;
SAVEPOINT S1;
-- 3) 20번 부서 삭제 후 SAVEPOINT S2 설정
DELETE dept_tr
 WHERE deptno = 20;
SAVEPOINT S2;
-- 4) 10번 부서 삭제 
DELETE dept_tr
 WHERE deptno = 10;
-- 트랜잭션 중간단계로 되돌리기
-- 5) 10번 부서 삭제 취소
ROLLBACK TO S2; -- 롤백 완료.(10번 회생)
-- 6) 20번 부서 삭제 취소
ROLLBACK TO S1; -- 롤백 완료.(20번 회생)
-- 7) 30번 부서 삭제 취소
ROLLBACK; -- 롤백 완료.(30번 회생) SAVEPOINT가 없으므로 ROLLBACk사용
-- 8) 40번 부서 삭제 취소
ROLLBACK; -- 40번은 COMMIT(영구저장)된 상태이므로 ROLLBACK 불가