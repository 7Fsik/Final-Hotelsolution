package com.hotelsolution.fire.front.status.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.status.vo.StatusVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StatusDaoImpl implements StatusDao{

	
	
	@Override
	public List<StatusVo> list(SqlSessionTemplate sst, PageVo pv, String searchType ,String searchValue) {
		 Map<String, Object> search = new HashMap<>();
		 search.put("searchType", searchType);
		 search.put("searchValue", searchValue);
		 
		 RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		
		return sst.selectList("status.selectRoomList",search,rb);
	}

	@Override
	public int getRoomCnt(SqlSessionTemplate sst) {
		return sst.selectOne("status.getRoomCnt");
	}

	@Override
	public StatusVo getRoomByNo(SqlSessionTemplate sst, int no) {
		return sst.selectOne("status.getRoomByNo", no);
	}

	@Override
	public int roomStatusEdit(SqlSessionTemplate sst, StatusVo vo) {
		return sst.update("status.edit", vo);
	}

}
