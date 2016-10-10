drop table NOTICES;

CREATE TABLE NOTICES (
N_NO	number(10) primary key, -- ���� ��ȣ
N_TITLE		varchar2(100) not null, -- ���� ����
N_CONTENT	varchar2(1000) not null,-- ���� ����
N_AUTHOR	varchar2(20) not null,  -- ���� �ۼ���
N_DATE	varchar2(15) not null, -- ���� �����
N_TYPE  varchar2(1) not null,     -- ���� Ÿ��(G : ������, S : ��ȸ����, N : ��ä����) 
N_FILE1 varchar2(100),         -- ���� ����1
N_FILE2 varchar2(100),         -- ���� ����2
N_HIT	number(10) not null         -- ���� ��ȸ��
);

 delete from NOTICES;
truncate table NOTICES;

drop sequence seq_NOTICES;
create sequence seq_NOTICES;


INSERT INTO notices VALUES(1,'IT ������','��/�� ���ø����̼� ���� �������� ���ֵ˴ϴ�.','admin02','2016/09/08','G','','',0);
INSERT INTO notices VALUES(2,'IT ���̵�� ������','IT ���̵�� ���� �������� ���ֵ˴ϴ�. ���ù��� sky1212@naver.com','admin02','2016/09/12','G','','',0);
INSERT INTO notices VALUES(3,'���� ������ ������','���� ������ ���� �������� ���ֵ˴ϴ�. ���ù��� sky0891@naver.com','admin01','2016/09/18','G','','',0);
INSERT INTO notices VALUES(4,'�ؿ� ��ȸ����','���ĵ� �ؿܷ� ��ȸ���� ���Ǻ��� ã���ϴ�. ���ù��� sky1291@naver.com','admin01','2016/09/20','S','','',0);
INSERT INTO notices VALUES(5,'���� ��ȸ����','���� �� ����������� ���� �������� ã���ϴ�. ���ù��� sky1891@naver.com','admin02','2016/09/23','S','','',0);
INSERT INTO notices VALUES(6,'���� �ó� ��ƿ� ��ȸ����','����ó� 20�� ��ƽü����� �������� ã���ϴ�. ���ù��� sky1791@naver.com','admin02','2016/09/24','S','','',0);
INSERT INTO notices VALUES(7,'�������۴� ���� ����ä��','�������۴Ͽ��� �����ִ� ����� ã���ϴ�. ���ù��� sky1591@naver.com','admin02','2016/09/07','N','','',0);
INSERT INTO notices VALUES(8,'�������۴� ����� Ư��ä��','�������۴Ͽ��� ����� ����� ã���ϴ�. ���ù��� sky3291@naver.com','admin02','2016/09/11','N','','',0);
INSERT INTO notices VALUES(9,'SKY GAMING �׽��� ä�� ����','SKY GAMING���� �׽��͸� ã���ϴ�. ���ù��� sky8121@naver.com','admin02','2016/09/14','N','','',0);
INSERT INTO notices VALUES(10,'�λ�� ��δ� ��ȸ����','�λ�� ���� 20�� ��δ翡�� ��ȸ���簡 ���ֵ˴ϴ�.  ���ù��� sky3218@naver.com','admin02','2016/09/13','S','','',0);
INSERT INTO notices VALUES(11,'��ȸ���� ���̵�� ������','��ȸ���� ���̵�� �������� ���ֵ˴ϴ�. ���ù��� sky7711@naver.com','admin01','2016/09/12','G','','',0);

select * from NOTICES;

SELECT N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM ( SELECT rownum as rown, N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM (SELECT rownum AS rown, N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM NOTICES WHERE N_TITLE LIKE '%����%' ORDER BY  N_DATE DESC)) WHERE rown>=1 AND rown<=10
