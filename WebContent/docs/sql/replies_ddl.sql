CREATE TABLE KINREPLIES (
R_NO	number(10) primary key, -- 답변 번호
R_TITLE	varchar2(100) not null, -- 답변 제목 
R_AUTHOR	varchar2(20) not null, -- 답변 작성자
R_DATE	varchar2(15) not null, -- 답변 작성일
R_CONTENT	varchar2(1000) not null, -- 답변 작성내용
R_RECOMMENDS	number(10) not null, -- 답변 추천수
R_FILE1	varchar2(100), -- 답변 파일1
R_FILE2	varchar2(100), -- 답변 파일2
R_CONFIRM	varchar2(1)	not null, -- 답변 선택 여부(T 답변 선택, F 답변 미선택)
K_NO	number(10)  not null, -- 질문번호
FOREIGN KEY(K_NO) REFERENCES KINS(K_NO) -- 참조
);

create sequence seq_rpl_num;
