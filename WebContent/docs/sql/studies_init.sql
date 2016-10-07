CREATE TABLE STUDIES (
ST_NO	number(10) primary key, -- 스터디 번호
ST_TITLE	varchar2(100) not null, -- 제목
ST_AUTHOR	varchar2(20) not null, -- 작성자
ST_DATE		varchar2(15) not null, -- 스터디 등록일
ST_PERIOD       varchar2(30) not null, -- 수행기간(2016-03-09 ~ 2016-09-09)
ST_OVERVIEW	varchar2(100) not null, -- 스터디 개요
ST_CONTENT	varchar2(1000) not null, -- 스터디 내용
ST_FILE1	varchar2(100), -- 파일1
ST_FILE2	varchar2(100), -- 파일2
ST_HIT		number(10) not null, -- 조회수
ST_STATUS	varchar2(1) not null -- 스터디 진행현황 ( A: 신청 , P : 진행 , T : 종료 )
);

INSERT INTO studies VALUES(1, 'JAVA 스터디 개최합니다.', 'user01', '2016/09/15', '2016-10-20 ~ 2016-12-31', 'JAVA 기초지식 공부', 'JAVA 관련 기본 문법 및 소규모 프로젝트 진행하실분 구합니다.', '', '', 0, 'A');
INSERT INTO studies VALUES(2, '토익 스터디 함께 하실분~', 'user02', '2016/08/20', '2016-09-20 ~ 2016-10-30', '기초 영문법 및 어휘 학습목적', '기초 영문법 및 어휘공부 함께 하실분 찾습니다.', '', '', 0, 'P');
INSERT INTO studies VALUES(3, 'Spring 스터디 함께 하실분~', 'user03', '2016/09/22', '2016-10-30 ~ 2016-12-31', 'Spring Framework 기초 이해', 'Spring Framework에 대해 함께 공부하실분 찾습니다!', '', '', 0, 'A');
INSERT INTO studies VALUES(4, '토익공부 같이 하실분!', 'user03', '2016/09/25', '2016-10-30 ~ 2016-12-31', '토익 기초 학습', '토익 공부 함께하실분 찾습니다!', '', '', 0, 'A');
INSERT INTO studies VALUES(5, 'Javascript 공부 하실분!', 'user01', '2016/08/10', '2016-09-10 ~ 2016-12-31', 'Javascript 기초 이해', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(6, 'DB 공부 함께 하실분 찾습니다.', 'kim3821', '2016/09/10', '2016-10-10 ~ 2016-12-31', 'DB 기초 이해', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'A');
INSERT INTO studies VALUES(7, '한식 요리사 자격증 준비하실 분', 'kang0114', '2016/09/14', '2016-09-20 ~ 2016-12-31', '한식 요리사 자격증 준비', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(8, '단기 공무원 스터디 하실 분', 'bluesky', '2016/09/17', '2016-09-10 ~ 2016-12-31', '단기 공무원 공부', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(9, '기사시험 함께 준비하실 분', 'blueprint', '2016/09/20', '2016-09-10 ~ 2016-12-31', '기사시험 요약 및 시험문제 풀이', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(10, '중간고사 함께 공부할 분 찾아요!', 'kang0114', '2016/09/08', '2016-10-30 ~ 2016-12-31', '중간고사 필기 요약 및 문제 예상', '중간고사 함께 공부하실분 찾아요~', '', '', 0, 'A');
INSERT INTO studies VALUES(11, '취업 스터디 개최합니다.', 'user02', '2016/09/18', '2016-10-01 ~ 2016-12-31', '취업 준비생 스터디', '취업 스터디 함께 하실분 찾습니다!', '', '', 0, 'P');

commit;