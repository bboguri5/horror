package com.project.horror.service;

import com.project.horror.repository.LoginMapper;
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

    public boolean checkLogin(HttpServletRequest request,
                              String id, String pwd) {
        log.info(" checkLogin -> id = {} pwd = {}", id, pwd);
        if (id.equals("admin") && pwd.equals("1234")) { // 관리자일 경우
            makeSession(request, id);
            return true;
        }

        // 일반 유저일경우
        int userId = loginMapper.checkID(id), userPwd = loginMapper.checkPWD(pwd);
        if (!((userId == 1) && (userPwd == 1))) {
            return false;
        }
        makeSession(request, id);

        return true;
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
