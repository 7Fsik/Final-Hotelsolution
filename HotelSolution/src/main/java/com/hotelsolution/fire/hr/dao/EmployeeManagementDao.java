package com.hotelsolution.fire.hr.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.member.vo.MemberVo;
@Repository
public class EmployeeManagementDao {

	public List<MemberVo> getNewList(SqlSessionTemplate sst) {
		return sst.selectList("member.getNewList");
	}

	public List<MemberVo> getMemberList(SqlSessionTemplate sst) {
		return sst.selectList("member.getMemberList");
	}

	public int getMemberCnt(SqlSessionTemplate sst) {
		return sst.selectOne("member.getMemberCnt");
	}

}
