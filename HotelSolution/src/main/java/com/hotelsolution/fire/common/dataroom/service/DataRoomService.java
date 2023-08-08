package com.hotelsolution.fire.common.dataroom.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

public interface DataRoomService {

	List<DataRoomVo> getDataRoomList(Map<String, Object> map);

	int write(DataRoomVo drvo, List<DataRoomFileVo> drfvoList);

	DataRoomVo getDetailDrvo(String drvoNo);


	List<DataRoomFileVo> getDetailDrfvoList(String drvoNo);

	int getDataRoomCnt(Map<String, Object> map);

	int deleteDate(String dataNo);

}
