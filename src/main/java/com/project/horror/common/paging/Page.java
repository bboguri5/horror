package com.project.horror.common.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
@AllArgsConstructor
public class Page {


    private int pageNum; // 페이지 번호
    private int amount; // 한 페이지당 배치할 게시물 수

    private String target;

    public Page()
    {
        this.pageNum = 1;
        this.amount = 10; // 게시글
    }

    public Page(int i, int i1) {
        this.pageNum = i;
        this.amount= i1;
    }

    public void setPageNum(int pageNum) {
        if(pageNum <= 0 || pageNum > Integer.MAX_VALUE){
            // pageNum이 0 이하이거나 최대값 이상일 경우 pageNum 1로 강제로 돌려줌
            this.pageNum = 1;
            return;
        }
        this.pageNum = pageNum;
    }

    public void setAmount(int amount) {

        if(amount < 10 || amount > 100)
        {
            this.pageNum = 10;
            return;
        }
        this.amount = amount;
    }
}
