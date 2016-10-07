CREATE TABLE STUDENTS(
ID       varchar2(20) primary key,   -- 아이디
PW       varchar2(20) not null,      -- 비밀번호
NAME       varchar2(20) not null,    -- 이름
MOBILE       varchar2(15) not null,  -- 연락처
EMAIL       varchar2(30) not null,   -- 이메일
BIRTH       number(4) not null,      -- 출생년(1991)
GENDER         varchar2(5) not null, -- 성별 (남자 M, 여자 F)
MAJOR        varchar2(20) ,          -- 전공
DIVISION    varchar2(20) ,           -- 세부전공
GRADE       varchar2(10) ,           -- 학번(98, 10 ...)
IMG       varchar2(100) ,            -- 이미지
GDATE       varchar2(15) ,           -- 졸업일(2010년 02월)
COMPANY       varchar2(30) ,         -- 근무회사        
JOB       varchar2(30) ,             -- 직종 ( IT계열 / 화학 ... )
CAREER       varchar2(20) ,          -- 경력(3년 6개월)
PART       varchar2(10) not null    -- 회원등급(관리자 A , 재학생 S, 졸업생 G)
);