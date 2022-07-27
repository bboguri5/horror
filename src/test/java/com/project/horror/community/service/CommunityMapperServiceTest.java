package com.project.horror.community.service;

import com.project.horror.community.domain.CommunityBoard;
import com.project.horror.community.repository.CommunityMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CommunityMapperServiceTest {

    @Autowired
    private CommunityMapper mapper;
    @Test
    void saveServiceTest() {

        for (int i = 0; i < 30; i++) {
            mapper.save(new CommunityBoard("아무개"+i,"아무말이나하자"+i,"아무말"+i,"C","jungah"));
        }
    }
}