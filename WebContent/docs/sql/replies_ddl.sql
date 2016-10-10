CREATE TABLE KINREPLIES (
R_NO	number(10) primary key, -- �亯 ��ȣ
R_TITLE	varchar2(100) not null, -- �亯 ���� 
R_AUTHOR	varchar2(20) not null, -- �亯 �ۼ���
R_DATE	varchar2(15) not null, -- �亯 �ۼ���
R_CONTENT	varchar2(1000) not null, -- �亯 �ۼ�����
R_RECOMMENDS	number(10) not null, -- �亯 ��õ��
R_FILE1	varchar2(100), -- �亯 ����1
R_FILE2	varchar2(100), -- �亯 ����2
R_CONFIRM	varchar2(1)	not null, -- �亯 ���� ����(T �亯 ����, F �亯 �̼���)
K_NO	number(10)  not null, -- ������ȣ
FOREIGN KEY(K_NO) REFERENCES KINS(K_NO) -- ����
);

create sequence seq_rpl_num;
