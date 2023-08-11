package com.hotelsolution.fire.finance.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.finance.dao.FinanceDao;
import com.hotelsolution.fire.finance.vo.FrontVo;
import com.hotelsolution.fire.finance.vo.RestaurantVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FinanceServiceImpl implements FinanceService{
	
	private final FinanceDao fd;
	private final SqlSessionTemplate sst;

	@Override
	public List<FrontVo> fgetDaySales() {
		return fd.fgetDaySales(sst);
	}

	@Override
	public List<RestaurantVo> rgetDaySales() {
		return fd.rgetDaySales(sst);
	}

}
