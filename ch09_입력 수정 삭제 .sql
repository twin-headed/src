/* p226
1. 테이블에 데이터를 추가하는 INSERT문

-DML(데이터 조작어 : DATA Mnipulation Language)은 테이블에 데이터를 삽입, 수정 삭제하기 위한 명령어 집합이다.
-INSERT문은 테이블에 데이터를 입력하기 위한 명령문이다.

- [형식]
    INSERT INTO 테이블명(컬럼명1,..컬렴명N)
    VALUES(값1,..값N) -- 컬럼순서대로 컬럼에 원하는 값을 삽입
    -- 기술한 컬럼수와 값의 갯수, 순서, 데이터 타입이 일치해야한다.
    -- INTO 절에 컬럼을 명시하지 않으면, 테이블을 생성할 때 정의한 컬럼순서와 동일한 순서대로 입력된다.
    -- 한번에 하나의 행만 INTO 뒤에 명시한 테이블에 삽입된다.
    -- 데이터 타입이 문자와 날짜일 경우에는 반드시 작은따옴표('')를 사용해야 한다. 
    -- COMMIT : 데이터베이스에 영구적으로 데이터를 저장하는 명령문
    --ROLLBACK : 입력,수정,삭제를 취소시, COMMIT 전에 ROLLBACK을 해야한다.
*/

DROP TABLE play_tab;
CREATE TABLE play_tab(
    play_code   NUMBER(3) PRIMARY KEY, -- NOT NULL, UNIQUE, 식별자 역할
    play_name   VARCHAR2(50) NOT NULL,  -- 놀이명
    play_place  VARCHAR2(50) NOT NULL,  -- 장소
    play_price  NUMBER(8) DEFAULT 0,    -- 가격
    play_number NUMBER(5) DEFAULT 0,    -- 참석인원수
    play_date   DATE DEFAULT sysdate    -- 참석일
);


-- 1, 놀이동산, 잠실, 40000, 2
-- 2, 남산타워, 남산, 50000, 2
-- 3, 방탈출까페, 홍대, 40000, 2
-- 4, VR, 신촌, 30000, 3
-- 5, 실내 스카이다이빙, 용인, 100000, 2

INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(1, '놀이동산', '잠실', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(2, '남산타워', '남산', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(3, '방탈출', '홍대', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(4, 'VR', '신촌', 40000, 2,'');
INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(5, '실내스카이다이빙', '용인', 40000, 2,'');

COMMIT;

INSERT INTO play_tab(play_code, play_name, play_place, play_price, play_number, play_date)
VALUES(6, '실내스카이다이빙', '용인', 40000, 2,'');
ROLLBACK;

SELECT * FROM play_tab;

/*
방법1) 데이터를 제외한 테이블 구조만 복사한 후 데이터를 INSERT
play_tab_copy
*/
CREATE TABLE play_tab_copy2
AS 
SELECT * FROM play_tab
WHERE 0=1;

SELECT * FROM play_tab;

INSERT INTO play_tab_copy2
SELECT *
    FROM play_tab;
COMMIT;

/*
방법2) 데이터, 테이블구조 모두 복사한 후 데이터를 INSERT
play_tab_copy2
*/
CREATE TABLE play_tab_copy
AS 
 SELECT * FROM play_tab;

SELECT * FROM play_tab_copy;

/* p232
2. 테이블의 내용을 수정하는 UPDATE문

- UPDATE문은 테이블에 저장된 데이터를 수정하기 위한 DML이다.
- 주의사항 : KEY는 수정하지 않는다.(DELETE한 후 INSERT한다.)

[형식]
UPDATE 테이블명
    SET 컬럼1 = 값1, 컬럼2 = 값2,.. 컬럼n=값n
WHERE 조건식;
*/

-- play_code 5번 => 장소 : 가디역, 인원수: 5, 일자 : 2020/12/12 수정
UPDATE play_tab
SET play_place = '가디역', play_number = 5, play_date = '2020/12/12'
WHERE play_code = 5;
COMMIT;
-- play_code 45번 => 장소 : 여의도역, 가격 5만원, 가격인원수 : 10, 일자 : 2020/12/10 수정
UPDATE play_tab
SET play_name = '여의도역', play_price = 50000, play_date = '2020/12/10', play_number = 10
WHERE play_code = 4;
COMMIT;


/*
2-1. 다른 테이블을 기반으로 데이터 수정하기
-UPDATE 문의 SET절에서 서브쿼리를 기술하면, 서브쿼리를 수행한 결과로 내용이 변경된다.
*/
--play_code 3번 => 여의도역, 가겨 : 50000 , 인원수 : 10, 일자 : 2020/12/10 수정
SELECT * FROM menu_tbl_copy;
-- 3번 food_name, 5번 food_price를 읽어서 1번 food_name, food_price로 변경
UPDATE menu_tbl_copy
  SET food_name = (SELECT food_name
                    FROM menu_tbl_copy
                    WHERE food_code ='3')
    , food_price = (SELECT food_price
                    FROM menu_tbl_copy
                    WHERE food_code='5')
    WHERE food_code = 2;
COMMIT;

UPDATE menu_tbl_copy
  SET (food_name,food_price) = (SELECT food_name,food_price
                    FROM menu_tbl_copy
                    WHERE food_code ='4')
   WHERE food_code = '1';
COMMIT;

/* p234
    3. 테이블의 내용을 삭제하는 DELETE문
    - DELETE문을 사용하여 기존에 저장된 데이터를 삭제할 수 있다.
    - WHERE 절을 생략하면 테이블에 있는 모든 행ㅇ니 삭제된다.
    
    [형식]
    DELETE[FROM] 테이블명
    WHERE 조건;
*/
-- D : menu_tbl_copy => food_code '1'인 데이터 삭제
    DELETE menu_tbl_copy
    where food_code = 1;
-- I : menu_tbl_copy => food_code '1'인 데이터 입력 [1,'김밥천국','ko','송이덮밥',7000, 2, 20/12/13
    INSERT INTO menu_tbl_copy (food_code, restaurant_name, food_kind, food_name, food_price, starpoint, start_date)
    VALUES (1,'김밥천국','ko','송이덮밥',7000, 2, '20/12/13');
    
-- U : menu_tbl_copy => food_code '5'인 데이터 수정 [5, '만리장성','ch','잡채덮밥',6000,2, 20/12/13
    UPDATE menu_tbl_copy
    SET food_code = 1, restaurant_name = '만리장성', food_kind = 'ch' , food_name = '잡채덮밥' , food_price = 6000, starpoint = 2, start_date = ''
    WHERE food_code = 5;
-- D : menu_tbl_copy => food_name '덮밥을 포함한 데이터 삭제
    DELETE menu_tbl_copy
    WHERE food_name LIKE '%덮밥%';




