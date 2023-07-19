package com.hotelsolution.fire.hr.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public List<MemberVo> getNewList() {
		return dao.getNewList(sst);
	}

	public List<MemberVo> getMemberList() {
		return  dao.getMemberList(sst);
	}

	public int getMemberCnt() {
		return dao.getMemberCnt(sst);
	}

}
