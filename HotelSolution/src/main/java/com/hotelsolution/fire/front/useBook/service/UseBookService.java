package com.hotelsolution.fire.front.useBook.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

public interface UseBookService {

	List<Integer> getBookNo(String startDate, String endDate);

//	List<UseBookVo> getRoomList(List<Integer> numList, PageVo pv);

//	int getRoomCnt(List<Integer> numList);

	int getRoomCnt();
	//방가져오기 
	List<UseBookVo> getRoomList(PageVo pv, Map<String,String> dateMap);
	//예약있는 방호수 가져오기
	List<UseBookVo> bookCheck(Map<String, String> paramMap);
	// 방정보 가져오기 
	UseBookVo roomInt(Map<String, String> paramMap);
	//예약 하기 
	int useBook(Map<String, String> paramMap);
	//손님 입력
	int setGuest(Map<String, String> paramMap);
	//손님 넘버 가져오기 
	int getGuest(Map<String, String> paramMap);
//	//바로 이용하기 
//	int use(Map<String, String> paramMap);
	//입력값 no 가져오기
	int getBookListNo(Map<String, String> paramMap);
	//룸 이용
	int setRoomUse(Map<String, String> lastMap);

}
