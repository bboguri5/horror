package com.project.horror.horrorSpotBoard.service;

import com.project.horror.common.paging.Page;
import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.repository.HorrorSpotMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class HorrorSpotService {
    private final HorrorSpotMapper spotMapper;

    public Map<String, Object> selectAll(Page page)
    {
        log.info("selectAll service start");

        Map<String, Object> findDataMap = new HashMap<>();
        findDataMap.put("spotList",spotMapper.selectAll(page));
        findDataMap.put("tc", spotMapper.getTotalCount());

        return findDataMap;
    }

    public Spot selectOne(int spotNo)
    {
        log.info("selectOne service start");
        return spotMapper.selectOne(spotNo);
    }

    public boolean checkLogin(String id, String pwd)
    {
        log.info("checkLogin service start");
        return id.equals("admin") && pwd.equals("1234");
    }
}
