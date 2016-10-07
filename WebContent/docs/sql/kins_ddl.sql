CREATE TABLE KINS (    
K_NO       number(10) primary key, -- 질문 번호
K_TITLE    varchar2(100) not null, -- 질문 제목
K_AUTHOR   varchar2(20) not null, -- 질문 작성자
K_DATE     varchar2(15) not null, -- 질문 작성일
K_CONTENT  varchar2(1000) not null, -- 질문 작성내용
K_HIT      number(10) not null,  -- 질문 조회수
K_RECOMMENDS number(10) not null, -- 질문 추천수
K_FILE1    varchar2(100), -- 질문글 파일1
K_FILE2    varchar2(100), -- 질문글 파일2
K_STATUS  varchar2(1) not null-- 질문글 진행사항 ( P : 진행 , T : 종료 )
);