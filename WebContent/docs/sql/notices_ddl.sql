CREATE TABLE NOTICES (
N_NO	number(10) primary key, -- 공지 번호
N_TITLE		varchar2(100) not null, -- 공지 제목
N_AUTHOR	varchar2(20) not null,  -- 공지 작성자
N_CONTENT	varchar2(1000) not null,-- 공지 내용
N_TYPE  varchar2(1) not null,     -- 공지 타입(G : 공모전, S : 사회봉사, N : 공채정보) 
N_DATE	varchar2(15) not null, -- 공지 등록일
N_FILE1 varchar2(100),         -- 공지 파일1
N_FILE2 varchar2(100),         -- 공지 파일2
N_HIT	number(10) not null         -- 공지 조회수
);
