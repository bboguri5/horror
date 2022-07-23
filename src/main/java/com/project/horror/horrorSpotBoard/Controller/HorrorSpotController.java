package com.project.horror.horrorSpotBoard.Controller;


import com.project.horror.common.paging.Page;
import com.project.horror.common.paging.PageMaker;
import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.horrorSpotBoard.service.HorrorSpotService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping("/horror")
@RequiredArgsConstructor
public class HorrorSpotController {

    private final HorrorSpotService spotService;

    @GetMapping("/spot")
    public String spot(Model model) {

        log.info(" Controller spot : GET - ! ");

        Page page = new Page();
        Map<String, Object> spotMap = spotService.selectAll(page);
        PageMaker pm = new PageMaker(page, (int) spotMap.get("tc"));

        model.addAttribute("spotList", spotMap.get("spotList"));
        model.addAttribute("pm", pm);
        return "/horrorSpot/board-list";
    }

    @PostMapping("/loginForm")
    public String login(boolean flag,Model model) {
        log.info(" Controller loginForm : Post - ! ");
        model.addAttribute(flag);
        return "/horrorSpot/admin-login";
    }

    @PostMapping("/loginChk")
    public String checkLogin(
            HttpServletRequest request,
            Model model,
            String id, String pwd){



        log.info(" Controller loginChk  : Post - ! ");
        boolean flag = spotService.checkLogin(request,id,pwd);
        if(flag)
        {
            return "redirect:/horror/spot";
        }
        {
            model.addAttribute("flag",false);
            return "/horrorSpot/admin-login";
        }
    }

    @GetMapping("/write")
    public String write(Model model)
    {
        model.addAttribute("arg","write");
        return "/horrorSpot/board-write";
    }

    @PostMapping("/write")
    public String write(String title, String country, String address, String content)
    {
        log.info("write post - !");
        boolean result = spotService.save(new Spot(title,country,address,content));
        return "redirect:/horror/spot";
    }


    @GetMapping("/modify")
    public String modify(Model model, int spotNo) {

        log.info(" controller modify Get - {}", spotNo);
        model.addAttribute("s", spotService.selectOne(spotNo));
        model.addAttribute("arg","modify");
        model.addAttribute("spotNo",spotNo);
        return "/horrorSpot/board-write";
    }

    @PostMapping("/modify")
    public String save(RedirectAttributes redirect, Spot spot) {
        log.info(" controller modify save Post - {}", spot);

        if(spotService.modify(spot))
        {
            redirect.addFlashAttribute("msg","success");
            return  "redirect:/horror/spot";
        }
        return "redirect:/horror/spot";
    }

    @GetMapping("/delete")
    public String delete(int spotNo)
    {
        log.info(" controller delete Get - {}", spotNo);
        spotService.delete(spotNo);
        return  "redirect:/horror/spot";
    }


}

