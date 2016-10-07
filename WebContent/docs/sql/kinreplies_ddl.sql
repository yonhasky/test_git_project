CREATE TABLE KINREPLIES (
KR_NO	number(10) primary key, -- 답변 번호
KR_TITLE	varchar2(100) not null, -- 답변 제목 
KR_AUTHOR	varchar2(20) not null, -- 답변 작성자
KR_DATE	varchar2(15) not null, -- 답변 작성일
KR_CONTENT	varchar2(1000) not null, -- 답변 작성내용
KR_RECOMMENDS	number(10) not null, -- 답변 추천수
KR_FILE1	varchar2(100), -- 답변 파일1
KR_FILE2	varchar2(100), -- 답변 파일2
KR_CONFIRM	varchar2(1)	not null, -- 답변 선택 여부(T 답변 선택, F 답변 미선택)
K_NO	number(10)  not null, -- 질문번호
FOREIGN KEY(K_NO) REFERENCES KINS(K_NO) -- 참조
);