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

    private String likeCnt;


    private String shortContent;
    private String shortAddress;
    private String shortTitle;

    public Spot(String title, String country, String address, String content) {
        this.title = title;
        this.country = country;
        this.address = address;
        this.content = content;
    }
}
