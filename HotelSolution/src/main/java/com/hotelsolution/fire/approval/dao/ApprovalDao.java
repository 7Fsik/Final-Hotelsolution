package com.hotelsolution.fire.approval.dao;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface ApprovalDao {

	List<PositionVo> getPositionList(SqlSessionTemplate sst);

	List<TeamVo> getTeamList(SqlSessionTemplate sst);

	List<MemberVo> getEmployee(SqlSessionTemplate sst, Map<String, String> map);

	List<MemberVo> getDecideEmployee(SqlSessionTemplate sst, Map<String, String> params);

	DocumentVo getDocumentVactionNo(SqlSessionTemplate sst, Map<String, String> map);

	DocumentVo getDocumentExpenditureNo(SqlSessionTemplate sst, Map<String, String> map);

	DocumentVo getDocumentReportNo(SqlSessionTemplate sst, Map<String, String> map);

	//List<DocumentVo> getDocumentType(SqlSessionTemplate sst, Map<String, String> map);

	int insertApprovalDocument(SqlSessionTemplate sst, ApprovalVo avo);

	int vacation(SqlSessionTemplate sst, VactionVo vo);

	ApprovalVo getDocumentNo(SqlSessionTemplate sst, String no);

	int updateDocumentApproval(SqlSessionTemplate sst, Map<String, Object> map);

	int updateDocumentReport(SqlSessionTemplate sst, Map<String, String> map);

	int report(SqlSessionTemplate sst, Map<String, String> params);

	List<ItemVo> getItemList(SqlSessionTemplate sst);

	int updateDocumentExpenditure(SqlSessionTemplate sst, Map<String, String> map);

	int expenditure(SqlSessionTemplate sst, ExpenditureVo evo);

	int expenditureItemList(SqlSessionTemplate sst, Map<String, Object> paramValue);

	ExpenditureVo getExpenditureNo(SqlSessionTemplate sst, String avoNo);

	List<ApprovalVo> getApproval(SqlSessionTemplate sst , Map<String, Object> map);

	int getApprovalFirstPageCnt(SqlSessionTemplate sst, String no);

	int approver(SqlSessionTemplate sst, ApproverVo appVo);

	int referrer(SqlSessionTemplate sst, ApprovalReferrerVo arvo);

	int getApprovalCnt(SqlSessionTemplate sst, String no);

	List<ApprovalVo> getMyApproval(SqlSessionTemplate sst, Map<String, Object> map);

	int getReferrCnt(SqlSessionTemplate sst, String no);

	List<ApprovalVo> getReferenceApproval(SqlSessionTemplate sst, Map<String, Object> map);

	ApprovalVo vacationDetail(SqlSessionTemplate sst, String no);

	List<ApproverVo> getApprover(SqlSessionTemplate sst, String no);

	List<ApprovalReferrerVo> getReferrer(SqlSessionTemplate sst, String no);


	int firstSubmit(SqlSessionTemplate sst, Map<String, String> map);

	int adYnEdit(SqlSessionTemplate sst, String approvalNo);

	int reject(SqlSessionTemplate sst, Map<String, String> map);

	int adYnReject(SqlSessionTemplate sst, String approvalNo);

	ApprovalVo expenditureDetail(SqlSessionTemplate sst, String no);

	List<ItemVo> getItemInfo(SqlSessionTemplate sst, String no);





}
