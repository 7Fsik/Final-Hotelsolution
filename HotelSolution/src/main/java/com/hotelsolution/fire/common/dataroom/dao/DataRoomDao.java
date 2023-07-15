package com.hotelsolution.fire.common.dataroom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;

public interface DataRoomDao {

	List<DataRoomVo> getDataRoomList(SqlSessionTemplate sst, String no);

	int write(SqlSessionTemplate sst, DataRoomVo drvo, List<DataRoomFileVo> drfvoList);

}
