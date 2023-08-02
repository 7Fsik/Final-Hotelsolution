package com.hotelsolution.fire.board.controller;

import com.google.gson.JsonObject;
import com.hotelsolution.fire.board.service.CompanyBoardService;
import com.hotelsolution.fire.board.vo.CommentResponse;
import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardCommentVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.temp.FireConstPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import oracle.jdbc.proxy.annotation.Post;
import org.springframework.http.ResponseEntity;
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
import java.time.LocalDateTime;
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
    public String showWriteForm(Model model) {
        List<CompanyBoardCategoryVo> categoryList = boardService.getCategoryList();
        log.info("categoryList" + categoryList);
        model.addAttribute("categoryList",categoryList);

        return "companyBoard/post";
    }

    @PostMapping("post")
    public String CompanyBoardPostByNo(HttpSession session, CompanyBoardVo companyBoardVo) {

        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        if(loginMember != null){
            companyBoardVo.setWriterNo(loginMember.getNo());
            int result = boardService.CompanyBoardPostByNo(companyBoardVo);
            if(result != 1){
                return "redirect:/error";
            }
        }
        return "redirect:/board/list/1";
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

    @GetMapping("drop")
    public String companyBoardDeleteByNo(@RequestParam int no)
    {
        int deleteResult = boardService.companyBoardDeleteByNo(no);

        if(deleteResult != 1){
          return "common/error";
        }

        return "redirect:/board/list/1";
    }

    @GetMapping("edit")
    public String companyBoardEditViewByNo(@RequestParam int no, Model model)
    {

        CompanyBoardVo companyBoardVo = boardService.getBoardInfoByNo(no);
        List<CompanyBoardCategoryVo> categoryList = boardService.getCategoryList();
        model.addAttribute("companyBoardVo", companyBoardVo);
        model.addAttribute("categoryList", categoryList);

        return "companyBoard/edit";
    }


    @PostMapping("edit")
    public String companyBoardEditByNo(
            HttpSession session
            ,CompanyBoardVo companyBoardVo
        )
    {
        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        if(loginMember != null){
            String loginMemberNo = loginMember.getNo();
            companyBoardVo.setWriterNo(loginMemberNo);
            companyBoardVo.setEnrollDate(LocalDateTime.now());
            log.info("수정후 넘어오는데이터 {} ", companyBoardVo);
            int result = boardService.companyBoardEditByNo(companyBoardVo);
            if(result != 1){
                return "redirect:/common/error";
            }
        }
        session.setAttribute("alertMsg","수정완료됨");
        return "redirect:/board/list/1";
    }

    @GetMapping("comment/list")
    @ResponseBody
    public ResponseEntity<CommentResponse> getAllCommentListByNo(@RequestParam (name="page",defaultValue = "1") int commentPage, @RequestParam int boardNo)
    {
        int commentlistCnt = boardService.getBoardCommentCnt(boardNo); // 여기에 boardNo를 전달하도록 수정합니다.
        System.out.println(commentlistCnt);
        int currentPage = commentPage;
        int companyBoardCommentPageLimit = FireConstPool.COMPANY_BOARD_COMMENT_PAGE_LIMIT;
        int companyBoardCommentLimit = FireConstPool.COMPANY_BOARD_COMMENT_LIMIT;
        PageVo pageVo = new PageVo(commentlistCnt, currentPage, companyBoardCommentPageLimit, companyBoardCommentLimit);
        List<CompanyBoardCommentVo> companyBoardCommentVo = boardService.getAllCommentListByNo(boardNo, pageVo);

        CommentResponse commentResponse = new CommentResponse();
        commentResponse.setCommentList(companyBoardCommentVo);
        commentResponse.setPageVo(pageVo);
        return ResponseEntity.ok().body(commentResponse);
    }

    @PostMapping("comment/write")
    @ResponseBody
    public String writeCommentByNo(HttpSession session, CompanyBoardCommentVo companyBoardCommentVo) {


        MemberVo loginUser = (MemberVo) session.getAttribute("loginMember");
        if (loginUser != null) {
            companyBoardCommentVo.setWriterNo(loginUser.getNo());

            boardService.writeCommentByNo(companyBoardCommentVo);
            return "success";
        }else{
            return "common/error";
        }

    }

    @PostMapping ("comment/delete")
    @ResponseBody
    public String deleteCommentOneByNo(HttpSession session, CompanyBoardCommentVo companyBoardCommentVo )
    {
        MemberVo loginUser = (MemberVo) session.getAttribute("loginMember");
        if (loginUser != null) {
            companyBoardCommentVo.setWriterNo(loginUser.getNo());

            int UpdateResult = boardService.deleteCommentOneByNo(companyBoardCommentVo);
            if(UpdateResult == 1) {
                return "success";
            }else{
                return "fail";
            }
        }else{
            return "common/error";
        }
    }

    @PostMapping ("comment/edit")
    @ResponseBody
    public String editCommentOneByNo(HttpSession session, CompanyBoardCommentVo companyBoardCommentVo )
    {
        MemberVo loginUser = (MemberVo) session.getAttribute("loginMember");
        if (loginUser != null) {
            companyBoardCommentVo.setWriterNo(loginUser.getNo());

            int updateResult = boardService.editCommentOneByNo(companyBoardCommentVo);
            System.out.println(updateResult);
            if(updateResult == 1) {
                return "success";
            }else{
                return "fail";
            }
        }else{
            return "common/error";
        }
    }






}
