CREATE TABLE STUDIES (
ST_NO	number(10) primary key, -- ���͵� ��ȣ
ST_TITLE	varchar2(100) not null, -- ����
ST_AUTHOR	varchar2(20) not null, -- �ۼ���
ST_DATE		varchar2(15) not null, -- ���͵� �����
ST_PERIOD       varchar2(30) not null, -- ����Ⱓ(2016-03-09 ~ 2016-09-09)
ST_OVERVIEW	varchar2(100) not null, -- ���͵� ����
ST_CONTENT	varchar2(1000) not null, -- ���͵� ����
ST_FILE1	varchar2(100), -- ����1
ST_FILE2	varchar2(100), -- ����2
ST_HIT		number(10) not null, -- ��ȸ��
ST_STATUS	varchar2(1) not null -- ���͵� ������Ȳ ( A: ��û , P : ���� , T : ���� )
);

-- 1. ���͵� ��� SQL
INSERT INTO studies VALUES(12, 'JAVA ���͵� �����մϴ�.', 'user01', to_char(sysdate,'yyyy/MM/dd'), concat(to_char(sysdate,'yyyy/MM/dd ~ '),to_char(sysdate+60,'yyyy/MM/dd')), 'JAVA �������� ����', 'JAVA ���� �⺻ ���� �� �ұԸ� ������Ʈ �����ϽǺ� ���մϴ�.', '', '', 0, 'A');

-- 2. ���͵� ��ü ��ȸ SQL
SELECT * FROM studies;

-- 3. ���͵� �� ��ȸ SQL
SELECT * FROM studies WHERE st_no=1;

-- 4. ���͵� ���� SQL
UPDATE studies
SET st_title='C��� ���͵� �����մϴ�', ST_DATE=to_char(sysdate,'yyyy/MM/dd'), st_overview='C��� �������� ����', st_content='C��� ���� �⺻ ���� �� �ұԸ� ������Ʈ �����ϽǺ� ���մϴ�.', st_file1='', st_file2='', ST_STATUS='T'
WHERE st_no=1;

-- 5. ���͵� ���� SQL
DELETE 
FROM studies
WHERE st_no=1;

select * from studies;

