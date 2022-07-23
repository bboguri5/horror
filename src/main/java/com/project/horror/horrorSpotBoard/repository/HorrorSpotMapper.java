package com.project.horror.horrorSpotBoard.repository;

import com.project.horror.common.paging.Page;
import com.project.horror.horrorSpotBoard.domain.Spot;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HorrorSpotMapper {

    List<Spot> selectAll(Page page); // 스팟 모든 정보 조회 - 게시글목록
    Spot selectOne(int spoNo); // 특정 스팟 정보 조회 - 게시글자세히
    boolean modify(Spot spot); // 수정
    boolean delete(int spotNo); // 삭제
    boolean save(Spot spot); // 저장 
    int getTotalCount(); // 총 게시글 갯수
}
