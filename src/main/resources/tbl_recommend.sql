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
    reg_date DATE DEFAULT SYSDATE
    CONSTRAINT pk_tbl_board PRIMARY KEY (board_no)

    (TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(seq_product.nextval, 4, '0')
);