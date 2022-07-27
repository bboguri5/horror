package com.project.horror.horrorSpotBoard.Controller;


import com.project.horror.common.paging.Page;
import com.project.horror.common.paging.PageMaker;
import com.project.horror.common.search.Search;
import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.service.HorrorSpotService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping("horror/spot_board")
@RequiredArgsConstructor
public class HorrorSpotController {

    private final HorrorSpotService spotService;

    // spot 리스트 목록 
    @GetMapping("/spot")
    public String spot(@ModelAttribute("search") Search search, Model model,HttpServletRequest request) {

        log.info(" Controller spot : GET - ! ");

//        if(request.getSession(false)==null) // 아이디 없이 spot 주소를 찾아가면 접근 못하도록 차단
//            return "redirect:/login";

        //paging 처리하여 select
        Page page = new Page(search.getPageNum(), search.getAmount());
        Map<String, Object> spotMap = spotService.selectAll(search);
        PageMaker pm = new PageMaker(page, (int) spotMap.get("tc"));

        model.addAttribute("spotList", spotMap.get("spotList"));
        model.addAttribute("pm", pm);
        log.info("?? -> {} ",pm.getPage().getPageNum());

        return "horrorSpot/board-list";
    }

    // 글쓰기 화면
    @GetMapping("/write")
    public String write(Model model)
    {
        // write 화면 modify랑 write가 같이 사용하닌깐 form으로 인자를 전달하기 위함
        model.addAttribute("arg","write");
        return "horrorSpot/board-write";
    }


    // 글쓰기 정보 등록
    @PostMapping("/write")
    public String write(RedirectAttributes redirect, Spot spot)
    {
        log.info("write post - !");

        boolean result = spotService.save(spot);
        redirect.addFlashAttribute("msg","writeSuccess"); // 팝업 메시지

        log.info(" save : {} / spot : {}",result,spot);
        return "redirect:/horror/spot_board/spot";
    }

    // 수정
    @GetMapping("/modify")
    public String modify(Model model, int spotNo) {

        log.info(" controller modify Get - {}", spotNo);
        model.addAttribute("s", spotService.selectOne(spotNo));
        model.addAttribute("arg","modify");
        model.addAttribute("spotNo",spotNo);
        return "horrorSpot/board-write";
    }

    @PostMapping("/modify")
    public String save(RedirectAttributes redirect, Spot spot) {
        log.info(" controller modify save Post - {}", spot);

        if(spotService.modify(spot))
        {
            redirect.addFlashAttribute("msg","modifySuccess");
            return  "redirect:/horror/spot_board/spot";
        }
        return "redirect:/horror/spot_board/spot";
    }

    @GetMapping("/delete")
    public String delete(RedirectAttributes redirect,int spotNo)
    {
        log.info(" controller delete Get - {}", spotNo);
        spotService.delete(spotNo);
        redirect.addFlashAttribute("msg","deleteSuccess");
        return  "redirect:/horror/spot_board/spot";
    }
}

