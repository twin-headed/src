--�ݵ��� ���� --
DROP TABLE notice;
DROP TABLE fund_comment;
DROP TABLE Counseling;
DROP TABLE fund_Investor;
DROP TABLE fund;
--�ݵ� ��� �� -

--�ڵ���ü ��� --
DROP TABLE auto_transferList;
DROP TABLE auto_transfer;
--�ڵ���ü ��� �� --

--���� ��� --
DROP TABLE installment_savings;
DROP TABLE savings_product;
--���� ��� �� --

--���� �׶�--
DROP TABLE fixed_deposit;
DROP TABLE deposit_product;
--���� ��� ��--

--���� ��� --
DROP TABLE Loans_history;
DROP TABLE Loans;
DROP TABLE LOANS_PRODUCT;
--���� ��� ��--

--��������, ��� ��� --
DROP TABLE account_transfer;
DROP TABLE LIMIT_INFO; --��ü�ѵ�
DROP TABLE account_info;
DROP TABLE MEMBERS;
--��--

--������ ���--
DROP SEQUENCE SEQ_ACCOUNT;
DROP SEQUENCE SEQ_TRANSFER;
DROP SEQUENCE SEQ_AUTOTRANSFER;
DROP SEQUENCE SEQ_DEPOSIT;
DROP SEQUENCE SEQ_SAVINGS;
DROP SEQUENCE SEQ_LOANS;
DROP SEQUENCE SEQ_COUNSELING;
DROP SEQUENCE NUM_SEQ;
DROP SEQUENCE SEQ_FUND;
DROP SEQUENCE SEQ_COUNSELING;
DROP SEQUENCE SEQ_LOANS_HISTORY;
--

select * from members;
delete members;


select * from account_info;



select * from members;
select * from savings_product;
select * from account_info;
select * from fixed_deposit;
delete fixed_deposit;
delete account_info where accounttype = '����';
select * from installment_savings;


select * from auto_transfer;
delete auto_transfer;
delete account_transfer;
delete account_info where account = '33-02-222222';
commit;
rollback;




   
SELECT t.*
  FROM auto_transfer t
  JOIN account_info a
    ON t.jd_account = a.account
  JOIN installment_savings i
    ON t.jd_account = i.account
 WHERE TRUNC(sysdate) != TRUNC(i.j_join_date) 
   AND t.jd_outDate = 06
   AND i.j_state = '������'; 
   
   
   
commit;



INSERT 
  INTO account_info 
VALUES('33-09-000001', 'admin', 1234, 1000000000, '�����', '����', '���� ����', sysdate, sysdate, sysdate, 2000000, 1000000, 2000000, 1000000); --��ü�� �⺻ ����ݰ���

INSERT 
  INTO account_info 
VALUES('33-01-888888', 'test1', 1234, 1000000000, '�����', '����', '���� ����', sysdate, sysdate, sysdate, 2000000, 1000000, 2000000, 1000000); --��ü�� �⺻ ����ݰ���
------------------����(����������)
INSERT 
  INTO account_info 
VALUES('33-02-111111', 'test1', 1234, 0, '����', '����', '���� ����', sysdate, sysdate, sysdate, 2000000, 1000000, 2000000, 1000000); --���������� ���ݰ���

INSERT
  INTO account_transfer(transfer_id, account, sender_account, money, in_out, in_outdate, out_comment, sender_name)
VALUES(SEQ_TRANSFER.nextval, '33-01-888888', '33-02-111111', 100000, '���', add_months(sysdate, -9), '�����������', 'qwer');

INSERT
 INTO account_transfer(transfer_id, account, sender_account, money, in_out, in_outdate, in_comment)
VALUES(SEQ_TRANSFER.nextval, '33-02-111111', '33-01-888888', 100000, '�Ա�', add_months(sysdate, -9), '���������Ա�');

INSERT
  INTO account_transfer(transfer_id, account, sender_account, money, in_out, in_outdate, out_comment, sender_name)
VALUES(SEQ_TRANSFER.nextval, '33-01-888888', '33-02-111111', 100000, '���', add_months(sysdate, -6), '�����������', 'qwer');

INSERT
 INTO account_transfer(transfer_id, account, sender_account, money, in_out, in_outdate, in_comment)
VALUES(SEQ_TRANSFER.nextval, '33-02-111111', '33-01-888888', 100000, '�Ա�', add_months(sysdate, -6), '���������Ա�');

