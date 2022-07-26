package com.project.horror.login.service;

import com.project.horror.horrorSpotBoard.domain.Member;
import com.project.horror.login.repository.LoginMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
@Log4j2
@RequiredArgsConstructor
public class LoginService {
    private final LoginMapper loginMapper;

    public boolean login(HttpServletRequest request,
                              String id, String pwd) {
        log.info(" login -> id = {} pwd = {}", id, pwd);
        if (id.equals("admin") && pwd.equals("1234")) { // 관리자일 경우
            makeSession(request, id);
            return true;
        }

        // 일반 유저일경우
        int loginResult = loginMapper.checkLogin(id,pwd);
        if (loginResult==0) {
            return false;
        }

        log.info(" 일반 user : {}", id);
        makeSession(request, id);

        return true;
    }

    public boolean checkId(String id)
    {
        log.info( " checkId : {} ",id);
        return loginMapper.checkID(id)>0;
    }

    public  boolean saveSignUpInfo(Member member)
    {
        log.info(" saveSignUpInfo : {}",member);
        return loginMapper.saveSignUpInfo(member);
    }


    private void makeSession(HttpServletRequest request, String id) {
        HttpSession session = request.getSession(false);
        log.info(" makeSession session : {}", session);

        if (session != null) {
            if (id.equals("admin")) { // 관리자
                session.setAttribute("flag", true);
                session.setMaxInactiveInterval(10800);
            }
            else { // 일반유저
                session.setAttribute("user",id);
                session.setMaxInactiveInterval(10800);
                log.info(" id session : {} ",session.getId());
            }
        }
    }

}
