package com.project.horror.recommend.repository;

import com.project.horror.recommend.common.paging.RecPage;
import com.project.horror.recommend.common.search.RecSearch;
import com.project.horror.recommend.domain.RecBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecMapper {

    // 게시글 쓰기 기능
    boolean save(RecBoard board);

    // 게시글 전체 조회
//    List<RecBoard> findAll();

    List<RecBoard> findAll(RecSearch search);

    // 게시글 전체 조회 with search
//    List<RecBoard> findAll2(RecSearch search);

    // 게시글 상세 조회
    RecBoard findOne(Long boardNo);

    // 게시글 삭제
    boolean remove(Long boardNo);

    // 게시글 수정
    boolean modify(RecBoard board);

    // 전체 게시물 수 조회
    int getTotalCount(RecSearch search);
//    int getTotalCount(RecSearch search);

    // 조회수 상승 처리
    void upViewCount(Long boardNo);

    // 좋아요 상승 처리
    boolean upGoodCount(Long boardNo);
}
