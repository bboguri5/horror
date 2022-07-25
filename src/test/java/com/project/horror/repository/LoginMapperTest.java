package com.project.horror.repository;

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
        int result = loginMapper.checkPWD("pwd1");
        System.out.println(result);
    }
}