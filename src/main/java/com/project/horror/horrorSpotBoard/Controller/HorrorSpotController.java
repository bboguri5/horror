package com.project.horror.horrorSpotBoard.Controller;


import com.project.horror.common.paging.Page;
import com.project.horror.common.paging.PageMaker;
import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.service.HorrorSpotService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Log4j2
@Controller
@RequestMapping("/horror")
@RequiredArgsConstructor
public class HorrorSpotController {

    private  final HorrorSpotService spotService;

    @GetMapping("/spot")
    public String spot(Model model)
    {
        log.info("  Controller spot : GET - ! ");
        Page page = new Page();
        Map<String, Object> spotMap = spotService.selectAll(page);
        PageMaker pm = new PageMaker(page,(int) spotMap.get("tc"));

        model.addAttribute("spotList",spotMap.get("spotList"));
        model.addAttribute("pm",pm);
        return "/horrorSpot/horrorSpot-list";
    }

    @PostMapping("/spot")
    public String spot(boolean flag)
    {
        log.info(" Controller spot : Post - ! {}",flag);
        return "";
    }

    @PostMapping("/loginChk")
    public String checkLogin(Model model, RedirectAttributes redirect, String id, String pwd)
    {
        log.info(" Controller checkLogin : Post - ! {}",id);
        boolean flag = spotService.checkLogin(id,pwd);
        if(flag){
            redirect.addFlashAttribute("flag",flag);
            return "redirect:/horror/spot";
        }
        else {
            redirect.addAttribute("flag",flag);
            return "redirect:/horror/login";
        }
    }
    @GetMapping("/login")
    public String login(Model model)
    {
        model.addAttribute("cnt",0);
        model.addAttribute("flag",true);
        return "/horrorSpot/admin-login";
    }

    @GetMapping("/modify")
    public String modify(Model model,int spotNo){

        log.info(" controller modify Get - {}",spotNo);
        model.addAttribute("s",spotService.selectOne(spotNo));
        return "/horrorSpot/board-modify";
    }

    @PostMapping("/modify")
    public String save(int spotNo)
    {
        log.info(" controller save Post - {}",spotNo);
        Spot spot = spotService.selectOne(spotNo);
        return "/horrorSpot";
    }


}

