package com.project.horror.calendar.service;

import com.project.horror.calendar.domain.Calendar;
import com.project.horror.calendar.repository.CalendarMapper;
import com.project.horror.common.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class CalendarService {

    private final CalendarMapper repository;

    public boolean saveService(Calendar calendar) {
        log.info("save service start - {}", calendar);
        return repository.save(calendar);
    }

    public Map<String, Object> findAllService(Search search) {

        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<Calendar> boardList = repository.findAll(search);

        findDataMap.put("cList", boardList);

        return findDataMap;
    }

    public Calendar findOneService(Long calendarNo) {
        log.info("findOne service start - {}", calendarNo);
        Calendar calendar = repository.findOne(calendarNo);

        return calendar;
    }

    public boolean removeService(Long boardNo) {
        log.info("remove service start - {}", boardNo);
        return repository.remove(boardNo);
    }

    // 게시물 수정 요청 중간 처리
    public boolean modifyService(Calendar calendar) {
        log.info("modify service start - {}", calendar);
        return repository.modify(calendar);
    }

}
