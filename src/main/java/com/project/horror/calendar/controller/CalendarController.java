package com.project.horror.calendar.controller;

import com.project.horror.calendar.service.CalendarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // Model에 뷰를 넘겨줌
@Log4j2
@RequiredArgsConstructor // 의존성주입
@RequestMapping("/horror")
public class CalendarController {

    private final CalendarService calendarService;



}
