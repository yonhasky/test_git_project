CREATE TABLE KINREPLIES (
KR_NO	number(10) primary key, -- �亯 ��ȣ
KR_TITLE	varchar2(100) not null, -- �亯 ���� 
KR_AUTHOR	varchar2(20) not null, -- �亯 �ۼ���
KR_DATE	varchar2(15) not null, -- �亯 �ۼ���
KR_CONTENT	varchar2(1000) not null, -- �亯 �ۼ�����
KR_RECOMMENDS	number(10) not null, -- �亯 ��õ��
KR_FILE1	varchar2(100), -- �亯 ����1
KR_FILE2	varchar2(100), -- �亯 ����2
KR_CONFIRM	varchar2(1)	not null, -- �亯 ���� ����(T �亯, F �亯 �̼���)
K_NO	number(10)  not null, -- ������ȣ
FOREIGN KEY(K_NO) REFERENCES KINS(K_NO) -- ����
);

INSERT INTO kinreplies VALUES(1,'�亯�Դϴ�','user02','2016/09/12','�ܼ��� ������� �����ϼ���~',0,null,null,'F',1);
INSERT INTO kinreplies VALUES(2,'�̸��� �ּ���','user03','2016/09/13','lkl0309@naver�� �̸��� �ּ���~',0,null,null,'T',1);
INSERT INTO kinreplies VALUES(3,'�亯','user03','2016/09/11','�� ������Ʈ���� ���� �ִ� �����Դϴ�.',0,null,null,'F',2);
INSERT INTO kinreplies VALUES(4,'�̷��� �غ�����!','blueprint','2016/09/13','���� ����Ʈ�� �����ϼ���~ www.naver.com',0,null,null,'T',2);
INSERT INTO kinreplies VALUES(5,'���͵� �ۼ� ���� �亯','kang0114','2016/09/17','����Ʈ �α��� �� ���͵� �޴��� ���ø� �ۼ� �����մϴ�.',0,null,null,'F',6);
INSERT INTO kinreplies VALUES(6,'�亯','user03','2016/09/14','���丵 �޴��� �־��~',0,null,null,'F',7);
INSERT INTO kinreplies VALUES(7,'���丵 ��û �̷��� �ϼ���.','blueprint','2016/09/16','����Ʈ �α��� �� ������ ���丵 �޴����� ������ ��û�����մϴ�.',0,null,null,'T',7);
INSERT INTO kinreplies VALUES(8,'�亯','user03','','',0,null,null,'F',8);
INSERT INTO kinreplies VALUES(9,'���� �ش繮���� �־����ϴ�.','blueprint','','',0,null,null,'T',8);
INSERT INTO kinreplies VALUES(10,'�亯','bluesky','','������ �ۼ��� ���� Ȯ���Ͻø� �ֽ��ϴ�.',0,null,null,'F',9);