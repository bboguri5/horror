package com.project.horror.calendar.domain;

import lombok.*;

import java.util.Date;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class Calendar {

    // 테이블 컬럼 필드

    private Long calendarNo;
    private Date regDate;
    private String channel;
    private String genre;
    private String title;
    private String id;
    private String content;
}
