package com.hotelsolution.fire.hr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.member.vo.MemberVo;
@Repository
public class EmployeeManagementDao {

	public List<MemberVo> getNewList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("member.getNewList",null,rb);
	}

	public List<MemberVo> getMemberList(SqlSessionTemplate sst, Map<String, Object> map) {
		PageVo pv = (PageVo) map.get("pv");
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("member.getMemberList",map,rb);
	}

	public int getMemberCnt(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.selectOne("member.getMemberCnt",map);
	}

	public int acceptNewMember(SqlSessionTemplate sst, String memberNo) {
//		int no = Integer.parseInt(memberNo);
		return sst.update("member.acceptNewMember",memberNo);
	}

	public MemberVo getDetail(SqlSessionTemplate sst, String memberNo) {
		System.out.println("dao");
		return sst.selectOne("member.getDetail", memberNo);
	}

	

	public int edit(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("member.edit", vo);
	}

}
