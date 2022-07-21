package com.project.horror.repository;

import com.project.horror.horrorSpotBoard.domain.Spot;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HorrorSpotMapper {

    List<Spot> selectAll(); // 스팟 모든 정보 조회 - 게시글목록
    Spot selectOne(); // 특정 스팟 정보 조회 - 게시글자세히
}
