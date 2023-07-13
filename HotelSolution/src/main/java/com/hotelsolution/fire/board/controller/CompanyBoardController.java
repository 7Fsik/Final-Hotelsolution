package com.hotelsolution.fire.board.controller;

import com.hotelsolution.fire.board.service.CompanyBoardService;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.temp.FireConstPool;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class CompanyBoardController {

    private final CompanyBoardService boardService;

    @GetMapping("list")
    public String getAllCompanyBoardList(int page, Model model) {

        int listCount = boardService.getCompanyBoardCnt();
        int currentPage = page;
        int pageLimit = FireConstPool.COMPANY_BOARD_PAGE_LIMIT;
        int boardLimit = FireConstPool.COMPANY_BOARD_LIMIT;
        PageVo pv = new PageVo(listCount,currentPage,pageLimit,boardLimit);

        List<CompanyBoardVo> allCompanyBoardList = boardService.getAllCompanyBoardList(pv);
        model.addAttribute("allCompanyBoardList",allCompanyBoardList);
        return "front/companyBoard/list";
    }



}
