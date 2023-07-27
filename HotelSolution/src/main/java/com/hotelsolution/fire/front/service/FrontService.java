package com.hotelsolution.fire.front.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.front.vo.ItemVo;

public interface FrontService {

//	List<ItemVo> itemList(Map<String, String> paramMap);

	List<ItemVo> getItemList(Map<String, String> paramMap);

}
