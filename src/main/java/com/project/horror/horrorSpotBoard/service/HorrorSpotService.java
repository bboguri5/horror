package com.project.horror.horrorSpotBoard.service;

import com.project.horror.common.paging.Page;
import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.repository.HorrorSpotMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class HorrorSpotService {
    private final HorrorSpotMapper spotMapper;

    public Map<String, Object> selectAll(Page page) {
        log.info("selectAll service start");

        Map<String, Object> findDataMap = new HashMap<>();
        findDataMap.put("spotList", spotMapper.selectAll(page));
        findDataMap.put("tc", spotMapper.getTotalCount());

        return findDataMap;
    }

    public Spot selectOne(int spotNo) {
        log.info("selectOne service start");
        return spotMapper.selectOne(spotNo);
    }

    public boolean modify(Spot spot)
    {
        log.info("modify service start");
        return spotMapper.modify(spot);
    }

    public boolean delete(int spotNo)
    {
        return spotMapper.delete(spotNo);
    }

    public boolean save(Spot spot)
    {
        log.info(" save : {} ",spot);
        return spotMapper.save(spot);
    }

    public boolean checkLogin(
            HttpServletRequest request,
            String id, String pwd) {
        log.info("checkLogin service start");
        if (!(id.equals("admin") && pwd.equals("1234"))) {
            return false;
        }

        HttpSession session = request.getSession(false);
        log.info(" service session : {}" ,session);

        if(session!= null)
        {
            session.setAttribute("flag", true);
            session.setMaxInactiveInterval(10800);
        }

        return true;
    }

    private void makeLoginCookie(HttpServletResponse response, HttpServletRequest request) {
        Cookie foundCookie = WebUtils.getCookie(request, "flag");
        if (foundCookie == null) {

            Cookie cookie = new Cookie("flag", "true");
            cookie.setMaxAge(60 * 60);
            cookie.setPath("/horror/spot");

            response.addCookie(cookie); // 클라이언트에 쿠키 전송
        }
    }


}
