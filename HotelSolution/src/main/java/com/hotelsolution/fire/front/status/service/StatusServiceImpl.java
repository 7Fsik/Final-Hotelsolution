package com.hotelsolution.fire.front.status.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.status.dao.StatusDao;
import com.hotelsolution.fire.front.status.vo.StatusVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class StatusServiceImpl implements StatusService{

	private final StatusDao sd;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<StatusVo> list(PageVo pv, String searchType ,String searchValue) {
		return sd.list(sst,pv,searchType ,searchValue);
	}

	@Override
	public int getRoomCnt() {
		return sd.getRoomCnt(sst);
	}

	@Override
	public StatusVo getRoomByNo(int no) {
		return sd.getRoomByNo(sst,no);
	}

}
