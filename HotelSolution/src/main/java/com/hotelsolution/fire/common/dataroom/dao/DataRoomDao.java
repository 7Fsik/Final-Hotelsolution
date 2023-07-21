package com.hotelsolution.fire.common.dataroom.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

public interface DataRoomDao {


	int write(SqlSessionTemplate sst, DataRoomVo drvo, List<DataRoomFileVo> drfvoList);

	DataRoomVo getDetailDrvo(SqlSessionTemplate sst, String drvoNo);

	List<DataRoomFileVo> getDetailDrfvoList(SqlSessionTemplate sst, String drvoNo);

	int getDataRoomCnt(SqlSessionTemplate sst, String categoryNo);

	int increaseHit(SqlSessionTemplate sst, String drvoNo);

	List<DataRoomVo> getDataRoomList(SqlSessionTemplate sst, Map<String, Object> map);

}
