package com.hotelsolution.fire.front.useManage.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useManage.dao.UseManageDao;
import com.hotelsolution.fire.front.useManage.vo.FoodOrderVo;
import com.hotelsolution.fire.front.useManage.vo.RoomOrderVo;
import com.hotelsolution.fire.front.useManage.vo.UseManageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UseManageServiceImpl implements UseManageService{
	
	private final UseManageDao ud;
	private final SqlSessionTemplate sst;

	@Override
	public int getUseCnt(String date,String SearchValue) {
		return ud.getUseCnt(sst,date,SearchValue);
	}

	@Override
	public List<UseManageVo> getUseList(PageVo pv, String date, String searchValue) {
		return ud.getUseList(sst,pv,date,searchValue);
	}

	@Override
	public UseManageVo getUseByNo(int no) {
		return ud.getUseByNo(sst,no);
	}

	@Override
	public List<RoomOrderVo> roomOrderList(int no) {
		return ud.roomOrderList(sst,no);
	}

	@Override
	public List<FoodOrderVo> foodOrderList(int no) {
		return ud.foodOrderList(sst,no);
	}

	@Override
	public List<RoomOrderVo> roomSearch(String searchValue) {
		return ud.roomSearch(sst,searchValue);
	}

	@Override
	public List<FoodOrderVo> foodSearch(String searchValue) {
		return ud.foodSearch(sst,searchValue);
	}

	@Override
	public int foodOrder(Map<String, Object> foodOrderMap) {
		return ud.foodOrder(sst, foodOrderMap);
	}

	@Override
	public int roomOrder(Map<String, Object> roomOrderMap) {
		return ud.roomOrder(sst, roomOrderMap);
	}

	@Override
	public int payment(Map<String, String> paramMap) {
		return ud.payment(sst,paramMap);
	}

	

}
