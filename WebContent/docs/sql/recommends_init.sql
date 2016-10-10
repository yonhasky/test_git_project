CREATE TABLE RECOMMENDS (
R_NO	number(10) primary key, -- 건의 사항 번호
R_TITLE		varchar2(100) not null, -- 건의 제목
R_CONTENT	varchar2(1000) not null, -- 건의 내용
R_AUTHOR	varchar2(20) not null, -- 건의자
R_DATE		varchar2(15) not null, -- 건의 등록일
R_TYPE    varchar2(1) not null, -- 건의사항 유형 S - 사이트 이용관련 , B - 버그, F - 기능추가
R_FILE1   varchar2(100), -- 건의사항 파일1
R_FILE2   varchar2(100), -- 건의사항 파일2
R_HIT   number(10) not null -- 건의사항 조회수
);

 delete from RECOMMENDS;
truncate table RECOMMENDS;

drop sequence seq_RECOMMENDS;
create sequence seq_RECOMMENDS;



INSERT INTO recommends VALUES(1, '사이트 이용 버그', '사이트 이용하면서 버그가 발생했습니다.', 'user01', '2016/09/01', 'B', '', '', 2);
INSERT INTO recommends VALUES(2, '멘토링 신청이 제대로 되지 않습니다.', '멘토링 신청에 다음과 같은 문제가 발생했습니다.', 'user02', '2016/09/07', 'S', '', '', 2);
INSERT INTO recommends VALUES(3, '멘토링 신청 버그', '멘토링 신청에 다음과 같은 버그가 발생했습니다.', 'user03', '2016/09/18', 'B', '', '', 2);
INSERT INTO recommends VALUES(4, '스터디 버그', '스터디 신청에 다음과 같은 버그가 발생했습니다.', 'user03', '2016/09/20', 'B', '', '', 2);
INSERT INTO recommends VALUES(5, '스터디 목록 이용', '스터디 이용에 다음과 같은 버그가 발생했습니다.', 'user04', '2016/09/21', 'B', '', '', 2);
INSERT INTO recommends VALUES(6, '아이디어 건의', '선후배간 맛집추천해주는 공간이 있었으면 좋겠습니다.', 'user04', '2016/09/09', 'F', '', '', 2);
INSERT INTO recommends VALUES(7, '멘토링 버그', '멘토링 기능 중 다음과 같은 오류가 발생했습니다.', 'kang0114', '2016/09/08', 'B', '', '', 2);
INSERT INTO recommends VALUES(8, '사이트 이용 오류', '사이트 이용 중 다음과 같은 오류가 발생했습니다.', 'bluesky', '2016/09/28', 'S', '', '', 2);
INSERT INTO recommends VALUES(9, '이런 컨텐츠를 원합니다.', '학생들간에 대화가 가능한 채팅기능이 있었으면 좋겠습니다.', 'blueprint', '2016/10/01', 'F', '', '', 2);
INSERT INTO recommends VALUES(10, '멘토링 이용 버그', '멘토링 이용 중 다음과 같은 오류가 발생했습니다.', 'kim3821', '2016/09/22', 'B', '', '', 2);
INSERT INTO recommends VALUES(11, '멘토링 신청이 제대로 등록되지 않습니다.', '사이트에 문제가 있는 것 같습니다. 확인 부탁드립니다.', 'kang0114', '2016/09/26', 'B', '', '', 2);

commit;

select * from RECOMMENDS;
