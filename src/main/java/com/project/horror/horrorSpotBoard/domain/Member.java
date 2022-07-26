package com.project.horror.horrorSpotBoard.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private String id;
    private String pwd;
    private String name;
    private String birth;
    private String email;
}
