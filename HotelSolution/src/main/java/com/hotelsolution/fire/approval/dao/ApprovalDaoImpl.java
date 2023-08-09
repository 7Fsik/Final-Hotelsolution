package com.hotelsolution.fire.approval.dao;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.approval.vo.ApprovalVo;
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
	public int vacation(SqlSessionTemplate sst, Map<String, Object> params) {
		return sst.insert("approval.vacation" , params);
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
	public int expenditure(SqlSessionTemplate sst, Map<String, Object> params) {
		return sst.insert("approval.expenditure" , params);
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
	public List<ApprovalVo> getApproval(SqlSessionTemplate sst , PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("approval.getApproval", null , rb);
	}

	@Override
	public int getApprovalCnt(SqlSessionTemplate sst) {
		return sst.selectOne("approval.getApprovalCnt");
	}



//	@Override
//	public List<DocumentVo> getDocumentType(SqlSessionTemplate sst, Map<String, String> map) {
//		return sst.selectList("approval.getDocumentType" , map);
//	}
	
	


}
