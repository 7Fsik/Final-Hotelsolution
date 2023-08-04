package com.hotelsolution.fire.common.home.controller;

import com.hotelsolution.fire.board.service.CompanyBoardService;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class homeController {

    private final CompanyBoardService companyBoardService;


    @GetMapping("/")
    public String home(Model model)
    {
        return "common/home";
    }


}
