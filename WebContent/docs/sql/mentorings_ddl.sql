CREATE TABLE MENTORINGS (
M_NO	number(10) primary key, -- ���丵 ��ȣ
M_TITLE		varchar2(100) not null, -- ����
M_AUTHOR	varchar2(20) not null, -- �ۼ���
M_DATE		varchar2(15) not null, -- �����
M_PERIOD	varchar2(30) not null, -- ����Ⱓ(2016-03-09 ~ 2016-09-09)
M_OVERVIEW	varchar2(100) not null, -- ����
M_CONTENT	varchar2(1000) not null, -- ����
M_FILE1		varchar2(100), -- ����1
M_FILE2		varchar2(100), -- ����2
M_HIT		number(10) not null, -- ��ȸ��
M_STATUS	varchar2(1) not null -- ���丵 ������Ȳ ( A: ��û , P : ���� , T : ���� )
);