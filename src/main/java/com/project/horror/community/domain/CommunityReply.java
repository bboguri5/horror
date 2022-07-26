package com.project.horror.community.domain;

import lombok.*;

import java.util.Date;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class CommunityReply {

    // table column field
    private long boardNo; // table NUMBER(10) -> long
    private long replyNo;
    private String content;
    private String id;
    private long upReplyNo;
    private String regDate; // 등록일자

    // custom data field
}
