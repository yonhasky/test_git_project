CREATE TABLE MENTOMATCHES (
MM_NO number(10) primary key, -- 멘토링 매칭 번호
MM_HOST		varchar2(20) not null, -- 멘토링 주최자
MM_ENTRY 	varchar2(20) not null, -- 멘토링 참가자
MM_ENTRY_COMMENT	varchar2(100) not null, -- 멘토링 참가 신청 한마디
MM_ENTRY_DATE 		varchar2(15) not null, -- 신청일
MM_ENTRY_STATUS		varchar2(1) not null, -- 멘토링 신청 허락/거절 여부
M_NO 		number(10) not null,
FOREIGN KEY(M_NO) REFERENCES MENTORINGS(M_NO)
);


INSERT INTO mentorings VALUES(1,'IoT 사물인터넷 프로젝트', 'user01', '2016/09/12', '2016-10-30 ~ 2016-12-21', 'IoT관련 프로젝트', 'MANGO Board 및 LINUX 관련 지식을 갖춘 개발자를 찾습니다.', '', '', 10, 'A');
INSERT INTO mentorings VALUES(2,'맛집 소개 어플리케이션', 'user02', '2016/09/17', '2016-09-25 ~ 2016-12-31', '안드로이드 어플리케이션 관련 프로젝트', '안드로이드 개발 관련 공부를 하며 함께 맛집 소개 어플리케이션을 개발하실분 찾습니다.', '', '', 22, 'P');
INSERT INTO mentorings VALUES(3,'JAVA 관련 멘토링 합니다.','user03','2016/08/15','2016-08-15 ~ 2016-12-31', 'JAVA 관련 기본적인 멘토링', 'JAVA 관련 공부를 하고싶은 분들을 위해 멘토가 되고싶습니다. 최종 프로젝트로 패턴기반 개발을 할 생각입니다.', '', '', 15, 'P');
INSERT INTO mentorings VALUES(4,'영어 관련 멘토링 합니다.','blueprint','2016/08/01','2016-09-15 ~ 2016-12-31', '기초 영문법 관련 기본적인 학습 목적', '영문법 관련 공부를 하고싶은 분들을 위해 멘토가 되고싶습니다. ', '', '', 15, 'P');
INSERT INTO mentorings VALUES(5,'유학 관련 필수지식 멘토구합니다.','bluesky','2016/09/08','2016-10-15 ~ 2016-12-31', '유학에 필요한 내용을 알려줄 멘토', '유학에 필요한 내용을 알려주실 멘토님을 구합니다. 최대한 열심히 배우겠습니다.', '', '', 20, 'A');
INSERT INTO mentorings VALUES(6,'멘토구합니다.','kang0114','2016/09/20','2016-10-20 ~ 2016-12-31', '어떤 분야든 경험을 공유하실 분', '어떤 분야든 삶의 경험을 공유해주실 멘토님 찾습니다. 여러가지 경험을 하며 살고싶습니다..', '', '', 15, 'A');
INSERT INTO mentorings VALUES(7,'남자 간호사 멘토가 되겠습니다.','kim3821','2016/09/11','2016-10-20 ~ 2016-12-31', '남자 간호사 생활에 대해 궁금한 학생들의 멘토가 되고싶습니다.', '남자 간호사 생활에 대해 궁금한 학생들의 멘토가 되고싶습니다.', '', '', 15, 'A');
INSERT INTO mentorings VALUES(8,'임베디드 프로젝트','user01','2016/08/20','2016-08-31 ~ 2016-12-31', '임베디드 기초 학습 및 프로젝트', '임베디드 분야 관련 멘토님 찾습니다. Serial 통신을 통해 여러 모듈을 개발해 올려보고 싶습니다. ', '', '', 35, 'P');
INSERT INTO mentorings VALUES(9,'취업관련 도움을 드리고 싶습니다.','blueprint','2016/09/25','2016-11-01 ~ 2016-12-31', '취업관련 멘토링', '제가 취업을 준비하면서 막막하던 때가 생각나 후배님들에게 작은 도움이 되고자 멘토가 되어보려고 합니다.', '', '', 15, 'A');
INSERT INTO mentorings VALUES(10,'스키 멘토님 구합니다.','user03','2016/08/27','2016-08-01 ~ 2016-12-31', '남자 간호사 생활에 대해 궁금한 학생들의 멘토가 되고싶습니다.', '남자 간호사 생활에 대해 궁금한 학생들의 멘토가 되고싶습니다.', '', '', 15, 'P');

INSERT INTO mentomatches VALUES(1,'user01','user02','참가신청 합니다. 열심히 하겠습니다.','2016/09/31','A', 1);
INSERT INTO mentomatches VALUES(2,'user02','user01','참가신청 합니다. 열심히 하겠습니다.','2016/09/21','D', 2);
INSERT INTO mentomatches VALUES(3,'user03','user04','참가신청 합니다. 열심히 하겠습니다.','2016/09/15','A', 3);
INSERT INTO mentomatches VALUES(4,'blueprint','user04','참가신청 합니다. 열심히 하겠습니다.','2016/09/20','A', 4);
INSERT INTO mentomatches VALUES(5,'kim3821','user01','참가신청 합니다. 열심히 하겠습니다.','2016/09/22','A', 7);
INSERT INTO mentomatches VALUES(6,'user03','bluesky','참가신청 합니다. 열심히 하겠습니다.','2016/09/07','D', 10);
INSERT INTO mentomatches VALUES(7,'user02','kim3821','참가신청 합니다. 열심히 하겠습니다.','2016/09/23','D', 2);
INSERT INTO mentomatches VALUES(8,'user03','user02','참가신청 합니다. 열심히 하겠습니다.','2016/08/27','A', 3);
INSERT INTO mentomatches VALUES(9,'blueprint','kang0114','참가신청 합니다. 열심히 하겠습니다.','2016/09/02','A', 4);
INSERT INTO mentomatches VALUES(10,'kim3821','user03','참가신청 합니다. 열심히 하겠습니다.','2016/09/26','A', 7);
INSERT INTO mentomatches VALUES(11,'user03','blueprint','참가신청 합니다. 열심히 하겠습니다.','2016/09/08','D', 10);

