CREATE TABLE STUDYMATCHES (
STM_NO	number(10) primary key,
STM_HOST	varchar2(20) not null,	-- ���͵� ������
STM_ENTRY	varchar2(20) not null,	-- ���͵� ������           
STM_ENTRY_COMMENT	varchar2(100) not null,    -- ���͵� ���� ��û �Ѹ���
STM_ENTRY_DATE	varchar2(15) not null,       -- ���͵� ��û��
STM_ENTRY_STATUS	varchar2(1) not null,    -- ���͵� ��û ���/���� ����
ST_NO	number(10) not null,
FOREIGN KEY(ST_NO) REFERENCES STUDIES(ST_NO)
); 


