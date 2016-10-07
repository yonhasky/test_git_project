CREATE TABLE NOTES(
N_NO number(10) primary key, -- 쪽지 번호
N_SENDER varchar2(20) not null, -- 쪽지 송신자
N_RECEIVER varchar2(20) not null, -- 쪽지 수신자
N_TITLE varchar2(100) not null, -- 쪽지 제목
N_CONTENT varchar2(200) not null, -- 쪽지 내용
N_DATE varchar2(15) not null, -- 쪽지 등록일
N_STATUS varchar2(1) not null, -- 쪽지 확인 여부(T:읽음 F:읽지 않음)
FOREIGN KEY(N_RECEIVER) REFERENCES STUDENTS(ID)
);