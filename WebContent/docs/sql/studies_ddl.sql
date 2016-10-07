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