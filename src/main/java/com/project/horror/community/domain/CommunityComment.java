package com.project.horror.community.domain;

import lombok.*;

import java.util.Date;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class CommunityComment {

    private long boardNo;   // 게시글 번호
    private long commentNo;   // 댓글 번호

    private String writer;  // 작성자
    private String content; // 내용
    private String id;      // 아이디
    private Date regDate;   // 등록일자

//    private long likeCnt;

}