INSERT
  INTO account_transfer(transfer_id, account, sender_account, money, in_out, in_outdate, out_comment, sender_name)
VALUES(SEQ_TRANSFER.nextval, '33-01-888888', '33-02-111111', 100000, '���', add_months(sysdate, -3), '�����������', 'qwer');

INSERT
 INTO account_transfer(transfer_id, account, sender_account, money, in_out, in_outdate, in_comment)
VALUES(SEQ_TRANSFER.nextval, '33-02-111111', '33-01-888888', 100000, '�Ա�', add_months(sysdate, -3), '���������Ա�');


INSERT 
  INTO savings_product 
VALUES('KOS����', '�� ����, ����ũ�� �⺻!', sysdate, 2.0, '�ܸ�', 12, 1, '���������İ� ����������(�ڵ���ü)�� ���ϴ� ����� �����ؼ� �����ϴ� ��ǰ�Դϴ�.', '�������������', 99); -- ���ݻ�ǰ(���������İ� �������� �̿��ϴ� �ѹ��� �μ�Ʈ!)

INSERT 
  INTO installment_savings(j_Key, j_name, account, j_join_date, j_state, j_rate, j_type, j_balance, j_method, j_end_date, j_month)       --�������̺� ����
VALUES(SEQ_SAVINGS.NEXTVAL, '��������', '33-02-111111', add_months(sysdate, -12), '������', 1.5, '�ܸ�', 0, '��������', sysdate, 12);
------------------����(����������)
select * from account_transfer;


------------------����(����������) ���
INSERT 
  INTO account_info 
VALUES('33-02-222222', 'test1', 1234, 100000, '����', '����', '���� ����', sysdate, sysdate, sysdate, 2000000, 1000000, 2000000, 1000000); --�ſ� 10������ ���������� ���ݰ���(�ܸ�)

INSERT 
  INTO installment_savings(j_Key, j_name, account, j_join_date, j_state, j_rate, j_type, j_balance, j_method, j_end_date, j_auto_date, j_month)       --�������̺� ����
VALUES(SEQ_SAVINGS.NEXTVAL, '��������', '33-02-222222', add_months(sysdate, -12), '������', 1.5, '�ܸ�', 0, '��������', sysdate, 5, 12);

select * from installment_savings;

update installment_savings set j_join_date = add_months(sysdate, -1) where j_key = 58;

commit;

------------------����(����������)



------------------���⿹��
INSERT 
  INTO account_info 
VALUES('33-03-333333', 'test1', 1234, 10000000, '����', '����', '���� ����', sysdate, sysdate, sysdate, 2000000, 1000000, 2000000, 1000000); --1000���� ��ġ ���⿹�ݰ���(�ܸ�)

INSERT 
  INTO deposit_product 
VALUES('���⿹��', '����ȹ���� �������� �ϴ� �� ����� ��ǥ��ǰ', sysdate, 1.5, '�ܸ�', 12, 1, 100000,'�����ڱ��� 1���̳��� �����Ⱓ ���� Ȯ���ݸ��� ��ġ�Ͽ� ���� ������ ���� �� �ִ� ���� �������� ��ġ�� ���ݻ�ǰ', '�������������'); --���⿹�ݻ�ǰ

INSERT
  INTO fixed_deposit
VALUES(SEQ_DEPOSIT.nextval, '���⿹��', '33-03-333333', add_months(sysdate, -12), '������', 1.5, '�ܸ�', 10000000, sysdate, 12); --�������̺� ����
------------------���⿹��


commit;


--ȸ������
DROP TABLE Members;
CREATE TABLE Members (
	ID	varchar2(20)	NOT NULL    PRIMARY KEY,
	pw	varchar2(100)	NOT NULL,
	name	varchar2(20)	NOT NULL,
	jumin	varchar2(20)	NOT NULL,
	job	varchar2(20)	NOT NULL,
	address	varchar2(100)	NOT NULL,
	postnum	varchar2(100)	NOT NULL,
	d_address	varchar2(100)	NOT NULL,
	phone	varchar2(20)	NOT NULL,
	email	varchar2(100)	NOT NULL,
	authority	varchar2(20)	NOT NULL,
	enabled	varchar2(20)	DEFAULT 1
);

----------------------------------------- ȸ������

