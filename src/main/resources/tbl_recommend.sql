CREATE SEQUENCE seq_tbl_recommend;

DROP TABLE tbl_recommend;

CREATE TABLE tbl_recommend (
    board_no NUMBER(10),
    writer VARCHAR2(20) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    img VARCHAR2(200),
    content CLOB,
    view_cnt NUMBER(10) DEFAULT 0,
    good_cnt NUMBER(10) DEFAULT 0,
    reg_date DATE DEFAULT SYSDATE,
    id VARCHAR(20),
    CONSTRAINT pk_tbl_recommend PRIMARY KEY (board_no));

    INSERT INTO tbl_recommend
    (board_no, writer, title, img, content)
    VALUES (1 || LPAD(seq_tbl_recommend.nextval, 4, '0'), '작성자', '제목', '이미지', '내용')

