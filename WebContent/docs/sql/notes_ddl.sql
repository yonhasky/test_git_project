CREATE TABLE NOTES(
N_NO number(10) primary key, -- ���� ��ȣ
N_SENDER varchar2(20) not null, -- ���� �۽���
N_RECEIVER varchar2(20) not null, -- ���� ������
N_TITLE varchar2(100) not null, -- ���� ����
N_CONTENT varchar2(200) not null, -- ���� ����
N_DATE varchar2(15) not null, -- ���� �����
N_STATUS varchar2(1) not null, -- ���� Ȯ�� ����(T:���� F:���� ����)
FOREIGN KEY(N_RECEIVER) REFERENCES STUDENTS(ID)
);