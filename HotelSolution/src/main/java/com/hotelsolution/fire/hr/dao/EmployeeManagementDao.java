package com.hotelsolution.fire.hr.dao;

import java.util.List;

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

	public List<MemberVo> getMemberList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("member.getMemberList",null,rb);
	}

	public int getMemberCnt(SqlSessionTemplate sst) {
		return sst.selectOne("member.getMemberCnt");
	}

	public int acceptNewMember(SqlSessionTemplate sst, String memberNo) {
//		int no = Integer.parseInt(memberNo);
		return sst.update("member.acceptNewMember",memberNo);
	}

}
