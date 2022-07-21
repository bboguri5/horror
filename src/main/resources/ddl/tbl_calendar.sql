
CREATE SEQUENCE seq_tbl_calendar;
DROP SEQUENCE seq_tbl_calendar;

DROP TABLE tbl_calendar;
CREATE TABLE tbl_calendar (
    calendar_no NUMBER(10)
    , reg_date DATE DEFAULT SYSDATE
    , channel VARCHAR2(20) NOT NULL
    , genre VARCHAR2(20) NOT NULL
    , title VARCHAR2(20) NOT NULL
    , id VARCHAR2 (20)
    , CONSTRAINT pk_tbl_calendar PRIMARY KEY (calendar_no)
);

SELECT *
FROM tbl_calendar
;