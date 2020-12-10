--1. 시스템 계정 생성
--[오라클 계정 생성]
--2. 교육용 계정(HR) 락해제
--alter user <계정> account unlock;
alter user hr account unlock;

--3. 패스워드 변경
--alter user <계정이름> identified by<패스워드>
alter user hr identified by tiger;

--4.계정 접속
