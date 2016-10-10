CREATE TABLE KINREPLIES (
KR_NO	number(10) primary key, -- 답변 번호
KR_TITLE	varchar2(100) not null, -- 답변 제목 
KR_AUTHOR	varchar2(20) not null, -- 답변 작성자
KR_DATE	varchar2(15) not null, -- 답변 작성일
KR_CONTENT	varchar2(1000) not null, -- 답변 작성내용
KR_RECOMMENDS	number(10) not null, -- 답변 추천수
KR_FILE1	varchar2(100), -- 답변 파일1
KR_FILE2	varchar2(100), -- 답변 파일2
KR_CONFIRM	varchar2(1)	not null, -- 답변 선택 여부(T 답변, F 답변 미선택)
K_NO	number(10)  not null, -- 질문번호
FOREIGN KEY(K_NO) REFERENCES KINS(K_NO) -- 참조
);

INSERT INTO kinreplies VALUES(1,'답변입니다','user02','2016/09/12','단순한 방식으로 진행하세요~',0,null,null,'F',1);
INSERT INTO kinreplies VALUES(2,'이메일 주세요','user03','2016/09/13','lkl0309@naver로 이메일 주세요~',0,null,null,'T',1);
INSERT INTO kinreplies VALUES(3,'답변','user03','2016/09/11','그 프로젝트에서 자주 있는 문제입니다.',0,null,null,'F',2);
INSERT INTO kinreplies VALUES(4,'이렇게 해보세요!','blueprint','2016/09/13','다음 사이트를 참고하세요~ www.naver.com',0,null,null,'T',2);
INSERT INTO kinreplies VALUES(5,'스터디 작성 관련 답변','kang0114','2016/09/17','사이트 로그인 후 스터디 메뉴에 들어가시면 작성 가능합니다.',0,null,null,'F',6);
INSERT INTO kinreplies VALUES(6,'답변','user03','2016/09/14','멘토링 메뉴에 있어요~',0,null,null,'F',7);
INSERT INTO kinreplies VALUES(7,'멘토링 신청 이렇게 하세요.','blueprint','2016/09/16','사이트 로그인 후 멘토라면 멘토링 메뉴에서 누구나 신청가능합니다.',0,null,null,'T',7);
INSERT INTO kinreplies VALUES(8,'답변','user03','','',0,null,null,'F',8);
INSERT INTO kinreplies VALUES(9,'저도 해당문제가 있었습니다.','blueprint','','',0,null,null,'T',8);
INSERT INTO kinreplies VALUES(10,'답변','bluesky','','본인이 작성한 글을 확인하시면 있습니다.',0,null,null,'F',9);