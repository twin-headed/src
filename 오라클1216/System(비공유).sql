
--2.사용자 권한 부여
-- grant connect, resource, create view to <계정이름>
grant connect, resource, create view to scott;
grant create view to scott;

--3. 락해제
--alter user <계정> account unlock;
alter user scott account unlock;

