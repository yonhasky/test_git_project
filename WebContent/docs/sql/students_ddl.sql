CREATE TABLE STUDENTS(
ID       varchar2(20) primary key,   -- ���̵�
PW       varchar2(20) not null,      -- ��й�ȣ
NAME       varchar2(20) not null,    -- �̸�
MOBILE       varchar2(15) not null,  -- ����ó
EMAIL       varchar2(30) not null,   -- �̸���
BIRTH       number(4) not null,      -- �����(1991)
GENDER         varchar2(5) not null, -- ���� (���� M, ���� F)
MAJOR        varchar2(20) ,          -- ����
DIVISION    varchar2(20) ,           -- ��������
GRADE       varchar2(10) ,           -- �й�(98, 10 ...)
IMG       varchar2(100) ,            -- �̹���
GDATE       varchar2(15) ,           -- ������(2010�� 02��)
COMPANY       varchar2(30) ,         -- �ٹ�ȸ��        
JOB       varchar2(30) ,             -- ���� ( IT�迭 / ȭ�� ... )
CAREER       varchar2(20) ,          -- ���(3�� 6����)
PART       varchar2(10) not null    -- ȸ�����(������ A , ���л� S, ������ G)
);