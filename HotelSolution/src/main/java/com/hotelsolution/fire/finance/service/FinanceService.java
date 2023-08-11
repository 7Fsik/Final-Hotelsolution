package com.hotelsolution.fire.finance.service;

import java.util.List;

import com.hotelsolution.fire.finance.vo.FrontVo;
import com.hotelsolution.fire.finance.vo.RestaurantVo;

public interface FinanceService {

	List<FrontVo> fgetDaySales();

	List<RestaurantVo> rgetDaySales();

}