commit;
--��������   
DROP TABLE account_info;
CREATE TABLE account_info (
	account	varchar2(20)	NOT NULL    PRIMARY KEY,
	ID	varchar2(20)	NOT NULL    REFERENCES Members(ID),
	accountPW	number(4)	NOT NULL,
	Balance	number(20)	DEFAULT 0,
	accountType	varchar2(20)	DEFAULT '�����',
	accountState	varchar2(20)	DEFAULT '����',
	acc_state_content	varchar2(2000)	DEFAULT '���� ����',
	delete_Date	TIMESTAMP	DEFAULT sysdate,
	sleep_Date	TIMESTAMP	DEFAULT sysdate,
	new_Date	TIMESTAMP	DEFAULT sysdate,
    accountLimit	number(20)	DEFAULT '2000000',
	oneLimit	number	DEFAULT '1000000',
	reset_accountLimit	number	DEFAULT '2000000',
	reset_oneLimit	number	DEFAULT '1000000'
);

--������ü
DROP TABLE account_transfer;
CREATE TABLE account_transfer (
	transfer_id	NUMBER	NOT NULL    PRIMARY KEY,
	account	varchar2(20)	NOT NULL REFERENCES account_info(account),
	sender_account	varchar2(20)	NOT NULL,
	money	number(20)	NOT NULL,
	in_out	varchar2(20)	NULL,
	in_outDate	DATE	DEFAULT sysdate,
	out_comment	varchar2(50)	NULL,
	in_comment	varchar2(50)	NULL,
	sender_name	varchar2(20)	NULL
);

--�ڵ���ü
DROP TABLE auto_transfer;
CREATE TABLE auto_transfer (
	jd_key	number(20)	NOT NULL    PRIMARY KEY,
	account	varchar2(20)	NOT NULL REFERENCES account_info(account),
	jd_account	varchar2(20)	NULL,
	jd_type	varchar2(20)	NULL,
	jd_outDate	varchar2(20)	NULL,
	jd_autoMoney	number(20)	NULL,
	jd_outCycle	varchar2(20)	NULL,
	jd_registDate	DATE	NULL,
	jd_expirationDate	DATE	NULL,
	jd_autoCancle	DATE	NULL,
	jd_inPlace	varchar2(20)	NULL,
	jd_status	varchar2(20)	DEFAULT '����',
	jd_autoLastDay	DATE	NULL
);

--�ڵ���ü����
DROP TABLE auto_transferList;
CREATE TABLE auto_transferList (
	jd_key	number(20)	NOT NULL REFERENCES auto_transfer(jd_key),
	jd_date	DATE	NOT NULL,
	jd_success	varchar(20)	NOT NULL,
	jd_inout	varchar(50)	NULL
);

--����
DROP TABLE fixed_deposit;
CREATE TABLE fixed_deposit (
	y_Key	    number	NOT NULL    PRIMARY KEY,
	y_name	    varchar2(50)	NOT NULL    REFERENCES deposit_product(y_name),
	account	    varchar2(20)	NOT NULL    REFERENCES account_info(account),
	y_join_date	TIMESTAMP	    DEFAULT sysdate,
	y_state	    varchar2(20)	DEFAULT '������',
	y_rate	    number(5,2)	    NOT NULL,
	y_type	    varchar2(20)	NOT NULL,
	y_balance	number(20)	    NOT NULL,
	y_end_date	TIMESTAMP	    NOT NULL,
    y_month     number(2)       NOT NULL
);

--����
DROP TABLE installment_savings;
CREATE TABLE installment_savings (
	j_Key	    number	NOT NULL    PRIMARY KEY,
	j_name	    varchar2(50)	NOT NULL  REFERENCES savings_product(j_name),
	account	    varchar2(20)	NOT NULL  REFERENCES account_info(account),
	j_join_date	TIMESTAMP	DEFAULT sysdate,
	j_state 	varchar2(20)	DEFAULT '������',
	j_rate	    number(5,2)	    NOT NULL,
	j_money	    number(20)      NULL,
	j_type	    varchar2(20)	NOT NULL,
	j_balance	number(20)	    NULL,
	j_method	varchar2(20)    NOT NULL,
	j_end_date	TIMESTAMP	    NOT NULL,
	j_auto_date	number(2)	    NULL,
    j_month     number(2)       NOT NULL
);

