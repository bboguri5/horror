package com.project.horror.horrorSpotBoard.Controller;


import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.repository.HorrorSpotMapper;
import com.project.horror.service.HorrorSpotService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/horror")
@RequiredArgsConstructor
public class HorrorSpotController {

    private  final HorrorSpotService spotService;

    @GetMapping("/spot")
    public String spot(Model model )
    {
        List<Spot> spotList =  spotService.selectAll();
        model.addAttribute("spotList",spotList);
        return "/horrorSpot/horrorSpot-list";
    }

    @GetMapping("/spotDetail")
    public String spotDetail(Model model,int spotNo)
    {
        Spot spot = spotService.selectOne(spotNo);
        model.addAttribute(spot);
        return "/horrorSpot/horrorSpot-detail";
    }
}
