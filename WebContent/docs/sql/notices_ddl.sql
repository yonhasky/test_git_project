CREATE TABLE NOTICES (
N_NO	number(10) primary key, -- ���� ��ȣ
N_TITLE		varchar2(100) not null, -- ���� ����
N_AUTHOR	varchar2(20) not null,  -- ���� �ۼ���
N_CONTENT	varchar2(1000) not null,-- ���� ����
N_TYPE  varchar2(1) not null,     -- ���� Ÿ��(G : ������, S : ��ȸ����, N : ��ä����) 
N_DATE	varchar2(15) not null, -- ���� �����
N_FILE1 varchar2(100),         -- ���� ����1
N_FILE2 varchar2(100),         -- ���� ����2
N_HIT	number(10) not null         -- ���� ��ȸ��
);
