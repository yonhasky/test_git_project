CREATE TABLE MENTOMATCHES (
MM_NO number(10) primary key, -- ���丵 ��Ī ��ȣ
MM_HOST		varchar2(20) not null, -- ���丵 ������
MM_ENTRY 	varchar2(20) not null, -- ���丵 ������
MM_ENTRY_COMMENT	varchar2(100) not null, -- ���丵 ���� ��û �Ѹ���
MM_ENTRY_DATE 		varchar2(15) not null, -- ��û��
MM_ENTRY_STATUS		varchar2(1) not null, -- ���丵 ��û ���/���� ����
M_NO 		number(10) not null,
FOREIGN KEY(M_NO) REFERENCES MENTORINGS(M_NO)
);


INSERT INTO mentorings VALUES(1,'IoT �繰���ͳ� ������Ʈ', 'user01', '2016/09/12', '2016-10-30 ~ 2016-12-21', 'IoT���� ������Ʈ', 'MANGO Board �� LINUX ���� ������ ���� �����ڸ� ã���ϴ�.', '', '', 10, 'A');
INSERT INTO mentorings VALUES(2,'���� �Ұ� ���ø����̼�', 'user02', '2016/09/17', '2016-09-25 ~ 2016-12-31', '�ȵ���̵� ���ø����̼� ���� ������Ʈ', '�ȵ���̵� ���� ���� ���θ� �ϸ� �Բ� ���� �Ұ� ���ø����̼��� �����ϽǺ� ã���ϴ�.', '', '', 22, 'P');
INSERT INTO mentorings VALUES(3,'JAVA ���� ���丵 �մϴ�.','user03','2016/08/15','2016-08-15 ~ 2016-12-31', 'JAVA ���� �⺻���� ���丵', 'JAVA ���� ���θ� �ϰ����� �е��� ���� ���䰡 �ǰ��ͽ��ϴ�. ���� ������Ʈ�� ���ϱ�� ������ �� �����Դϴ�.', '', '', 15, 'P');
INSERT INTO mentorings VALUES(4,'���� ���� ���丵 �մϴ�.','blueprint','2016/08/01','2016-09-15 ~ 2016-12-31', '���� ������ ���� �⺻���� �н� ����', '������ ���� ���θ� �ϰ����� �е��� ���� ���䰡 �ǰ��ͽ��ϴ�. ', '', '', 15, 'P');
INSERT INTO mentorings VALUES(5,'���� ���� �ʼ����� ���䱸�մϴ�.','bluesky','2016/09/08','2016-10-15 ~ 2016-12-31', '���п� �ʿ��� ������ �˷��� ����', '���п� �ʿ��� ������ �˷��ֽ� ������� ���մϴ�. �ִ��� ������ ���ڽ��ϴ�.', '', '', 20, 'A');
INSERT INTO mentorings VALUES(6,'���䱸�մϴ�.','kang0114','2016/09/20','2016-10-20 ~ 2016-12-31', '� �оߵ� ������ �����Ͻ� ��', '� �оߵ� ���� ������ �������ֽ� ����� ã���ϴ�. �������� ������ �ϸ� ����ͽ��ϴ�..', '', '', 15, 'A');
INSERT INTO mentorings VALUES(7,'���� ��ȣ�� ���䰡 �ǰڽ��ϴ�.','kim3821','2016/09/11','2016-10-20 ~ 2016-12-31', '���� ��ȣ�� ��Ȱ�� ���� �ñ��� �л����� ���䰡 �ǰ��ͽ��ϴ�.', '���� ��ȣ�� ��Ȱ�� ���� �ñ��� �л����� ���䰡 �ǰ��ͽ��ϴ�.', '', '', 15, 'A');
INSERT INTO mentorings VALUES(8,'�Ӻ���� ������Ʈ','user01','2016/08/20','2016-08-31 ~ 2016-12-31', '�Ӻ���� ���� �н� �� ������Ʈ', '�Ӻ���� �о� ���� ����� ã���ϴ�. Serial ����� ���� ���� ����� ������ �÷����� �ͽ��ϴ�. ', '', '', 35, 'P');
INSERT INTO mentorings VALUES(9,'������� ������ �帮�� �ͽ��ϴ�.','blueprint','2016/09/25','2016-11-01 ~ 2016-12-31', '������� ���丵', '���� ����� �غ��ϸ鼭 �����ϴ� ���� ������ �Ĺ�Ե鿡�� ���� ������ �ǰ��� ���䰡 �Ǿ���� �մϴ�.', '', '', 15, 'A');
INSERT INTO mentorings VALUES(10,'��Ű ����� ���մϴ�.','user03','2016/08/27','2016-08-01 ~ 2016-12-31', '���� ��ȣ�� ��Ȱ�� ���� �ñ��� �л����� ���䰡 �ǰ��ͽ��ϴ�.', '���� ��ȣ�� ��Ȱ�� ���� �ñ��� �л����� ���䰡 �ǰ��ͽ��ϴ�.', '', '', 15, 'P');

INSERT INTO mentomatches VALUES(1,'user01','user02','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/31','A', 1);
INSERT INTO mentomatches VALUES(2,'user02','user01','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/21','D', 2);
INSERT INTO mentomatches VALUES(3,'user03','user04','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/15','A', 3);
INSERT INTO mentomatches VALUES(4,'blueprint','user04','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/20','A', 4);
INSERT INTO mentomatches VALUES(5,'kim3821','user01','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/22','A', 7);
INSERT INTO mentomatches VALUES(6,'user03','bluesky','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/07','D', 10);
INSERT INTO mentomatches VALUES(7,'user02','kim3821','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/23','D', 2);
INSERT INTO mentomatches VALUES(8,'user03','user02','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/08/27','A', 3);
INSERT INTO mentomatches VALUES(9,'blueprint','kang0114','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/02','A', 4);
INSERT INTO mentomatches VALUES(10,'kim3821','user03','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/26','A', 7);
INSERT INTO mentomatches VALUES(11,'user03','blueprint','������û �մϴ�. ������ �ϰڽ��ϴ�.','2016/09/08','D', 10);
