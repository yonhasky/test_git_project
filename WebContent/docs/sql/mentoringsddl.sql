CREATE TABLE MENTORINGS (
M_NO number(10) primary key, -- 멘토링 매칭 번호
M_HOST		varchar2(20) not null, -- 멘토링 주최자
M_ENTRY 	varchar2(20) not null, -- 멘토링 참가자
M_NAME  varchar2(20) not null, -- 멘토링 참가자 이름
M_MAJOR varchar2(20), -- 학과
M_GRADE varchar2(10), -- 학번
M_COMMENT	varchar2(100) not null, -- 멘토링 참가 신청 한마디
M_DATE 		varchar2(15) not null, -- 신청일
M_STATUS		varchar2(1) not null -- 멘토링 신청 허락/거절 여부 (허락 : A, 거부 : D)
);