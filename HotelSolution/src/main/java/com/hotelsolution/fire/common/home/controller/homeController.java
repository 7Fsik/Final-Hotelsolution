package com.hotelsolution.fire.common.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {


    @GetMapping("/")
    public String home(Model model)
    {

        return "common/home";
    }
}