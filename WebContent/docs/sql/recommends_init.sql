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

 delete from RECOMMENDS;
truncate table RECOMMENDS;

drop sequence seq_RECOMMENDS;
create sequence seq_RECOMMENDS;



INSERT INTO recommends VALUES(1, '����Ʈ �̿� ����', '����Ʈ �̿��ϸ鼭 ���װ� �߻��߽��ϴ�.', 'user01', '2016/09/01', 'B', '', '', 2);
INSERT INTO recommends VALUES(2, '���丵 ��û�� ����� ���� �ʽ��ϴ�.', '���丵 ��û�� ������ ���� ������ �߻��߽��ϴ�.', 'user02', '2016/09/07', 'S', '', '', 2);
INSERT INTO recommends VALUES(3, '���丵 ��û ����', '���丵 ��û�� ������ ���� ���װ� �߻��߽��ϴ�.', 'user03', '2016/09/18', 'B', '', '', 2);
INSERT INTO recommends VALUES(4, '���͵� ����', '���͵� ��û�� ������ ���� ���װ� �߻��߽��ϴ�.', 'user03', '2016/09/20', 'B', '', '', 2);
INSERT INTO recommends VALUES(5, '���͵� ��� �̿�', '���͵� �̿뿡 ������ ���� ���װ� �߻��߽��ϴ�.', 'user04', '2016/09/21', 'B', '', '', 2);
INSERT INTO recommends VALUES(6, '���̵�� ����', '���Ĺ谣 ������õ���ִ� ������ �־����� ���ڽ��ϴ�.', 'user04', '2016/09/09', 'F', '', '', 2);
INSERT INTO recommends VALUES(7, '���丵 ����', '���丵 ��� �� ������ ���� ������ �߻��߽��ϴ�.', 'kang0114', '2016/09/08', 'B', '', '', 2);
INSERT INTO recommends VALUES(8, '����Ʈ �̿� ����', '����Ʈ �̿� �� ������ ���� ������ �߻��߽��ϴ�.', 'bluesky', '2016/09/28', 'S', '', '', 2);
INSERT INTO recommends VALUES(9, '�̷� �������� ���մϴ�.', '�л��鰣�� ��ȭ�� ������ ä�ñ���� �־����� ���ڽ��ϴ�.', 'blueprint', '2016/10/01', 'F', '', '', 2);
INSERT INTO recommends VALUES(10, '���丵 �̿� ����', '���丵 �̿� �� ������ ���� ������ �߻��߽��ϴ�.', 'kim3821', '2016/09/22', 'B', '', '', 2);
INSERT INTO recommends VALUES(11, '���丵 ��û�� ����� ��ϵ��� �ʽ��ϴ�.', '����Ʈ�� ������ �ִ� �� �����ϴ�. Ȯ�� ��Ź�帳�ϴ�.', 'kang0114', '2016/09/26', 'B', '', '', 2);

commit;

select * from RECOMMENDS;
