CREATE TABLE RECOMMENDS (
R_NO	number(10) primary key, -- ���� ���� ��ȣ
R_TITLE		varchar2(100) not null, -- ���� ����
R_CONTENT	varchar2(1000) not null, -- ���� ����
R_AUTHOR	varchar2(20) not null, -- ������
R_DATE		varchar2(15) not null, -- ���� �����
R_TYPE    varchar2(1) not null, -- ���ǻ��� ���� S - ����Ʈ �̿���� , B - ����, F - ����߰�
R_FILE1   varchar2(100), -- ���ǻ��� ����1
R_FILE2   varchar2(100), -- ���ǻ��� ����2
R_HIT   number(10) not null -- ���ǻ��� ��ȸ��
);


