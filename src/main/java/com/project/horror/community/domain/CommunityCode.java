package com.project.horror.community.domain;

import lombok.*;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class CommunityCode {

    // table column field
    private String codeGroup;
    private String code;
    private String codeNm;
    private int sort;

    // custom data field
}
