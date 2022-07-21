package com.project.horror.recommend.controller;

import com.project.horror.recommend.service.RecService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Log4j2
public class RecController {

    RecService service;

    //게시물 목록 요청
    @GetMapping("/reclist")
    public String list(Model model){
        log.info("controller request /board/list GET! - page : {}");
        Map<String, Object> boardMap = service.findAllService();
        log.info("return data - {}", boardMap);

/*        //페이지 정보 생성
        PageMaker pm = new PageMaker(new Page(search.getPageNum(),search.getAmount()), (Integer) boardMap.get("tc"));
        log.info("tc{}",boardMap.get("tc"));*/

        model.addAttribute("bList", boardMap.get("bList"));
//        model.addAttribute("pm", pm);

        return "recboard/rec-list";
    }

    // 게시물 상세 조회 요청


    // 게시물 쓰기 화면 요청


    // 게시물 등록 화면 요청


    // 게시물 삭제 요청


    // 수정화면 요청 GET


    // 수정화면 요청 POST
}
