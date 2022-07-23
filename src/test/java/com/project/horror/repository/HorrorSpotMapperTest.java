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
        boolean result = mapper.save(new Spot("asdf","asdf","sdaf","asdfasdf"));
        System.out.println(result);
    }
}