package com.hotelsolution.fire.front.useManage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useManage.vo.FoodOrderVo;
import com.hotelsolution.fire.front.useManage.vo.RoomOrderVo;
import com.hotelsolution.fire.front.useManage.vo.UseManageVo;

@Repository
public class UseManageDaoImpl implements UseManageDao{

	@Override
	public int getUseCnt(SqlSessionTemplate sst, String date,String searchValue) {
		Map<String,String>pMap = new HashMap<>();
		pMap.put("date",date);
		pMap.put("searchValue",searchValue);
		
		return sst.selectOne("useManage.getUseCnt", pMap);
	}

	@Override
	public List<UseManageVo> getUseList(SqlSessionTemplate sst, PageVo pv, String date, String searchValue) {

		Map<String,String>pMap = new HashMap<>();
		pMap.put("date",date);
		pMap.put("searchValue",searchValue);
		
		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		
		return sst.selectList("useManage.getUseList", pMap, rb);
	}

	@Override
	public UseManageVo getUseByNo(SqlSessionTemplate sst, int no) {
		return sst.selectOne("useManage.getUseByNo", no);
	}

	@Override
	public List<RoomOrderVo> roomOrderList(SqlSessionTemplate sst, int no) {
		return sst.selectList("useManage.roomOrderList", no);
	}

	@Override
	public List<FoodOrderVo> foodOrderList(SqlSessionTemplate sst, int no) {
		return sst.selectList("useManage.foodOrderList", no);
	}

	@Override
	public List<RoomOrderVo> roomSearch(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("useManage.roomSearch", searchValue);
	}

	@Override
	public List<FoodOrderVo> foodSearch(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("useManage.foodSearch", searchValue);
	}

	@Override
	public int foodOrder(SqlSessionTemplate sst, Map<String, Object> foodOrderMap) {
		return sst.insert("useManage.foodOrder", foodOrderMap);
	}

	@Override
	public int roomOrder(SqlSessionTemplate sst, Map<String, Object> roomOrderMap) {
		return sst.insert("useManage.roomOrder", roomOrderMap);
	}

}
