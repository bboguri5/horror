package com.project.horror.calendar.controller;

import com.project.horror.calendar.domain.Calendar;
import com.project.horror.calendar.service.CalendarService;
import com.project.horror.common.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller // Model에 뷰를 넘겨줌
@Log4j2
@RequiredArgsConstructor // 의존성주입
@RequestMapping("horror/calendar_board")
public class CalendarController {

    private final CalendarService calendarService;

    // 게시물 목록 요청

    @GetMapping("/list") // "s" 타입으로 옵션태그를 보내준다
    public String list(@ModelAttribute("s") Search search, Model model, HttpServletRequest request) {

        log.info("controller request /board/list GET!");

        if(request.getSession(false)==null) // 아이디 없이 spot 주소를 찾아가면 접근 못하도록 차단
            return "redirect:/login";

        Map<String, Object> calendarMap = calendarService.findAllService(search);
        log.info("return data - {}", calendarMap);

        model.addAttribute("cList", calendarMap.get("cList"));
        model.addAttribute("time", calendarMap.get("time"));
        model.addAttribute("date", calendarMap.get("date"));
        model.addAttribute("targetDay", calendarMap.get("targetDay"));
        model.addAttribute("targetMonth", calendarMap.get("targetMonth"));
        model.addAttribute("targetTime", calendarMap.get("targetTime"));


        return "calendar/calendar-list";

    }
    // 게시물 상세 조회 요청
    @GetMapping("/content/{calendarNo}")
    public String content(@PathVariable Long calendarNo, Model model) {
        Calendar calendar = calendarService.findOneService(calendarNo);
        log.info("return data - {}", calendar);
        model.addAttribute("calendar", calendar);

        return "calendar/calendar-detail";
    }

    // 게시물 쓰기 화면 요청
    @GetMapping("/write")
    public String write() {
        log.info("controller request /calendar/write GET");
        return "calendar/calendar-write";
    }

    // 게시물 등록 요청
    @PostMapping("/write")
    public String write(Calendar calendar, RedirectAttributes ra) {
        log.info("controller request /calendar/write POST! - {}", calendar);
        boolean flag = calendarService.saveService(calendar);

        if (flag) ra.addFlashAttribute("msg", "reg-success");

        return flag ? "redirect:/horror/calendar_board/list" : "calendar:/";
    }

    // 게시물 삭제 요청
    @GetMapping("/delete")
    public String delete(Long calendarNo) {
        log.info("controller request /calendar/delete GET! - bno: {}", calendarNo);
        return calendarService.removeService(calendarNo)
                ? "redirect:/horror/calendar_board/list" : "redirect:/";
    }

    // 수정 화면 요청
    @GetMapping("/modify")
    public String modify(Long calendarNo, Model model) {
        log.info("controller request /board/modify GET! - bno: {}", calendarNo);
        Calendar calendar = calendarService.findOneService(calendarNo);
        log.info("find article: {}", calendar);

        model.addAttribute("calendar", calendar);
        return "calendar/calendar-modify";
    }

    // 수정 처리 요청
    @PostMapping("/modify")
    public String modify(Calendar calendar) {
        log.info("controller request /board/modify POST! - {}", calendar);
        boolean flag = calendarService.modifyService(calendar);
        return flag ? "redirect:/horror/calendar_board/content/" + calendar.getCalendarNo() : "redirect:/";
    }

    @GetMapping("/file/{bno}")
    @ResponseBody // 비동기니까
    public ResponseEntity<List<String>> getFiles(@PathVariable Long bno) {

        List<String> files = calendarService.getFiles(bno);
        log.info("/board/file/{} GET! ASYNC - {}", bno, files);

        return new ResponseEntity<>(files, HttpStatus.OK);
    }

}
