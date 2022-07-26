-- Community board table
CREATE TABLE TBL_COMM_BOARD
(BOARD_NO NUMBER(10,0),
WRITER VARCHAR2(20 BYTE) NOT NULL ENABLE,
CATEGORY VARCHAR2(20 BYTE) NOT NULL ENABLE,
TITLE VARCHAR2(200 BYTE) NOT NULL ENABLE,
CONTENT CLOB,
VIEW_CNT NUMBER(10,0) DEFAULT 0,
LIKE_CNT NUMBER(10,0) DEFAULT 0,
ID VARCHAR2(20 BYTE),
REG_DATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_TBL_COMM_BOARD PRIMARY KEY (BOARD_NO));

-- Community sequence table
CREATE SEQUENCE SEQ_COMM_BOARD  MINVALUE 10001 MAXVALUE 19999 INCREMENT BY 1 START WITH 10001;


-- Community code table
CREATE TABLE TBL_COMM_CODE
(CODE_GROUP VARCHAR2(20 BYTE),
CODE VARCHAR2(20 BYTE),
CODE_NM VARCHAR2(200 BYTE),
SORT NUMBER(10,0) DEFAULT 0,
CONSTRAINT PK_TBL_COMM_CODE PRIMARY KEY (CODE_GROUP, CODE));


-- Community LIKE table
CREATE TABLE TBL_COMM_LIKE
(BOARD_NO NUMBER(10,0),
ID VARCHAR2(20 BYTE),
REG_DATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_TBL_COMM_LIKE PRIMARY KEY (BOARD_NO, ID));


-- Community reply table
CREATE TABLE TBL_COMM_REPLY
(BOARD_NO NUMBER(10,0),
REPLY_NO NUMBER(10,0),
CONTENT VARCHAR2(200 BYTE),
ID VARCHAR2(20 BYTE),
UP_REPLY_NO NUMBER(10,0),
REG_DATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_TBL_COMM_REPLY PRIMARY KEY (BOARD_NO, REPLY_NO));

-- Community reply sequence table
CREATE SEQUENCE  SEQ_COMM_REPLY;

-- Community code table INSERT
INSERT INTO TBL_COMM_CODE (CODE_GROUP,CODE,CODE_NM,SORT) values ('CATEGORY','A','공지사항',1);
INSERT INTO TBL_COMM_CODE (CODE_GROUP,CODE,CODE_NM,SORT) values ('CATEGORY','B','이벤트',2);
INSERT INTO TBL_COMM_CODE (CODE_GROUP,CODE,CODE_NM,SORT) values ('CATEGORY','C','수다',3);
INSERT INTO TBL_COMM_CODE (CODE_GROUP,CODE,CODE_NM,SORT) values ('CATEGORY','D','QnA',4);

commit;