package com.project.horror.recommend.common.paging;

import com.project.horror.recommend.common.search.RecSearch;
import com.project.horror.recommend.repository.RecMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RecPageMakerTest {

    @Autowired
    RecMapper mapper;

    @Test
    void pageInfoTest(){
        int totalCount = mapper.getTotalCount(new RecSearch("title","드라마"));
        RecPageMaker pm = new RecPageMaker(new RecPage(12, 5), totalCount);

        System.out.println(pm);

    }

}