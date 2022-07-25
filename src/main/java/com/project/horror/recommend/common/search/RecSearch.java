package com.project.horror.recommend.common.search;

import com.project.horror.recommend.common.paging.RecPage;
import lombok.*;

@Setter
@Getter
@ToString
public class RecSearch extends RecPage {


    private String type;  // 검색 조건
    private String keyword; // 검색 키워드

    public RecSearch(String type, String keyword) {
        super();
        this.type = type;
        this.keyword = keyword;
    }

}




