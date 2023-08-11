package com.hotelsolution.fire.front.useBook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

@Repository
public class UseBookDaoImpl implements UseBookDao{
	
//	//리스트 가져오기 
//	@Override
//	public List<UseBookVo> getRoomList(SqlSessionTemplate sst, List<Integer> numList,PageVo pv) {
//		
////		Map<String, Object> paramMap = new HashMap<>();
////	    paramMap.put("numList", numList);
//     
//		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
//	     
//		return sst.selectList("useBook.getRoomList", numList,rb);
//		
//	}
	
	@Override
	public List<Integer> getBookNo(SqlSessionTemplate sst,String startDate, String endDate) {
		
		Map<String,String>pMap = new HashMap<>();
		pMap.put("startDate",startDate);
		pMap.put("endDate",endDate);
		return  sst.selectList("useBook.getBookNo", pMap);
	}

//	@Override
//	public int getRoomCnt(SqlSessionTemplate sst, List<Integer> numList) {
//		Map<String, Object> paramMap = new HashMap<>();
//	     paramMap.put("numList", numList);
//		return sst.selectOne("useBook.getRoomCnt", paramMap);
//	}

	@Override
	public int getRoomCnt(SqlSessionTemplate sst) {
		return sst.selectOne("useBook.getRoomCnt");
	}

	@Override
	public List<UseBookVo> getRoomList(SqlSessionTemplate sst, PageVo pv , Map<String, String> dateMap) {
		
		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		
		return sst.selectList("useBook.getRoomList",dateMap, rb);
	}

	@Override
	public List<UseBookVo> bookCheck(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectList("useBook.bookCheck", paramMap);
	}

	@Override
	public UseBookVo roomInt(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("useBook.getRoomList", paramMap);
	}

	@Override
	public int useBook(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.insert("useBook.useBook", paramMap);
	}

	@Override
	public int setGuest(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.insert("useBook.setGuest", paramMap);
	}

	@Override
	public int getGuest(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("useBook.getGuest", paramMap);
	}

//	@Override
//	public int getUse(SqlSessionTemplate sst, Map<String, String> paramMap) {
//		return sst.insert("useBook.use", paramMap);
//	}

	@Override
	public int getBookListNo(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("useBook.getBookListNo", paramMap);
	}

	@Override
	public int setRoomUse(SqlSessionTemplate sst,Map <String,String> lastMap) {
		return sst.insert("useBook.setRoomUse", lastMap);
	}


}
