CREATE TABLE KINS (    
K_NO       number(10) primary key, -- ���� ��ȣ
K_TYPE		varchar2(20) not null,  -- ���� ����(�б���Ȱ, ���, ����, ����Ȱ��, ���Ƹ�, ������, ���)
K_TITLE    varchar2(100) not null, -- ���� ����
K_AUTHOR   varchar2(20) not null, -- ���� �ۼ���
K_DATE     varchar2(15) not null, -- ���� �ۼ���
K_CONTENT  varchar2(1000) not null, -- ���� �ۼ�����
K_HIT      number(10) not null,  -- ���� ��ȸ��
K_RPL		 number(10) not null,  -- �亯��
K_RECOMMENDS number(10) not null, -- ���� ��õ��
K_FILE1    varchar2(100), -- ������ ����1
K_FILE2    varchar2(100), -- ������ ����2
K_COUNT   number(10) not null -- ����¡ó��
);

create sequence seq_kin_num;
