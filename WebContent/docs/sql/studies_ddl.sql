CREATE TABLE STUDIES (
ST_NO	number(10) primary key, -- ���͵� ��ȣ
ST_TITLE	varchar2(100) not null, -- ����
ST_AUTHOR	varchar2(20) not null, -- �ۼ���
ST_DATE		varchar2(15) not null, -- ���͵� �����
ST_PERIOD       varchar2(30) not null, -- ����Ⱓ(2016-03-09 ~ 2016-09-09)
ST_OVERVIEW	varchar2(100) not null, -- ���͵� ����
ST_CONTENT	varchar2(1000) not null, -- ���͵� ����
ST_FILE1	varchar2(100), -- ����1
ST_FILE2	varchar2(100), -- ����2
ST_HIT		number(10) not null, -- ��ȸ��
ST_STATUS	varchar2(1) not null -- ���͵� ������Ȳ ( A: ��û , P : ���� , T : ���� )
);