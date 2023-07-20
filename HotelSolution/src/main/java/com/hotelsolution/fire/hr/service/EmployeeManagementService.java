package com.hotelsolution.fire.hr.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.dao.EmployeeManagementDao;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class EmployeeManagementService {
	
	private final EmployeeManagementDao dao;
	private final SqlSessionTemplate sst;
	
	public List<MemberVo> getNewList(PageVo pv) {
		return dao.getNewList(sst, pv);
	}

	public List<MemberVo> getMemberList(PageVo pv) {
		return  dao.getMemberList(sst,pv);
	}

	public int getMemberCnt() {
		return dao.getMemberCnt(sst);
	}

	public int acceptNewMember(String memberNo) {
		return dao.acceptNewMember(sst,memberNo);
	}

	public MemberVo getDetail(String memberNo) {
		System.out.println("서비스");
		return dao.getDetail(sst,memberNo);
	}

}
