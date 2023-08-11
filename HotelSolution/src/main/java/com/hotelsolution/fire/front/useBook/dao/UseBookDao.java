package com.hotelsolution.fire.front.useBook.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

public interface UseBookDao {

	List<Integer> getBookNo(SqlSessionTemplate sst, String startDate, String endDate);

//	List<UseBookVo> getRoomList(SqlSessionTemplate sst, List<Integer> numList, PageVo pv);

//	int getRoomCnt(SqlSessionTemplate sst, List<Integer> numList);

	//룸갯수 
	int getRoomCnt(SqlSessionTemplate sst);
	//룸 정보 
	List<UseBookVo> getRoomList(SqlSessionTemplate sst, PageVo pv, Map<String, String> dateMap);
	//예약있는 방호수
	List<UseBookVo> bookCheck(SqlSessionTemplate sst, Map<String, String> paramMap);
	// 방 정보 
	UseBookVo roomInt(SqlSessionTemplate sst, Map<String, String> paramMap);
	
	
	//예약하기
	int useBook(SqlSessionTemplate sst, Map<String, String> paramMap);
	//손님 설정
	int setGuest(SqlSessionTemplate sst, Map<String, String> paramMap);
	//손님 번호 가져오기 
	int getGuest(SqlSessionTemplate sst, Map<String, String> paramMap);
	
	
	//바로 이용하기 
//	int getUse(SqlSessionTemplate sst, Map<String, String> paramMap);

	int getBookListNo(SqlSessionTemplate sst, Map<String, String> paramMap);

	int setRoomUse(SqlSessionTemplate sst, Map<String, String> lastMap);

}
