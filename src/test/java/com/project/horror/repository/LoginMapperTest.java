package com.project.horror.repository;

import com.project.horror.horrorSpotBoard.domain.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class LoginMapperTest {

    @Autowired
    private LoginMapper loginMapper;

    @Test
    public void checkIDTest()
    {
//        int result = loginMapper.checkLogin("pwd1");
//        System.out.println(result);
    }

    @Test
    public void saveSignUpInfo()
    {
        boolean result = loginMapper.saveSignUpInfo(new Member("id2","pwd2","황","20220125","hahaha@gmail.com"));
        System.out.println(result);
    }
}