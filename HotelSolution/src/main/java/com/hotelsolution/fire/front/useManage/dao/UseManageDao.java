package com.hotelsolution.fire.front.useManage.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useManage.vo.FoodOrderVo;
import com.hotelsolution.fire.front.useManage.vo.RoomOrderVo;
import com.hotelsolution.fire.front.useManage.vo.UseManageVo;

public interface UseManageDao {

	//목록
	int getUseCnt(SqlSessionTemplate sst, String date, String searchValue);

	List<UseManageVo> getUseList(SqlSessionTemplate sst, PageVo pv, String date, String searchValue);

	//디테일
	UseManageVo getUseByNo(SqlSessionTemplate sst, int no);

	//모달
	List<RoomOrderVo> roomOrderList(SqlSessionTemplate sst, int no);

	List<FoodOrderVo> foodOrderList(SqlSessionTemplate sst, int no);

	List<RoomOrderVo> roomSearch(SqlSessionTemplate sst, String searchValue);

	List<FoodOrderVo> foodSearch(SqlSessionTemplate sst, String searchValue);

	int foodOrder(SqlSessionTemplate sst, Map<String, Object> foodOrderMap);

	int roomOrder(SqlSessionTemplate sst, Map<String, Object> roomOrderMap);

	//결제 
	int payment(SqlSessionTemplate sst, Map<String, String> paramMap);

}
