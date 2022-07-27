package com.project.horror.repository;

import com.project.horror.common.search.Search;
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
        List<Spot> spots = mapper.selectAll(new Search());
        System.out.println(spots);
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
        for (int i = 0; i < 100; i++) {
            mapper.save(new Spot("SL아카데미","한국","서울특별시 금천구 가산동 345-30 남성프라자","우리학원"));
        }
    }

}