--���ݻ�ǰ
DROP TABLE deposit_product;
CREATE TABLE deposit_product (
	y_name	         varchar2(50)	NOT NULL    PRIMARY KEY,
	y_summary	    VARCHAR2(100)	NULL,
	y_date	        TIMESTAMP	DEFAULT sysdate,
	y_interest_rate	number(5,2)	NOT NULL,
	y_type	        varchar2(20)	NULL,
	y_max_date	    number(2)	NOT NULL,
	y_min_date	    number(2)	NOT NULL,
	y_min_price	    number(20)	NOT NULL,
	y_explanation	VARCHAR2(4000)	NULL,
	y_notice	    VARCHAR2(4000)	NULL
);

--���ݻ�ǰ
DROP TABLE savings_product;
CREATE TABLE savings_product (
	j_name	varchar2(50)	NOT NULL    PRIMARY KEY,
	j_summary	VARCHAR2(100)	NOT NULL,
	j_date	TIMESTAMP	DEFAULT sysdate NOT NULL,
	j_interest_rate	number(5,2)	NOT NULL,
	j_type	varchar2(20)	NOT NULL,
	j_max_date	number(2)	NOT NULL,
	j_min_date	number(2)	NOT NULL,
	j_explanation	VARCHAR2(4000)	NOT NULL,
	j_notice	VARCHAR2(4000)	NOT NULL,
	j_auto_date	number(2)
);

--account_info ������
DROP SEQUENCE SEQ_ACCOUNT;
CREATE SEQUENCE  SEQ_ACCOUNT ------------------------------ �߰�
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;

DROP SEQUENCE SEQ_LIMIT_INFO;
CREATE SEQUENCE  SEQ_LIMIT_INFO
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;

--��ü�ѵ�
DROP TABLE limit_info;
CREATE TABLE limit_info (
	l_key	number	NOT NULL    PRIMARY KEY,
	account	varchar2(20)	NOT NULL    REFERENCES account_info(account),
	l_date	TIMESTAMP	NULL,
	l_money	number	NULL,
	l_state	varchar(20)	NULL
);

--account_transfer ������
DROP SEQUENCE SEQ_TRANSFER;
CREATE SEQUENCE  SEQ_TRANSFER
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;
    




--auto_transfer ������
DROP SEQUENCE SEQ_AUTOTRANSFER;
CREATE SEQUENCE  SEQ_AUTOTRANSFER
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;



--Loans d_Key ������
DROP SEQUENCE SEQ_LOANS;
CREATE SEQUENCE  SEQ_LOANS ------------------------------ �߰�
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;

--�����ǰ
DROP TABLE Loans_product;
CREATE TABLE Loans_product (
	d_name	varchar2(50)	NOT NULL    PRIMARY KEY,
	d_date	TIMESTAMP	NULL,
	d_interest_rate	number(20)	NULL,
	d_summary	VARCHAR2(100)	NULL,
	d_min_price	number(20)	NULL,
	d_max_price	number(20)	NULL,
	d_min_date	NUMBER	NULL,
	d_max_date	NUMBER	NULL,
	d_explanation1	VARCHAR(4000)	NULL,
	d_explanation2	VARCHAR(4000)	NULL,
	d_explanation3	VARCHAR(4000)	NULL
);
commit;
--����
DROP TABLE Loans;
CREATE TABLE Loans (
	d_Key	number	NOT NULL    PRIMARY KEY,
	d_name	varchar2(50)	NOT NULL    REFERENCES account_info(account),
	account	varchar2(20)	NOT NULL    REFERENCES Loans_product(d_name),
	d_state	number(2)	NULL,
	d_start_date	TIMESTAMP	DEFAULT sysdate,
	d_end_date	TIMESTAMP	NULL,
	d_month	NUMBER	NULL,
	d_repay	VARCHAR2(50)	NULL,
	d_rate	NUMBER	NULL,
	d_amount	NUMBER	NULL,
	d_balance	number	NULL,
	d_balance_rate	number	NULL,
	d_loan_balance	NUMBER	NULL,
	d_loan_rate	number	NULL,
	d_tran	NUMBER	NULL,
	d_tran_rate	number	NULL,
	d_next_rate	number	NULL,
	d_ERR	NUMBER	NULL,
	d_ERC	NUMBER	NULL,
	d_auto_account	varchar2(20)	NULL,
	d_auto_date	number(2)	NULL
);

--Loans_history ���̺�     d_his_Key ������
DROP SEQUENCE SEQ_LOANS_HISTORY;
CREATE SEQUENCE  SEQ_LOANS_HISTORY 
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;

