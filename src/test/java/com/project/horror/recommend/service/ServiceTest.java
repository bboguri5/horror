package com.project.horror.recommend.service;

import com.project.horror.recommend.domain.RecBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RecServiceTest {

    @Autowired
    RecService service;

    @Test
    @DisplayName("게시물이 등록 되어야 한다.")
    void serviceSaveTest1(){

        RecBoard b = new RecBoard();
        for (int i = 0; i < 30; i++) {
            b.setTitle("제목"+i+"  #드라마"+i);
            b.setWriter("양재영");
            b.setContent("내용"+i);
            b.setImg("https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi1.sndcdn.com%2Fartworks-MpLaNf6zO1NnznMu-klY5EQ-t500x500.jpg&type=a340");

            service.saveService(b);
        }
    }

//    @Test
//    @DisplayName("전체 게시물을 조회 해야 한다.")
//    void findAllTest(){
//        Map<String, Object> allService = service.findAllService();
//        Object bList = allService.get("bList");
//
//        System.out.println(bList);
//    }
//
//    @Test
//    @DisplayName("특정 게시물을 조회 해야 한다.")
//    void findOneServiceTest(){
//
//        RecBoard board = service.findOneService(10001L);
//        System.out.println(board);
//    }

    @Test
    @DisplayName("특정 게시물을 삭제 해야 한다.")
    @Transactional
    @Rollback
    void removeServiceTest(){
        service.removeService(10001L);
    }

//    @Test
//    @DisplayName("특정 게시물을 수정해야 한다.")
//    void modifyServiceTest(){
//        RecBoard oneService = service.findOneService(10001L);
//        oneService.setTitle("서비스수정제목");
//        oneService.setImg("서비스 수정 이미지");
//
//        service.modifyService(oneService);
//
//
//    }






}