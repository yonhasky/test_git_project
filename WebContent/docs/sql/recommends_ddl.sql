CREATE TABLE RECOMMENDS (
R_NO	number(10) primary key, -- 건의 사항 번호
R_TITLE		varchar2(100) not null, -- 건의 제목
R_CONTENT	varchar2(1000) not null, -- 건의 내용
R_AUTHOR	varchar2(20) not null, -- 건의자
R_DATE		varchar2(15) not null, -- 건의 등록일
R_TYPE    varchar2(1) not null, -- 건의사항 유형 S - 사이트 이용관련 , B - 버그, F - 기능추가
R_FILE1   varchar2(100), -- 건의사항 파일1
R_FILE2   varchar2(100), -- 건의사항 파일2
R_HIT   number(10) not null -- 건의사항 조회수
);


