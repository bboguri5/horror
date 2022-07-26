package com.project.horror.recommend.controller;

import com.project.horror.recommend.common.paging.RecPage;
import com.project.horror.recommend.common.paging.RecPageMaker;
import com.project.horror.recommend.common.search.RecSearch;
import com.project.horror.recommend.domain.RecBoard;
import com.project.horror.recommend.service.RecService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/recboard")
public class RecController {

    private final RecService service;

    //게시물 목록 요청
    @GetMapping("/reclist")
    public String list(Model model, @ModelAttribute("s")RecSearch search) {
        log.info("controller request /recboard/reclist GET! - search : {}", search);
        Map<String, Object> boardMap = service.findAllService(search);
        log.info("return data - {}", boardMap);

        //페이지 정보 생성
        RecPageMaker pm = new RecPageMaker(new RecPage(search.getPageNum(), search.getAmount()), (Integer) boardMap.get("tc"));
        log.info("tc{}",boardMap.get("tc"));

        List<RecBoard> bList = (List<RecBoard>) boardMap.get("bList");
//        log.info("{}", bList);
        model.addAttribute("bList", bList);
        model.addAttribute("pm", pm);

        return "recboard/rec-list";
    }

    // 게시물 상세 조회 요청

    @GetMapping("/reccontent/{boardNo}")
    public String content(@PathVariable Long boardNo, Model model
            ,HttpServletResponse response, HttpServletRequest request
            /*@ModelAttribute("p") Page page, */) {
        log.info("controller request /recboard/reccontent GET ! - {}", boardNo);

        RecBoard board = service.findOneService(boardNo, response, request);
//        log.info("return data - {}", board);
        model.addAttribute("b", board);

        return "recboard/rec-detail";
    }


    // 게시물 쓰기 화면 요청
    @GetMapping("/recwrite")
    public String write() {
        log.info("controller request /recboard/recwrite GET !");
        return "recboard/rec-write";
    }

    // 게시물 등록 화면 요청
    @PostMapping("/recwrite")
    public String write(RecBoard board, RedirectAttributes ra) { // @RequestBody 는 테스트 할때만 사용.
        log.info("controller request /recboard/recwrite POST! - {}", board);
        boolean flag = service.saveService(board);

        // 게시물 등록이 잘 되면 클라이언트에 성공 메시지를 전송 하고 싶다.
        if (flag) ra.addFlashAttribute("msg", "reg-success");

        log.info(flag);

        return flag ? "redirect:/recboard/reclist" : "redirect:/";
    }

    // 게시물 삭제 요청
    @GetMapping("/recdelete/{boardNo}")
    public String delete(@PathVariable Long boardNo) {
        log.info("controller request / recboard/recdelete GET ! - {}", boardNo);
        boolean flag = service.removeService(boardNo);
        log.info(flag);
        return flag ? "redirect:/recboard/reclist" : "redirect:/";
    }

    // 수정화면 요청
    // 수정화면 요청 GET
    @GetMapping("/recmodify")
    public String modify(Long boardNo, Model model ,HttpServletResponse response, HttpServletRequest request) {
        log.info("controller request /recboard/recmodify GET ! - bno:{}", boardNo);
        RecBoard board = service.findOneService(boardNo,response, request);
        log.info("find article: {}", board);

        model.addAttribute("board", board);
        return "recboard/rec-modify";
    }

    // 수정화면 요청 POST
    @PostMapping("/recmodify")
    public String modify(RecBoard board) {
        log.info("controller request /recboard/recmodify POST! - {}", board);
        boolean flag = service.modifyService(board);

        return flag ? "redirect:/recboard/reccontent/" + board.getBoardNo() : "redirect:/";
    }

    // 좋아요 요청 GET
    @GetMapping("/reclikeup")
    public String likeup(Long boardNo,HttpServletRequest request, HttpServletResponse response){
        log.info("controller request /recboard/reclikeup GET! - {}",boardNo);
        boolean flag = service.makeGoodCount(boardNo,response,request);

        return flag? "redirect:/recboard/reclist" : "redirect:/recboard/reclist";
    }
}
