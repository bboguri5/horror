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

import java.util.List;
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
        log.info(" HorrorSpotController : GET - ! ");
        Page page = new Page();
        Map<String, Object> spotMap = spotService.selectAll(page);
        PageMaker pm = new PageMaker(page,(int) spotMap.get("tc"));

        model.addAttribute("spotList",spotMap.get("spotList"));
        model.addAttribute("pm",pm);
        return "/horrorSpot/horrorSpot-list";
    }

    @GetMapping("/login")
    public String login()
    {
        return "/horrorSpot/admin-login";
    }

    @PostMapping("/spot")
    public String spot(Model model,String id, String pwd)
    {
        boolean result = spotService.checkLogin(id,pwd);
        model.addAttribute("is",result);
        return "/horrorSpot/horrorSpot-list";
    }
}

