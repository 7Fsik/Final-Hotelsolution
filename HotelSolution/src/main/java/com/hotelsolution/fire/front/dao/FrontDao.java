package com.hotelsolution.fire.front.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.front.vo.ItemVo;

public interface FrontDao {

//	List<ItemVo> itemList(SqlSessionTemplate sst, Map<String, String> paramMap);

	List<ItemVo> getItemList(SqlSessionTemplate sst, Map<String, String> paramMap);

}
