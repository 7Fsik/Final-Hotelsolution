package com.hotelsolution.fire.board.controller;

import com.hotelsolution.fire.board.service.CompanyBoardService;
import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.temp.FireConstPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j
public class CompanyBoardController {

    private final CompanyBoardService boardService;

    @GetMapping("list/{page}")
    public String getAllCompanyBoardList(@PathVariable("page") int page, Model model) {

        int listCount = boardService.getCompanyBoardCnt();
        int currentPage = page;
        int pageLimit = FireConstPool.COMPANY_BOARD_PAGE_LIMIT;
        int boardLimit = FireConstPool.COMPANY_BOARD_LIMIT;
        PageVo pv = new PageVo(listCount,currentPage,pageLimit,boardLimit);

        List<CompanyBoardVo> allCompanyBoardList = boardService.getAllCompanyBoardList(pv);
        model.addAttribute("allCompanyBoardList",allCompanyBoardList);
        model.addAttribute("pv",pv);
        return "companyBoard/list";
    }
    @GetMapping("post")
    public String showWriteForm( Model model) {
        List<CompanyBoardCategoryVo> categoryList = boardService.getCategoryList();

        model.addAttribute("categoryList",categoryList);


        return "companyBoard/write";
    }

    @PostMapping("post")
    public String writeCompanyBoardPostByNo( HttpServletRequest request)
    {
        String categoryNo = request.getParameter("categoryNo");
        log.info("categoryNo" + categoryNo);
        String title = request.getParameter("title"); // 요청으로부터 타이틀 값 받아오기
        String content = request.getParameter("content"); // 요청으로부터 내용 값 받아오기


        CompanyBoardVo companyBoardVo = new CompanyBoardVo();

        companyBoardVo.setWriterNo(1);    // 라이터넘버를 1로 설정 (임시값)
        companyBoardVo.setTitle(title);
        companyBoardVo.setContent(content);   // 라이터넘버를 1로 설정
        companyBoardVo.setCategoryNo(categoryNo);
        int result = boardService.writeCompanyBoardPost(companyBoardVo);

        if(result != 1){
            return "redirect:/error";
        }
        return "redirect:/main";
    }

    @GetMapping("detail")
    public String showDetailBoardByNo(){

        return "companyBoard/detail";
    }







}
