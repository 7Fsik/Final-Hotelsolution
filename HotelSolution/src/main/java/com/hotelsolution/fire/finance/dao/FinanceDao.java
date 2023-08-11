package com.hotelsolution.fire.finance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.finance.vo.FrontVo;
import com.hotelsolution.fire.finance.vo.RestaurantVo;

public interface FinanceDao {

	List<FrontVo> fgetDaySales(SqlSessionTemplate sst);

	List<RestaurantVo> rgetDaySales(SqlSessionTemplate sst);

}
