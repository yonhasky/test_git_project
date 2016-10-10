CREATE TABLE STUDYMATCHES (
STM_NO	number(10) primary key,
STM_HOST	varchar2(20) not null,	-- 스터디 주최자
STM_ENTRY	varchar2(20) not null,	-- 스터디 참가자           
STM_ENTRY_COMMENT	varchar2(100) not null,    -- 스터디 참가 신청 한마디
STM_ENTRY_DATE	varchar2(15) not null,       -- 스터디 신청일
STM_ENTRY_STATUS	varchar2(1) not null,    -- 스터디 신청 허락/거절 여부
ST_NO	number(10) not null,
FOREIGN KEY(ST_NO) REFERENCES STUDIES(ST_NO)
); 


