package com.project.horror.repository;

import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.service.HorrorSpotService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class HorrorSpotMapperTest {


    @Autowired
    private HorrorSpotService spotService;

    @Test
    void selectAllTest()
    {
        List<Spot> spots = spotService.selectAll();
        System.out.println(spots);
    }
}