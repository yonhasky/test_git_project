CREATE TABLE MENTORINGS (
M_NO number(10) primary key, -- ���丵 ��Ī ��ȣ
M_HOST		varchar2(20) not null, -- ���丵 ������
M_ENTRY 	varchar2(20) not null, -- ���丵 ������
M_NAME  varchar2(20) not null, -- ���丵 ������ �̸�
M_MAJOR varchar2(20), -- �а�
M_GRADE varchar2(10), -- �й�
M_COMMENT	varchar2(100) not null, -- ���丵 ���� ��û �Ѹ���
M_DATE 		varchar2(15) not null, -- ��û��
M_STATUS		varchar2(1) not null -- ���丵 ��û ���/���� ���� (��� : A, �ź� : D)
);