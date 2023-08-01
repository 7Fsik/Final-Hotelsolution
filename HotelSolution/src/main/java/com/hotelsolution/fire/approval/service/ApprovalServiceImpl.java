package com.hotelsolution.fire.approval.service;

import java.lang.reflect.Member;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.approval.dao.ApprovalDao;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ApprovalServiceImpl implements ApprovalService{

	private final ApprovalDao dao;
	SqlSessionTemplate sst;




}//class
