package com.project.horror.horrorSpotBoard.domain;

import lombok.*;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Spot {

    private int spotNo;
    private String title;
    private String country;
    private String address;
    private String content;
    private int likeCnt;

}
