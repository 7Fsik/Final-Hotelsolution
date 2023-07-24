package com.hotelsolution.fire.common.dataroom.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.common.dataroom.dao.DataRoomDao;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DataRoomServiceImpl implements DataRoomService {
	
	private final DataRoomDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<DataRoomVo> getDataRoomList(Map<String, Object> map) {
		
		return dao.getDataRoomList(sst,  map);
	}
	
	@Override
	public int write(DataRoomVo drvo, List<DataRoomFileVo> drfvoList) {
		
		return dao.write(sst, drvo, drfvoList);
	}

	@Override
	public DataRoomVo getDetailDrvo(String drvoNo) {
		int result = dao.increaseHit(sst, drvoNo);
		if(result!=1) {
			throw new RuntimeException("조회수 증가 실패");
		}
		return dao.getDetailDrvo(sst,drvoNo);
	}


	@Override
	public List<DataRoomFileVo> getDetailDrfvoList(String drvoNo) {
		return dao.getDetailDrfvoList(sst, drvoNo);
	}

	@Override
	public int getDataRoomCnt(Map<String, Object> map) {
		return dao.getDataRoomCnt(sst, map);
	}

}
