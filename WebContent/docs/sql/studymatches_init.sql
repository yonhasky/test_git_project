CREATE TABLE STUDYMATCHES (
STM_NO	number(10) primary key,
STM_HOST	varchar2(20) not null,	-- 스터디 주최자
STM_ENTRY	varchar2(20) not null,	-- 스터디 참가자           
STM_ENTRY_COMMENT	varchar2(100) not null,    -- 스터디 참가 신청 한마디
STM_ENTRY_DATE	varchar2(15) not null,       -- 스터디 신청일
STM_ENTRY_STATUS	varchar2(1) not null,    -- 스터디 신청 허락/거절 여부 (허락 : A, 거절: D)
ST_NO	number(10) not null,
FOREIGN KEY(ST_NO) REFERENCES STUDIES(ST_NO)
); 


INSERT INTO studies VALUES(2, '토익 스터디 함께 하실분~', 'user02', '2016/08/20', '2016-09-20 ~ 2016-10-30', '기초 영문법 및 어휘 학습목적', '기초 영문법 및 어휘공부 함께 하실분 찾습니다.', '', '', 0, 'P');
INSERT INTO studies VALUES(5, 'Javascript 공부 하실분!', 'user01', '2016/08/10', '2016-09-10 ~ 2016-12-31', 'Javascript 기초 이해', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(7, '한식 요리사 자격증 준비하실 분', 'kang0114', '2016/09/14', '2016-09-20 ~ 2016-12-31', '한식 요리사 자격증 준비', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(8, '단기 공무원 스터디 하실 분', 'bluesky', '2016/09/17', '2016-09-10 ~ 2016-12-31', '단기 공무원 공부', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(9, '기사시험 함께 준비하실 분', 'blueprint', '2016/09/20', '2016-09-10 ~ 2016-12-31', '기사시험 요약 및 시험문제 풀이', 'Client 기술에 대해 함께 공부하실분 찾아요~', '', '', 0, 'P');
INSERT INTO studies VALUES(11, '취업 스터디 개최합니다.', 'user02', '2016/09/18', '2016-10-01 ~ 2016-12-31', '취업 준비생 스터디', '취업 스터디 함께 하실분 찾습니다!', '', '', 0, 'P');

INSERT INTO STUDYMATCHES VALUES(1, 'user02', 'user03', '잘부탁드립니다. 열심히 하겠습니다!', '2016/08/27', 'A', 2);
INSERT INTO STUDYMATCHES VALUES(2, 'user01', 'user03', '잘부탁드립니다. 열심히 하겠습니다!', '2016/08/25', 'A', 5);
INSERT INTO STUDYMATCHES VALUES(3, 'kang0114', 'user01', '잘부탁드립니다. 열심히 하겠습니다!', '2016/08/25', 'A', 7);
INSERT INTO STUDYMATCHES VALUES(4, 'bluesky', 'user02', '잘부탁드립니다. 열심히 하겠습니다', '2016/09/25', 'A', 8);
INSERT INTO STUDYMATCHES VALUES(5, 'blueprint', 'kim3821', '잘부탁드립니다. 열심히 하겠습니다', '2016/09/21', 'A', 9);
INSERT INTO STUDYMATCHES VALUES(6, 'user02', 'bluesky', '잘부탁드립니다. 열심히 하겠습니다', '2016/09/24', 'A', 11);
INSERT INTO STUDYMATCHES VALUES(7, 'user01', 'kang0114', '잘부탁드립니다. 열심히 하겠습니다!', '2016/09/01', 'D', 5);
INSERT INTO STUDYMATCHES VALUES(8, 'kang0114', 'user02', '잘부탁드립니다. 열심히 하겠습니다!', '2016/09/16', 'D', 7);
INSERT INTO STUDYMATCHES VALUES(9, 'bluesky', 'blueprint', '잘부탁드립니다. 열심히 하겠습니다!', '2016/09/28', 'D', 8);
INSERT INTO STUDYMATCHES VALUES(10, 'blueprint', 'bluesky', '잘부탁드립니다. 열심히 하겠습니다!', '2016/09/27', 'D', 9);
INSERT INTO STUDYMATCHES VALUES(11, 'user02', 'user04', '잘부탁드립니다. 열심히 하겠습니다!', '2016/09/30', 'D', 11);

commit;
