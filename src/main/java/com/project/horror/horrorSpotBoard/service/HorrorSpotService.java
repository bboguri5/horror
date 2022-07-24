package com.project.horror.horrorSpotBoard.service;

import com.project.horror.common.paging.Page;
import com.project.horror.common.search.Search;
import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.repository.HorrorSpotMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class HorrorSpotService {
    private final HorrorSpotMapper spotMapper;

    public Map<String, Object> selectAll(Search search) {
        log.info("selectAll service start {} ",search);

        Map<String, Object> findDataMap = new HashMap<>();
        List<Spot> spots = spotMapper.selectAll(search);
        int total = spotMapper.getTotalCount(search);
        processConverting(spots);

        findDataMap.put("spotList",spots);
        findDataMap.put("tc", total);
        log.info("tc {}" , total);

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

    private void substringAddress(Spot spot)
    {
        String address = spot.getAddress();
        if (address.length() > 10) {
            String subStr = address.substring(0, 10);
            spot.setShortAddress(subStr + "...");
        } else {
            spot.setShortAddress(address);
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
        makeSession(request);
        return true;
    }

    private void makeSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        log.info(" service session : {}" ,session);

        if(session!= null)
        {
            session.setAttribute("flag", true);
            session.setMaxInactiveInterval(10800);
        }
    }


}
