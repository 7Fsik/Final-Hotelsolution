package com.hotelsolution.fire.common.dataroom.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.common.dataroom.dao.DataRoomDao;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DataRoomServiceImpl implements DataRoomService {
	
	private final DataRoomDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<DataRoomVo> getDataRoomList(String no) {
		
		return dao.getDataRoomList(sst, no);
	}
	
	@Override
	public int write(DataRoomVo drvo, List<DataRoomFileVo> drfvoList) {
		
		return dao.write(sst, drvo, drfvoList);
	}

}
