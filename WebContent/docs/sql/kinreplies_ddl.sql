CREATE TABLE KINREPLIES (
KR_NO	number(10) primary key, -- �亯 ��ȣ
KR_TITLE	varchar2(100) not null, -- �亯 ���� 
KR_AUTHOR	varchar2(20) not null, -- �亯 �ۼ���
KR_DATE	varchar2(15) not null, -- �亯 �ۼ���
KR_CONTENT	varchar2(1000) not null, -- �亯 �ۼ�����
KR_RECOMMENDS	number(10) not null, -- �亯 ��õ��
KR_FILE1	varchar2(100), -- �亯 ����1
KR_FILE2	varchar2(100), -- �亯 ����2
KR_CONFIRM	varchar2(1)	not null, -- �亯 ���� ����(T �亯 ����, F �亯 �̼���)
K_NO	number(10)  not null, -- ������ȣ
FOREIGN KEY(K_NO) REFERENCES KINS(K_NO) -- ����
);