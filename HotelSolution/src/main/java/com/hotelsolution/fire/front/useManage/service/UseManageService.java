package com.hotelsolution.fire.front.useManage.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useManage.vo.FoodOrderVo;
import com.hotelsolution.fire.front.useManage.vo.RoomOrderVo;
import com.hotelsolution.fire.front.useManage.vo.UseManageVo;

public interface UseManageService {

	int getUseCnt(String date, String searchValue);

	List<UseManageVo> getUseList(PageVo pv, String date, String searchValue);

	UseManageVo getUseByNo(int no);

	List<RoomOrderVo> roomOrderList(int no);

	List<FoodOrderVo> foodOrderList(int no);

	List<RoomOrderVo> roomSearch(String searchValue);

	List<FoodOrderVo> foodSearch(String searchValue);

	int foodOrder(Map<String, Object> foodOrderMap);

	int roomOrder(Map<String, Object> roomOrderMap);


}
