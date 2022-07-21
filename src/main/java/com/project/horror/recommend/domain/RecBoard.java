package com.project.horror.recommend.domain;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class RecBoard {

    private Long boardNo;
    private String writer;
    private String title;
    private String img;
    private String content;
    private Long viewCnt;
    private Long goodCnt;
    private Date regDate;
    private String id;

}
