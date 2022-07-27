package com.project.horror.login.controller;

import com.project.horror.horrorSpotBoard.domain.Member;
import com.project.horror.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequiredArgsConstructor
public class FrontController {
    private final LoginService loginService;

    // 웰컴 화면
    @GetMapping("/")
    public String welcome()
    {
        return "/welcome";
    }

    // 로그인 화면
    @GetMapping("/login")
    public String login(Model model, boolean flag) {
        log.info(" Controller loginForm : Post - ! {}" ,flag);
        model.addAttribute(flag);
        return "login/login-form";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request)
    {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }

    // 메인 화면
    @GetMapping("/horror/main")
    public String index()
    {
        return "index";
    }

    // 로그인 정보 DB랑 비교
    @PostMapping("/signIn")
    public String checkLogin(
            HttpServletRequest request,
            Model model,
            String id, String pwd){

        log.info(" Controller loginChk  : Post - ! ");

        if(loginService.login(request,id,pwd)) // id/pwd 체크
        {
            log.info("접속 완료");
            return "redirect:horror/main";
        }
        
        log.info("접속 불가");
        model.addAttribute("login",false);
        return "login/login-form";
    }

    // 회원가입
    @GetMapping("/signUp")
    public String signUp(RedirectAttributes redirect, String inputId)
    {
        log.info(" singUp get - ! {} ",inputId);
        if(inputId != null)
        {
            if(inputId.equals("admin")) // 어드민일 경우 중복
            {
                redirect.addFlashAttribute("checkID","fail");
                return "redirect:/signUp";
            }
            // 아이디 중복시 checkID 값에 따라 jsp에서 js를 통해 실패/성공 문구팝업 발생
            if(loginService.checkId(inputId))// id 인증
                redirect.addFlashAttribute("checkID","fail");
            else
            {
                redirect.addFlashAttribute("checkID","success");
                redirect.addFlashAttribute("inputId",inputId); // 중복이 아님으로 jsp에 입력한 값을 넣어주기위해
            }
            return "redirect:/signUp";
        }
        return "login/sign-up";
    }

    // 회원가입 폼 DB에 전달 후 sucess페이지 보여주기
    @PostMapping("/signUp")
    public String signUp(Member member)
    {
        loginService.saveSignUpInfo(member);
        return "login/sign-up-success";
    }


}
