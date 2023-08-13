package com.hotelsolution.fire.approval.service;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.approval.dao.ApprovalDao;
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

import lombok.RequiredArgsConstructor;



@Service
@Transactional
@RequiredArgsConstructor
public class ApprovalServiceImpl implements ApprovalService{

	private final ApprovalDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	//사원 직책가져오기
	public List<PositionVo> getPositionList() {
		return dao.getPositionList(sst);
	}
	
	@Override
	//사원 소속 가져오기
	public List<TeamVo> getTeamList() {
		return dao.getTeamList(sst);
	}
	
	@Override
	//사원 가져오기
	public List<MemberVo> getEmployee(Map<String, String> map) {
		return dao.getEmployee(sst,map);
	}

	@Override
	//고정 결재 사원 가져오기
	public List<MemberVo> getDecideEmployee(Map<String, String> params) {
		return dao.getDecideEmployee(sst,params);
	}

	@Override
	//휴가신청서 타입번호 가져오기
	public DocumentVo getDocumentVactionNo(Map<String, String> map) {
		return dao.getDocumentVactionNo(sst,map);
	}

	@Override
	//지출결의서 타입번호 가져오기
	public DocumentVo getDocumentExpenditureNo(Map<String, String> map) {
		return dao.getDocumentExpenditureNo(sst,map);
	}

	@Override
	//업무보고서 타입번호 가져오기
	public DocumentVo getDocumentReportNo(Map<String, String> map) {
		return dao.getDocumentReportNo(sst,map);
	}

	@Override
	//클릭했을때 결재문서 인서트하기
	public int insertApprovalDocument(ApprovalVo avo) {
		return dao.insertApprovalDocument(sst, avo);
	}
	
	@Override
	//인서트된 결재문서 번호 가져오기
	public ApprovalVo getDocumentNo(String no) {
		return dao.getDocumentNo(sst,no);
	}

	@Override
	//휴가신청서 작성
	public int vacation(VactionVo vo) {
		return dao.vacation(sst,vo);
	}

	@Override
	//휴가신청서 인서트될때 결재문서 업데이트
	public int updateDocumentApproval(Map<String, Object> map) {
		return dao.updateDocumentApproval(sst, map);
	}

	@Override
	//업무보고서 인서트될때 결재문서 업데이트
	public int updateDocumentReport(Map<String, String> map) {
		return dao.updateDocumentReport(sst, map);
	}

	@Override
	//업무보고서 작성
	public int report(Map<String, String> params) {
		return dao.report(sst,params);
	}

	@Override
	//물품 리스트가져오기
	public List<ItemVo> getItemList() {
		return dao.getItemList(sst);
	}

	@Override
	//지출결의서 인서트될때 결재문서 업데이트
	public int updateDocumentExpenditure(Map<String, String> map) {
		return dao.updateDocumentExpenditure(sst,map);
	}

	@Override
	//지출결의서 작성
	public int expenditure(ExpenditureVo evo) {
		return dao.expenditure(sst,evo);
	}

	@Override
	//지출결의서 아이템목록 인서트
	public int expenditureItemList(Map<String, Object> paramValue) {
		return dao.expenditureItemList(sst,paramValue);
	}

	@Override
	//지출결의서 번호 가져오기
	public ExpenditureVo getExpenditureNo(String avoNo) {
		return dao.getExpenditureNo(sst,avoNo);
	}

	@Override
	//결재 문서 리스트로 가져오기
	public List<ApprovalVo> getApproval(Map<String, Object> map) {
		return dao.getApproval(sst , map);
	}

	@Override
	//내가 보낸 결재문서 개수 가져오기
	public int getApprovalFirstPageCnt(String no) {
		return dao.getApprovalFirstPageCnt(sst , no);
	}

	@Override
	//결재자 인서트
	public int approver(ApproverVo appVo) {
		return dao.approver(sst,appVo);
	}

	@Override
	//참조자 인서트
	public int referrer(ApprovalReferrerVo arvo) {
		return dao.referrer(sst,arvo);
	}

	@Override
	//내가받은결재 개수 가져오기
	public int getApprovalCnt(String no) {
		return dao.getApprovalCnt(sst, no);
	}

	@Override
	//내가 받은결재 리스트 가져오기
	public List<ApprovalVo> getMyApproval(Map<String, Object> map) {
		return dao.getMyApproval(sst,map);
	}

	@Override
	//참조받은 결재 카운트
	public int getReferrCnt(String no) {
		return dao.getReferrCnt(sst,no);
	}

	@Override
	//참조받은결재 리스트 가져오기
	public List<ApprovalVo> getReferenceApproval(Map<String, Object> map) {
		return dao.getReferenceApproval(sst,map);
	}

	@Override
	//휴가신청서 상세조회
	public ApprovalVo vacationDetail(String no) {
		return dao.vacationDetail(sst,no);
	}

	@Override
	//결재자 가져오기
	public List<ApproverVo> getApprover(String no) {
		return dao.getApprover(sst,no);
	}

	@Override
	//참조자 가져오기
	public List<ApprovalReferrerVo> getReferrer(String no) {
		return dao.getReferrer(sst,no);
	}

	@Override
	public int firstSubmit(Map<String, String> map) {
		return dao.firstSubmit(sst,map);
	}

	@Override
	public int adYnEdit(String approvalNo) {
		return dao.adYnEdit(sst,approvalNo);
	}

	@Override
	public int reject(Map<String, String> map) {
		return dao.reject(sst,map);
	}

	@Override
	public int adYnReject(String approvalNo) {
		return dao.adYnReject(sst,approvalNo);
	}
    
  @Override
	public ApprovalVo expenditureDetail(String no) {
		return dao.expenditureDetail(sst,no);
	}

	@Override
	//지출결의서로 요청한 물품 개수,수량,가격 가져오기
	public List<ItemVo> getItemInfo(String no) {
		return dao.getItemInfo(sst,no);

	}

	
	@Override
	//결재선정하기 모달창 직원검색
	public List<MemberVo> searchEmployee(String searchValue) {
		return dao.searchEmployee(sst,searchValue);
	}
	

	@Override
	public int getApprovalCntInMain(String no) {
		return dao.getApprovalCntInMain(sst,no);

	}


	
	


//	@Override
//	public List<DocumentVo> getDocumentType(Map<String, String> map) {
//		return dao.getDocumentType(sst,map);
//	}




}//class
