package com.project.horror.controller;

import com.project.horror.horrorSpotBoard.domain.Member;
import com.project.horror.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Log4j2
@Controller
@RequiredArgsConstructor
public class FrontController {
    private final LoginService loginService;

    @GetMapping("/")
    public String welcome()
    {
        return "/welcome";
    }

    @GetMapping("/login")
    public String login(Model model, boolean flag) {
        log.info(" Controller loginForm : Post - ! {}" ,flag);
        model.addAttribute(flag);
        return "/login/login-form";
    }

    @PostMapping("/signIn")
    public String checkLogin(
            HttpServletRequest request,
            Model model,
            String id, String pwd){

        log.info(" Controller loginChk  : Post - ! ");

        if(loginService.login(request,id,pwd))
        {
            log.info("접속 완료");
            return "";
        }
        
        log.info("접속 불가");
        model.addAttribute("login",false);
        return "/login/login-form";
    }

    @GetMapping("/signUp")
    public String signUp(RedirectAttributes redirect, String inputId)
    {
        log.info(" singUp get - ! {} ",inputId);

        if(inputId != null)
        {
            if(loginService.checkId(inputId))
                redirect.addFlashAttribute("checkID","fail");
            else
            {
                redirect.addFlashAttribute("checkID","success");
                redirect.addFlashAttribute("inputId",inputId);
            }
            return "redirect:/signUp";
        }
        return "/login/sign-up";
    }

    @PostMapping("/signUp")
    public String signUp(Member member)
    {
        loginService.saveSignUpInfo(member);
        return "/login/sign-up-success";
    }

    @PostMapping("/horror/index")
    public String index()
    {
        return "/index";
    }


    @GetMapping("/horror/main")
    public String main()
    {}


}
