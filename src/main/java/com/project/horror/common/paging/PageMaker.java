package com.project.horror.common.paging;

import com.project.horror.common.paging.Page;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Setter
@Getter
@ToString
@Log4j2
public class PageMaker {

    private static final int PAGE_COUNT = 10;

    private int beginPage, endPage;

    private boolean prev, next;

    private Page page;

    private int totalCount ;
    public PageMaker(Page page ,int totalCount) {
        this.page = page;
        this.totalCount = totalCount;
        makePageInfo();
    }

    private void makePageInfo()
    {
        this.endPage = (int) Math.ceil(page.getPageNum() / (double)  PAGE_COUNT) * PAGE_COUNT;

        this.beginPage = endPage - PAGE_COUNT + 1;
        int realEnd = (int) Math.ceil((double) totalCount/page.getAmount());
        log.info("realEnd {} ", realEnd);
        log.info("endPage {} ",endPage);
        if(realEnd < endPage)
        {
            this.endPage = realEnd;
        }

        log.info("endPage {} ",endPage);

        this.prev = beginPage>1;

        this.next = endPage < realEnd;

    }
}

