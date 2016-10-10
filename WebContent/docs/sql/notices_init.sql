drop table NOTICES;

CREATE TABLE NOTICES (
N_NO	number(10) primary key, -- 공지 번호
N_TITLE		varchar2(100) not null, -- 공지 제목
N_CONTENT	varchar2(1000) not null,-- 공지 내용
N_AUTHOR	varchar2(20) not null,  -- 공지 작성자
N_DATE	varchar2(15) not null, -- 공지 등록일
N_TYPE  varchar2(1) not null,     -- 공지 타입(G : 공모전, S : 사회봉사, N : 공채정보) 
N_FILE1 varchar2(100),         -- 공지 파일1
N_FILE2 varchar2(100),         -- 공지 파일2
N_HIT	number(10) not null         -- 공지 조회수
);

 delete from NOTICES;
truncate table NOTICES;

drop sequence seq_NOTICES;
create sequence seq_NOTICES;


INSERT INTO notices VALUES(1,'IT 공모전','웹/앱 어플리케이션 관련 공모전이 개최됩니다.','admin02','2016/09/08','G','','',0);
INSERT INTO notices VALUES(2,'IT 아이디어 공모전','IT 아이디어 관련 공모전이 개최됩니다. 관련문의 sky1212@naver.com','admin02','2016/09/12','G','','',0);
INSERT INTO notices VALUES(3,'공공 데이터 공모전','공공 데이터 관련 공모전이 개최됩니다. 관련문의 sky0891@naver.com','admin01','2016/09/18','G','','',0);
INSERT INTO notices VALUES(4,'해외 사회봉사','낙후된 해외로 사회봉사 가실분을 찾습니다. 관련문의 sky1291@naver.com','admin01','2016/09/20','S','','',0);
INSERT INTO notices VALUES(5,'국내 사회봉사','제주 및 경상지역에서 국내 봉사대원을 찾습니다. 관련문의 sky1891@naver.com','admin02','2016/09/23','S','','',0);
INSERT INTO notices VALUES(6,'서울 시내 고아원 사회봉사','서울시내 20개 고아시설에서 봉사대원을 찾습니다. 관련문의 sky1791@naver.com','admin02','2016/09/24','S','','',0);
INSERT INTO notices VALUES(7,'해피컴퍼니 신입 공개채용','해피컴퍼니에서 열정있는 사원을 찾습니다. 관련문의 sky1591@naver.com','admin02','2016/09/07','N','','',0);
INSERT INTO notices VALUES(8,'해피컴퍼니 경력직 특별채용','해피컴퍼니에서 경력직 사원을 찾습니다. 관련문의 sky3291@naver.com','admin02','2016/09/11','N','','',0);
INSERT INTO notices VALUES(9,'SKY GAMING 테스터 채용 공고','SKY GAMING에서 테스터를 찾습니다. 관련문의 sky8121@naver.com','admin02','2016/09/14','N','','',0);
INSERT INTO notices VALUES(10,'부산시 경로당 사회봉사','부산시 지정 20개 경로당에서 사회봉사가 개최됩니다.  관련문의 sky3218@naver.com','admin02','2016/09/13','S','','',0);
INSERT INTO notices VALUES(11,'사회복지 아이디어 공모전','사회복지 아이디어 공모전이 개최됩니다. 관련문의 sky7711@naver.com','admin01','2016/09/12','G','','',0);

select * from NOTICES;

SELECT N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM ( SELECT rownum as rown, N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM (SELECT rownum AS rown, N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM NOTICES WHERE N_TITLE LIKE '%서울%' ORDER BY  N_DATE DESC)) WHERE rown>=1 AND rown<=10