--�����ȯ
DROP TABLE Loans_history;
CREATE TABLE Loans_history (
	d_his_Key	NUMBER	NOT NULL    PRIMARY KEY,
	d_Key	NUMBER	    NOT NULL     REFERENCES loans(d_key),
	transfer_id	NUMBER  	NOT NULL     REFERENCES account_transfer(transfer_id),
	d_his_date	TIMESTAMP	NULL,
	d_his_state	VARCHAR2(50)	NULL,
	d_his_amount	NUMBER	NULL
);

--fixed_deposit Y_KEY ������
DROP SEQUENCE SEQ_DEPOSIT;
CREATE SEQUENCE  SEQ_DEPOSIT
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;
    

insert into savings_product values('�����׽�Ʈ3', '�׽�Ʈ���2', sysdate, 2.8, '�ܸ�2', 36, 1, '�����׽�Ʈ����2', '�������ǻ���2', 15);
select * from savings_product;
commit;

--installment_savings J_KEY ������
DROP SEQUENCE SEQ_SAVINGS;
CREATE SEQUENCE  SEQ_SAVINGS
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;




--Loans d_Key ������
DROP SEQUENCE SEQ_LOANS;
CREATE SEQUENCE  SEQ_LOANS ------------------------------ �߰�
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;


--Counseling ���̺�     b_num ������
DROP SEQUENCE SEQ_COUNSELING;
CREATE SEQUENCE  SEQ_COUNSELING 
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;
    
--�����(�Խ���)
DROP TABLE Counseling;
CREATE TABLE Counseling (
	b_num	number	NOT NULL    PRIMARY KEY,
	ID	varchar2(20)	NOT NULL    REFERENCES members(ID),
	b_title	varchar2(200)	NULL,
	b_content	varchar2(4000)	NULL,
	b_category	varchar2(20)	NULL,
	b_date	varchar2(20)	NULL,
	b_answer_date	varchar2(20)	NULL,
	b_answer_content	varchar2(4000)	NULL,
	b_name	varchar2(20)	NULL,
	b_state	number	NULL
);


--fund f_num ������
DROP SEQUENCE SEQ_FUND;
CREATE SEQUENCE  SEQ_FUND 
    MINVALUE 1
    MAXVALUE 999999
    INCREMENT BY 1
    CYCLE
    NOCACHE;
--�ݵ�
DROP TABLE fund;
CREATE TABLE fund (
	f_num	NUMBER	NOT NULL    PRIMARY KEY,
	ID	varchar2(20)	NOT NULL    REFERENCES members(id),
	account	varchar2(20)	NOT NULL    REFERENCES account_info(account),
	f_content	varchar2(4000)	NULL,
	f_start_date	varchar2(20)	NULL,
	f_end_date	varchar2(20)	NULL,
	f_target_money	number	NULL,
	f_category	varchar2(20)	NULL,
	f_approve	number	NULL,
	f_name	varchar2(20)	NULL,
	f_phone	varchar2(20)	NULL,
	f_Email	varchar2(100)	NULL,
	f_filename	varchar2(100)	NULL,
    f_title     varchar2(400)   NULL
);

--�ݵ�������
DROP TABLE fund_Investor;
CREATE TABLE fund_Investor (
	ID	varchar2(20)	NOT NULL    REFERENCES members(id),
	f_num	NUMBER	NOT NULL        REFERENCES fund(f_num),
	account	varchar2(20)	NOT NULL    REFERENCES account_info(account),
	f_account	varchar2(20)	NULL,
	f_money	number(20)	NULL,
	f_date	TIMESTAMP	NULL
);

--�ݵ� �ڸ�Ʈ
DROP TABLE fund_comment;
CREATE TABLE fund_comment (
	f_num	    NUMBER	NOT NULL    REFERENCES fund(f_num),
	c_title	    varchar2(200)	NULL,
	c_content	varchar2(4000)	NULL,
	c_date	    TIMESTAMP	NULL,
	c_name	    varchar2(100)	NULL
);

DROP SEQUENCE NUM_SEQ;
CREATE SEQUENCE NUM_SEQ
START WITH 1
INCREMENT BY 1;

--��������(�Խ���)
DROP TABLE notice;
CREATE TABLE notice (
	n_num	number	NOT NULL PRIMARY KEY,
	n_title	varchar2(200)	NULL,
	n_name	varchar2(20)	NULL,
	n_date	varchar2(20)	NULL,
	n_views	number	NULL,
	n_content	varchar2(4000)	NULL
);

COMMIT;



