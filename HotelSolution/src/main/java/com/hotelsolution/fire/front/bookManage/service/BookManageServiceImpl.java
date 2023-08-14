package com.hotelsolution.fire.front.bookManage.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.bookManage.dao.BookManageDao;
import com.hotelsolution.fire.front.bookManage.vo.BookManageVo;
import com.hotelsolution.fire.front.status.dao.StatusDao;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class BookManageServiceImpl implements BookManageService{

	private final SqlSessionTemplate sst;
	private final BookManageDao dao;
	
	@Override
	public List<BookManageVo> list(PageVo pv, String searchType ,String searchValue) {
		return dao.list(sst,pv,searchType,searchValue);
	}

	@Override
	public int getBookCnt() {
		return dao.getBookCnt(sst);
	}

	@Override
	public BookManageVo getBookByNo(int no) {
		return dao.getBookByNo(sst,no);
	}

	@Override
	public int checkIn(Map<String,String>paramMap) {
		return dao.checkIn(sst,paramMap);
	}

	@Override
	public int cencel(Map<String,String>paramMap) {
		return dao.cencel(sst,paramMap);
	}

	@Override
	public List<BookManageVo> useList() {
		return dao.useList(sst);
	}

}
