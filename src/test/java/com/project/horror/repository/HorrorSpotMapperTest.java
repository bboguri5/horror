package com.project.horror.repository;

import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.repository.HorrorSpotMapper;
import com.project.horror.horrorSpotBoard.service.HorrorSpotService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class HorrorSpotMapperTest {
    @Autowired
    private HorrorSpotMapper mapper;

    @Test
    void selectAllTest()
    {
//        List<Spot> spots = spotService.selectAll();
//        System.out.println(spots);
    }
    @Test
    void deleteTest()
    {
        boolean result = mapper.delete(30058);
        System.out.println(result);
    }

    @Test
    void saveTest()
    {
        for (int i = 0; i < 30 ; i++) {
           mapper.save(new Spot("title" + i,"한국","서울 금천구 디지털로 130 남성프라자 1007호","SL 아카데미"));
        }
    }
}