package com.project.horror.repository;

import com.project.horror.horrorSpotBoard.domain.Member;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface LoginMapper {

    int checkID(String id);
    int checkPWD(String pwd);
    boolean saveSignUpInfo(Member member);
}
