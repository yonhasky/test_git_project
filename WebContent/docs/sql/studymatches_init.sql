CREATE TABLE STUDYMATCHES (
STM_NO	number(10) primary key,
STM_HOST	varchar2(20) not null,	-- ���͵� ������
STM_ENTRY	varchar2(20) not null,	-- ���͵� ������           
STM_ENTRY_COMMENT	varchar2(100) not null,    -- ���͵� ���� ��û �Ѹ���
STM_ENTRY_DATE	varchar2(15) not null,       -- ���͵� ��û��
STM_ENTRY_STATUS	varchar2(1) not null,    -- ���͵� ��û ���/���� ���� (��� : A, ����: D)
ST_NO	number(10) not null,
FOREIGN KEY(ST_NO) REFERENCES STUDIES(ST_NO)
); 


INSERT INTO studies VALUES(2, '���� ���͵� �Բ� �ϽǺ�~', 'user02', '2016/08/20', '2016-09-20 ~ 2016-10-30', '���� ������ �� ���� �н�����', '���� ������ �� ���ְ��� �Բ� �ϽǺ� ã���ϴ�.', '', '', 0, 'P');
INSERT INTO studies VALUES(5, 'Javascript ���� �ϽǺ�!', 'user01', '2016/08/10', '2016-09-10 ~ 2016-12-31', 'Javascript ���� ����', 'Client ����� ���� �Բ� �����ϽǺ� ã�ƿ�~', '', '', 0, 'P');
INSERT INTO studies VALUES(7, '�ѽ� �丮�� �ڰ��� �غ��Ͻ� ��', 'kang0114', '2016/09/14', '2016-09-20 ~ 2016-12-31', '�ѽ� �丮�� �ڰ��� �غ�', 'Client ����� ���� �Բ� �����ϽǺ� ã�ƿ�~', '', '', 0, 'P');
INSERT INTO studies VALUES(8, '�ܱ� ������ ���͵� �Ͻ� ��', 'bluesky', '2016/09/17', '2016-09-10 ~ 2016-12-31', '�ܱ� ������ ����', 'Client ����� ���� �Բ� �����ϽǺ� ã�ƿ�~', '', '', 0, 'P');
INSERT INTO studies VALUES(9, '������ �Բ� �غ��Ͻ� ��', 'blueprint', '2016/09/20', '2016-09-10 ~ 2016-12-31', '������ ��� �� ���蹮�� Ǯ��', 'Client ����� ���� �Բ� �����ϽǺ� ã�ƿ�~', '', '', 0, 'P');
INSERT INTO studies VALUES(11, '��� ���͵� �����մϴ�.', 'user02', '2016/09/18', '2016-10-01 ~ 2016-12-31', '��� �غ�� ���͵�', '��� ���͵� �Բ� �ϽǺ� ã���ϴ�!', '', '', 0, 'P');

INSERT INTO STUDYMATCHES VALUES(1, 'user02', 'user03', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/08/27', 'A', 2);
INSERT INTO STUDYMATCHES VALUES(2, 'user01', 'user03', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/08/25', 'A', 5);
INSERT INTO STUDYMATCHES VALUES(3, 'kang0114', 'user01', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/08/25', 'A', 7);
INSERT INTO STUDYMATCHES VALUES(4, 'bluesky', 'user02', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�', '2016/09/25', 'A', 8);
INSERT INTO STUDYMATCHES VALUES(5, 'blueprint', 'kim3821', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�', '2016/09/21', 'A', 9);
INSERT INTO STUDYMATCHES VALUES(6, 'user02', 'bluesky', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�', '2016/09/24', 'A', 11);
INSERT INTO STUDYMATCHES VALUES(7, 'user01', 'kang0114', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/09/01', 'D', 5);
INSERT INTO STUDYMATCHES VALUES(8, 'kang0114', 'user02', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/09/16', 'D', 7);
INSERT INTO STUDYMATCHES VALUES(9, 'bluesky', 'blueprint', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/09/28', 'D', 8);
INSERT INTO STUDYMATCHES VALUES(10, 'blueprint', 'bluesky', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/09/27', 'D', 9);
INSERT INTO STUDYMATCHES VALUES(11, 'user02', 'user04', '�ߺ�Ź�帳�ϴ�. ������ �ϰڽ��ϴ�!', '2016/09/30', 'D', 11);

commit;
