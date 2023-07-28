package com.hotelsolution.fire.board.vo;

import com.hotelsolution.fire.common.page.vo.PageVo;
import lombok.Data;

import java.util.List;

@Data
public class CommentResponse {
    private List<CompanyBoardCommentVo> commentrList;
    private PageVo pageVo;
}
