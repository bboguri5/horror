package com.project.horror.recommend.repository;

import com.project.horror.recommend.domain.RecBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RecMapperTest {

    @Autowired
    RecMapper mapper;

    @Test
    @DisplayName("추천 게시글이 등록 되어야 한다.")
    void saveTest(){
        RecBoard b = new RecBoard();
        b.setWriter("작성자 테스트");
        b.setContent("내용 테스트 입력");
        b.setImg("이미지 테스트 입력");
        b.setTitle("제목 테스트 입력");

        mapper.save(b);
    }

    @Test
    @DisplayName("특정 게시물이 삭제 되어야 한다.")
    @Transactional
    @Rollback
    void removeTest(){
        mapper.remove(10001L);
    }

    @Test
    @DisplayName("특정 게시물이 수정 되어야 한다.")
    void modify(){

        RecBoard newb = new RecBoard();

        newb.setBoardNo(10001L);
        newb.setTitle("수정테스트제목");
        newb.setContent("수정테스트내용");
        newb.setWriter("수정호러킹");

        boolean flag = mapper.modify(newb);

        System.out.println(flag);
    }

    @Test
    @DisplayName("전체 게시물가 조회 되어야 한다.")
    void getTotalCountTest(){
        int totalCount = mapper.getTotalCount();

        assertEquals(3,totalCount);
    }

    @Test
    @DisplayName("상세조회된 게시물의 조회수를 상승 시켜야 한다.")
    void upViewCountTest(){
        mapper.upViewCount(10001L);

    }

    @Test
    @DisplayName("전체 추천 게시물을 조회해줘야 한다.")
    void findAllTest(){
        List<RecBoard> all = mapper.findAll();
        all.forEach(System.out::println);
    }

    @Test
    @DisplayName("특정 게시물을 조회해줘야 한다.")
    void findOne(){
        RecBoard one = mapper.findOne(10001L);
        System.out.println(one);
    }



}