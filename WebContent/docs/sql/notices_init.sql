CREATE TABLE NOTICES (
N_NO	number(10) primary key, -- ���� ��ȣ
N_TITLE		varchar2(100) not null, -- ���� ����
N_AUTHOR	varchar2(20) not null,  -- ���� �ۼ���
N_CONTENT	varchar2(1000) not null,-- ���� ����
N_TYPE  varchar2(1) not null,     -- ���� Ÿ��(G : ������, S : ��ȸ����, N : ��ä����) 
N_DATE	varchar2(15) not null, -- ���� �����
N_FILE1 varchar2(100),         -- ���� ����1
N_FILE2 varchar2(100),         -- ���� ����2
N_HIT	number(10) not null         -- ���� ��ȸ��
);

INSERT INTO notices VALUES(1,'IT ������','admin02','��/�� ���ø����̼� ���� �������� ���ֵ˴ϴ�.','G','2016/09/08','','',0);
INSERT INTO notices VALUES(2,'IT ���̵�� ������','admin02','IT ���̵�� ���� �������� ���ֵ˴ϴ�. ���ù��� sky1212@naver.com','G','2016/09/12','','',0);
INSERT INTO notices VALUES(3,'���� ������ ������','admin01','���� ������ ���� �������� ���ֵ˴ϴ�. ���ù��� sky0891@naver.com','G','2016/09/18','','',0);
INSERT INTO notices VALUES(4,'�ؿ� ��ȸ����','admin01','���ĵ� �ؿܷ� ��ȸ���� ���Ǻ��� ã���ϴ�. ���ù��� sky1291@naver.com','S','2016/09/20','','',0);
INSERT INTO notices VALUES(5,'���� ��ȸ����','admin02','���� �� ����������� ���� �������� ã���ϴ�. ���ù��� sky1891@naver.com','S','2016/09/23','','',0);
INSERT INTO notices VALUES(6,'���� �ó� ��ƿ� ��ȸ����','admin02','����ó� 20�� ��ƽü����� �������� ã���ϴ�. ���ù��� sky1791@naver.com','S','2016/09/24','','',0);
INSERT INTO notices VALUES(7,'�������۴� ���� ����ä��','admin02','�������۴Ͽ��� �����ִ� ����� ã���ϴ�. ���ù��� sky1591@naver.com','N','2016/09/07','','',0);
INSERT INTO notices VALUES(8,'�������۴� ����� Ư��ä��','admin02','�������۴Ͽ��� ����� ����� ã���ϴ�. ���ù��� sky3291@naver.com','N','2016/09/11','','',0);
INSERT INTO notices VALUES(9,'SKY GAMING �׽��� ä�� ����','admin02','SKY GAMING���� �׽��͸� ã���ϴ�. ���ù��� sky8121@naver.com','N','2016/09/14','','',0);
INSERT INTO notices VALUES(10,'�λ�� ��δ� ��ȸ����','admin02','�λ�� ���� 20�� ��δ翡�� ��ȸ���簡 ���ֵ˴ϴ�.  ���ù��� sky3218@naver.com','S','2016/09/13','','',0);
INSERT INTO notices VALUES(11,'��ȸ���� ���̵�� ������','admin01','��ȸ���� ���̵�� �������� ���ֵ˴ϴ�. ���ù��� sky7711@naver.com','G','2016/09/12','','',0);
