package com.hotelsolution.fire.front.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.front.vo.ItemVo;
@Repository
public class FrontDaoImpl implements FrontDao{

//	@Override
//	public List<ItemVo> itemList(SqlSessionTemplate sst, Map<String, String> paramMap) {
//		System.out.println(paramMap);
//		return sst.selectList("front.itemList", paramMap);
//	}

	@Override
	public List<ItemVo> getItemList(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectList("front.getItemList", paramMap);
	}

	@Override
	public int edit(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.update("front.edit",paramMap);
	}

}
