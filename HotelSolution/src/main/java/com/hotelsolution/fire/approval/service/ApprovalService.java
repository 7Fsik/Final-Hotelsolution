package com.hotelsolution.fire.approval.service;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.approval.vo.ApprovalReferrerVo;
import com.hotelsolution.fire.approval.vo.ApprovalVo;
import com.hotelsolution.fire.approval.vo.ApproverVo;
import com.hotelsolution.fire.approval.vo.DocumentVo;
import com.hotelsolution.fire.approval.vo.ExpenditureVo;
import com.hotelsolution.fire.approval.vo.ItemVo;
import com.hotelsolution.fire.approval.vo.PositionVo;
import com.hotelsolution.fire.approval.vo.TeamVo;
import com.hotelsolution.fire.approval.vo.VactionVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.member.vo.MemberVo;

public interface ApprovalService {

	//직책 가져오기
	List<PositionVo> getPositionList();

	List<TeamVo> getTeamList();

	List<MemberVo> getEmployee(Map<String, String> map);

	List<MemberVo> getDecideEmployee(Map<String, String> params);

	DocumentVo getDocumentVactionNo(Map<String, String> map);

	DocumentVo getDocumentExpenditureNo(Map<String, String> map);

	DocumentVo getDocumentReportNo(Map<String, String> map);

	//List<DocumentVo> getDocumentType(Map<String, String> map);

	//휴가신청서 작성
	int vacation(VactionVo vo);

	//웹페이지 로드될때 결재문서 인서트
	int insertApprovalDocument(ApprovalVo avo);

	//결재문서 번호 가져오기
	ApprovalVo getDocumentNo(String no);

	//휴가신청서 작성될때 결재문서 업데이트
	int updateDocumentApproval(Map<String, Object> map);

	//업무보고서 작성될때 결재문서 업데이트
	int updateDocumentReport(Map<String, String> map);

	//업무보고서 작성
	int report(Map<String, String> params);

	List<ItemVo> getItemList();

	int updateDocumentExpenditure(Map<String, String> map);

	int expenditure(ExpenditureVo evo);

	int expenditureItemList(Map<String, Object> paramValue);

	ExpenditureVo getExpenditureNo(String no);

	List<ApprovalVo> getApproval(Map<String, Object> map);

	int getApprovalFirstPageCnt(String no);

	int approver(ApproverVo appVo);

	int referrer(ApprovalReferrerVo arvo);

	int getApprovalCnt(String no);

	List<ApprovalVo> getMyApproval(Map<String, Object> map);

	int getReferrCnt(String no);

	List<ApprovalVo> getReferenceApproval(Map<String, Object> map);

	ApprovalVo vacationDetail(String no);

	List<ApproverVo> getApprover(String no);

	List<ApprovalReferrerVo> getReferrer(String no);


	int firstSubmit(Map<String, String> map);

	int adYnEdit(String approvalNo);

	int reject(Map<String, String> map);

	int adYnReject(String approvalNo);

	ApprovalVo expenditureDetail(String no);

	List<ItemVo> getItemInfo(String no);

	int getApprovalCntInMain(String no);


}
