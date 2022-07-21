package com.project.horror.repository;

import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.service.HorrorSpotService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

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