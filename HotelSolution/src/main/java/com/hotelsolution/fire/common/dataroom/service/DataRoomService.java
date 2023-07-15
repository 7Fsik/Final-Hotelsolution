package com.hotelsolution.fire.common.dataroom.service;

import java.util.List;

import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;

public interface DataRoomService {

	List<DataRoomVo> getDataRoomList(String no);

	int write(DataRoomVo drvo, List<DataRoomFileVo> drfvoList);

}
