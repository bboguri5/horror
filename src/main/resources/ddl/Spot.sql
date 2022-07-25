CREATE SEQUENCE seq_spot_Board;
DROP SEQUENCE seq_spot_Board;

DROP TABLE tbl_spot_Board;
CREATE TABLE tbl_spot_Board (
    id varchar2(20) ,
    spot_no number(20) PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    country VARCHAR2(50) NOT NULL,
    address VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000),
    like_cnt NUMBER(10) DEFAULT 0
);


INSERT INTO tbl_spot_Board (
        spot_no,
        title,
        country,
        address,
        content) VALUES
(3 || LPAD(seq_spot_Board.nextval, 4, '0')
,'곤지암'
,'한국'
,'경기도 광주시 곤지암읍 신대리 114',
'진짜 무서운곳이다...ㄷㄷㄷ');
commit;
 select * from tbl_spot_Board ;

 ALTER TABLE tbl_spot_board MODIFY(title VARCHAR2(50)); -- 컬럼 사이즈변경