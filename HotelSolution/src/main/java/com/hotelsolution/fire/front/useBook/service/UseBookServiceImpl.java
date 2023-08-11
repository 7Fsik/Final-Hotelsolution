package com.hotelsolution.fire.front.useBook.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.dao.UseBookDao;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UseBookServiceImpl implements UseBookService{
	
	private final UseBookDao ud;
	
	private final SqlSessionTemplate sst;

	@Override
	public List<Integer> getBookNo(String startDate, String endDate) {
		return ud.getBookNo(sst,startDate,endDate);
	}

//	@Override
////	public List<UseBookVo> getRoomList(List<Integer> numList,PageVo pv) {
//		return ud.getRoomList(sst,numList,pv);
//	}

//	@Override
//	public int getRoomCnt(List<Integer> numList) {
//		return ud.getRoomCnt(sst,numList);
//	}

	@Override
	public int getRoomCnt() {
		return ud.getRoomCnt(sst);
	}
	
	@Override
	public List<UseBookVo> getRoomList(PageVo pv,Map<String, String> dateMap) {
		return ud.getRoomList(sst,pv,dateMap);
	}

	@Override
	public List<UseBookVo> bookCheck(Map<String, String> paramMap) {
		return ud.bookCheck(sst,paramMap);
	}

	@Override
	public UseBookVo roomInt(Map<String, String> paramMap) {
		return ud.roomInt(sst,paramMap);
	}

	@Override
	public int useBook(Map<String, String> paramMap) {
		return ud.useBook(sst,paramMap);
	}

	@Override
	public int setGuest(Map<String, String> paramMap) {
		return ud.setGuest(sst,paramMap);
	}

	@Override
	public int getGuest(Map<String, String> paramMap) {
		return ud.getGuest(sst,paramMap);
	
	}

//	@Override
//	public int use(Map<String, String> paramMap) {
//		return ud.getUse(sst,paramMap);
//	}

	@Override
	public int getBookListNo(Map<String, String> paramMap) {
		return ud.getBookListNo(sst,paramMap);
	}

	@Override
	public int setRoomUse(Map <String,String> lastMap) {
		return ud.setRoomUse(sst,lastMap);
	}



}
