
drop table tbl_login_info;
CREATE TABLE tbl_login_info (
    id varchar2(20) PRIMARY KEY,
    pwd varchar2(20) NOT NULL,
    name varchar2(50) NOT NULL,
    birth varchar2(20) NOT NULL,
    email varchar2(50) NOT NULL
);