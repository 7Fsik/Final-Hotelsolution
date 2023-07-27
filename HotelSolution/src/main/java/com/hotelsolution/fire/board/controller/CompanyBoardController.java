package com.hotelsolution.fire.board.controller;

import com.google.gson.JsonObject;
import com.hotelsolution.fire.board.service.CompanyBoardService;
import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardCommentVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.temp.FireConstPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.lang.reflect.Member;
import java.util.List;
import java.util.UUID;
import org.apache.commons.lang3.StringUtils;

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


        return "companyBoard/post";
    }

    @PostMapping("post")
    public String writeCompanyBoardPostByNo(@ModelAttribute("loginMember") MemberVo loginMember, CompanyBoardVo companyBoardVo) {
        if(loginMember != null){
            companyBoardVo.setWriterNo(loginMember.getNo());
            int result = boardService.writeCompanyBoardPost(companyBoardVo);
            if(result != 1){
                return "redirect:/error";
            }
        }
        return "redirect:/board/list/1";
    }

    @ModelAttribute("loginMember")
    public MemberVo getLoginMember(HttpSession session) {
        return (MemberVo) session.getAttribute("loginMember");
    }


    @ResponseBody
    @RequestMapping(value = "upload" )
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception {
        JsonObject jsonObject = new JsonObject();
        PrintWriter printWriter = null;
        OutputStream out = null;
        MultipartFile file = multiFile.getFile("upload");

        if (file != null) {
            if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
                if (file.getContentType().toLowerCase().startsWith("image/")) {
                    try {

                        String fileName = file.getOriginalFilename();
                        byte[] bytes = file.getBytes();

                        String uploadPath = req.getSession().getServletContext().getRealPath("/resources/img/"); //저장경로
                        System.out.println("uploadPath:" + uploadPath);

                        File uploadFile = new File(uploadPath);
                        if (!uploadFile.exists()) {
                            uploadFile.mkdir();
                        }
                        String fileName2 = UUID.randomUUID().toString();
                        uploadPath = uploadPath + "/" + fileName2 + fileName;

                        out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);

                        printWriter = resp.getWriter();
                        String fileUrl = req.getContextPath() + "/resources/img/" + fileName2 + fileName; //url경로
                        System.out.println("fileUrl :" + fileUrl);
                        JsonObject json = new JsonObject();
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        printWriter.print(json);
                        System.out.println(json);

                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        if (out != null) {
                            out.close();
                        }
                        if (printWriter != null) {
                            printWriter.close();
                        }
                    }
                }


            }

        }
    }

    @GetMapping("detail")
    public String handleCompanyBoardDetailRequest(@RequestParam int no, Model model)
    {
        boardService.increaseCompanyBoardHit(no);

        CompanyBoardVo companyBoardVo  = boardService.getCompanyBoardDetailByNo(no);


        model.addAttribute("companyBoardVo",companyBoardVo);

        return "companyBoard/detail";

    }

    @PostMapping("delete")
    public String companyBoardDeleteByNo(@RequestParam int no)
    {
        int deleteResult = boardService.companyBoardDeleteByNo(no);

        if(deleteResult != 1){
          return "common/error";
        }

        return "redirect:/board/list/1";
    }

    @GetMapping ("edit")
    public String companyBoardEditViewByNo(@RequestParam int no, Model model)
    {
        CompanyBoardVo companyBoardVo = boardService.getBoardInfoByNo(no);

        model.addAttribute("companyBoardVo",companyBoardVo);

        return "companyBoard/edit";
    }

    @GetMapping("comment/list")
    @ResponseBody
    public String getAllCommentListByNo()
    {

        return "김치먹자";
    }

    @PostMapping("comment/write")
    @ResponseBody
    public String writeCommentByNo(HttpSession session, CompanyBoardCommentVo companyBoardCommentVo) {

        log.info("companyBoardCommentVo 내용물보기 ㅇㅇ" +  companyBoardCommentVo);

        MemberVo loginUser = (MemberVo) session.getAttribute("loginMember");
        if (loginUser != null) {
            companyBoardCommentVo.setWriter(loginUser.getNo());

            boardService.writeCommentByNo(companyBoardCommentVo);
            return "success";
        }else{
            return "common/error";
        }

    }
}
