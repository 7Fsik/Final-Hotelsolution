package com.hotelsolution.fire.approval.dao;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class ApprovalDaoImpl implements ApprovalDao{

	@Override
	public List<PositionVo> getPositionList(SqlSessionTemplate sst) {
		return sst.selectList("approval.getPositionList");
	}

	@Override
	public List<TeamVo> getTeamList(SqlSessionTemplate sst) {
		return sst.selectList("approval.getTeamList");
	}

	@Override
	public List<MemberVo> getEmployee(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("approval.getEmployee" , map);
	}

	@Override
	public List<MemberVo> getDecideEmployee(SqlSessionTemplate sst, Map<String, String> params) {
		return sst.selectList("approval.getDecideEmployee" , params );
	}

	@Override
	public DocumentVo getDocumentVactionNo(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("approval.getDocumentVactionNo" , map);
	}

	@Override
	public DocumentVo getDocumentExpenditureNo(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("approval.getDocumentExpenditureNo" , map);
	}

	@Override
	public DocumentVo getDocumentReportNo(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("approval.getDocumentReportNo" , map);
	}

	@Override
	public int insertApprovalDocument(SqlSessionTemplate sst, ApprovalVo avo) {
		return sst.insert("approval.insertApprovalDocument" , avo);
	}
	
	@Override
	public ApprovalVo getDocumentNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.getDocumentNo" , no);
	}
	
	@Override
	public int vacation(SqlSessionTemplate sst, VactionVo vo) {
		return sst.insert("approval.vacation" , vo);
	}

	@Override
	public int updateDocumentApproval(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("approval.updateDocumentApproval" , map);
	}

	@Override
	public int updateDocumentReport(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("approval.updateDocumentReport" , map);
	}

	@Override
	public int report(SqlSessionTemplate sst, Map<String, String> params) {
		return sst.insert("approval.report" , params);
	}

	@Override
	public List<ItemVo> getItemList(SqlSessionTemplate sst) {
		return sst.selectList("approval.getItemList");
	}

	@Override
	public int updateDocumentExpenditure(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("approval.updateDocumentExpenditure" , map);
	}

	@Override
	public int expenditure(SqlSessionTemplate sst, ExpenditureVo evo) {
		return sst.insert("approval.expenditure" , evo);
	}

	@Override
	public int expenditureItemList(SqlSessionTemplate sst, Map<String, Object> paramValue) {
		List<String> itemList = (List) paramValue.get("item");
		List<String> countList = (List) paramValue.get("count");
		
		System.out.println("daoItemList : "+itemList.size());
		System.out.println("map : " +paramValue);
		Map<String,Object> map = new HashMap<>();
		
		int result = 0;
		for(int i=0; i<itemList.size(); i++) {
			map.put("item", itemList.get(i));
			map.put("count", countList.get(i));
			map.put("keyNo", paramValue.get("keyNo"));
			
			 result = sst.insert("approval.expenditureItemList" , map);
			 System.out.println(result);
		}
		
		return result; 
	}

	@Override
	public ExpenditureVo getExpenditureNo(SqlSessionTemplate sst, String avoNo) {
		return sst.selectOne("approval.getExpenditureNo" , avoNo);
	}

	@Override
	public List<ApprovalVo> getApproval(SqlSessionTemplate sst , Map<String, Object> map) {
		PageVo pv = (PageVo)map.get("pv");
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("approval.getApproval", map , rb);
	}

	@Override
	public int getApprovalFirstPageCnt(SqlSessionTemplate sst , String no) {
		return sst.selectOne("approval.getApprovalFirstPageCnt" , no);
	}

	@Override
	public int approver(SqlSessionTemplate sst, ApproverVo appVo) {
		return sst.insert("approval.approver" , appVo);
	}

	@Override
	public int referrer(SqlSessionTemplate sst, ApprovalReferrerVo arvo) {
		return sst.insert("approval.referrer" , arvo);
	}

	@Override
	public int getApprovalCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.getApprovalCnt" , no);
	}

	@Override
	public List<ApprovalVo> getMyApproval(SqlSessionTemplate sst, Map<String, Object> map) {
		PageVo pv = (PageVo)map.get("pv");
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("approval.getMyApproval" , map , rb);
	}

	@Override
	public int getReferrCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.getReferrCnt" , no);
	}

	@Override
	public List<ApprovalVo> getReferenceApproval(SqlSessionTemplate sst, Map<String, Object> map) {
		PageVo pv = (PageVo)map.get("pv");
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("approval.getReferenceApproval" , map , rb);
	}

	@Override
	public ApprovalVo vacationDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.vacationDetail" , no);
	}

	@Override
	public List<ApproverVo> getApprover(SqlSessionTemplate sst, String no) {
		return sst.selectList("approval.getApprover" , no);
	}

	@Override
	public List<ApprovalReferrerVo> getReferrer(SqlSessionTemplate sst, String no) {
		return sst.selectList("approval.getReferrer" , no);
	}

	@Override

	public int firstSubmit(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("approval.firstSubmit",map);
	}

	@Override
	public int adYnEdit(SqlSessionTemplate sst, String approvalNo) {
		return sst.update("approval.adYnEdit",approvalNo);
	}

	@Override
	public int reject(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("approval.reject",map);
	}

	@Override
	public int adYnReject(SqlSessionTemplate sst, String approvalNo) {
		return sst.update("approval.adYnReject",approvalNo);
    
  @Ocerrride
	public ApprovalVo expenditureDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.expenditureDetail" , no);
	}

	@Override
	public List<ItemVo> getItemInfo(SqlSessionTemplate sst, String no) {
		return sst.selectList("approval.getItemInfo" , no);

	}



//	@Override
//	public List<DocumentVo> getDocumentType(SqlSessionTemplate sst, Map<String, String> map) {
//		return sst.selectList("approval.getDocumentType" , map);
//	}
	
	


}
