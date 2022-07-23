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
import java.util.List;
import java.util.Map;


interface anyCls{
    void anyFun(Spot spot);
}

@Service
@Log4j2
@RequiredArgsConstructor
public class HorrorSpotService {
    private final HorrorSpotMapper spotMapper;

    public Map<String, Object> selectAll(Page page) {
        log.info("selectAll service start");

        Map<String, Object> findDataMap = new HashMap<>();
        List<Spot> spots = spotMapper.selectAll(page);

        processConverting(spots);

        findDataMap.put("spotList",spots);
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

    private void processConverting(List<Spot> SpotList) {

        for (Spot s : SpotList) {
            substringAddress(s);
            substringContent(s);
        }
    }

    private void substringTitle(Spot spot)
        {
            String title = spot.getTitle();
            if (title.length() > 10) {
                String subStr = title.substring(0, 10);
                spot.setShortTitle(subStr + "...");
                log.info(spot.getShortTitle());
            } else {
                spot.setShortTitle(title);
                log.info(spot.getShortTitle());

            }
    }

    private void substringAddress(Spot spot)
    {
        String address = spot.getAddress();
        log.info(address.length());
        if (address.length() > 10) {
            String subStr = address.substring(0, 10);
            spot.setShortAddress(subStr + "...");
            log.info(spot.getShortAddress());
        } else {
            spot.setShortAddress(address);
            log.info(spot.getShortAddress());

        }
    }

    private void substringContent(Spot spot)
    {
        String content = spot.getContent();
        if (content.length() > 30) {
            String subStr = content.substring(0, 30);
            spot.setShortContent(subStr + "...");
        } else {
            spot.setShortContent(content);

        }
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



}
