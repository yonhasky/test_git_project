CREATE TABLE MENTORINGS (
M_NO	number(10) primary key, -- 멘토링 번호
M_TITLE		varchar2(100) not null, -- 제목
M_AUTHOR	varchar2(20) not null, -- 작성자
M_DATE		varchar2(15) not null, -- 등록일
M_PERIOD	varchar2(30) not null, -- 수행기간(2016-03-09 ~ 2016-09-09)
M_OVERVIEW	varchar2(100) not null, -- 개요
M_CONTENT	varchar2(1000) not null, -- 내용
M_FILE1		varchar2(100), -- 파일1
M_FILE2		varchar2(100), -- 파일2
M_HIT		number(10) not null, -- 조회수
M_STATUS	varchar2(1) not null -- 멘토링 진행현황 ( A: 신청 , P : 진행 , T : 종료 )
);