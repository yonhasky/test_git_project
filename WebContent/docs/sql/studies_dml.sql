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

-- 1. 스터디 등록 SQL
INSERT INTO studies VALUES(12, 'JAVA 스터디 개최합니다.', 'user01', to_char(sysdate,'yyyy/MM/dd'), concat(to_char(sysdate,'yyyy/MM/dd ~ '),to_char(sysdate+60,'yyyy/MM/dd')), 'JAVA 기초지식 공부', 'JAVA 관련 기본 문법 및 소규모 프로젝트 진행하실분 구합니다.', '', '', 0, 'A');

-- 2. 스터디 전체 조회 SQL
SELECT * FROM studies;

-- 3. 스터디 상세 조회 SQL
SELECT * FROM studies WHERE st_no=1;

-- 4. 스터디 변경 SQL
UPDATE studies
SET st_title='C언어 스터디 개최합니다', ST_DATE=to_char(sysdate,'yyyy/MM/dd'), st_overview='C언어 기초지식 공부', st_content='C언어 관련 기본 문법 및 소규모 프로젝트 진행하실분 구합니다.', st_file1='', st_file2='', ST_STATUS='T'
WHERE st_no=1;

-- 5. 스터디 삭제 SQL
DELETE 
FROM studies
WHERE st_no=1;

select * from studies;

