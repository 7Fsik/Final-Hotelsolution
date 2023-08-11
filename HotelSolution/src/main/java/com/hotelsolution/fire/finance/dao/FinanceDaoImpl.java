package com.hotelsolution.fire.finance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.finance.vo.FrontVo;
import com.hotelsolution.fire.finance.vo.RestaurantVo;

@Repository
public class FinanceDaoImpl implements FinanceDao{

	@Override
	public List<FrontVo> fgetDaySales(SqlSessionTemplate sst) {
		return sst.selectList("finance.front");
	}

	@Override
	public List<RestaurantVo> rgetDaySales(SqlSessionTemplate sst) {
		return sst.selectList("finance.restaurant");
	}

	
	
	
}
