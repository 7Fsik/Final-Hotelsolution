package com.hotelsolution.fire.common.dataroom.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;

@Repository
public class DataRoomDaoImpl implements DataRoomDao {

	@Override
	public List<DataRoomVo> getDataRoomList(SqlSessionTemplate sst, String categoryNo, PageVo dataRoomListPv) {
		RowBounds rb = new RowBounds(dataRoomListPv.getOffset(), dataRoomListPv.getBoardLimit());
		return sst.selectList("dataroom.getDataRoomList", categoryNo, rb);
	}

	@Override
	public int write(SqlSessionTemplate sst, DataRoomVo drvo, List<DataRoomFileVo> drfvoList) {
		int result = sst.insert("dataroom.writeDataroom", drvo);//loginMemberNo 전달되야됨
		if(result !=1) {
			throw new RuntimeException("자료실 작성 에러");
		}
	
		for (DataRoomFileVo drfVo : drfvoList) {
			if(result ==1) {
				
				result = sst.insert("dataroom.writeDataRoomFile", drfVo);
			}else {
				throw new RuntimeException("첨부파일 첨부중 에러");
			}
		}
		
		return result;
	}

	@Override
	public DataRoomVo getDetailDrvo(SqlSessionTemplate sst, String drvoNo) {
		return sst.selectOne("dataroom.getDetailDrvo",drvoNo);
	}


	@Override
	public List<DataRoomFileVo> getDetailDrfvoList(SqlSessionTemplate sst, String drvoNo) {
		return sst.selectList("dataroom.getDetailDrfoList",drvoNo);
	}

	@Override
	public int getDataRoomCnt(SqlSessionTemplate sst, String categoryNo) {
		return sst.selectOne("dataroom.getDataRoomCnt", categoryNo);
	}

	@Override
	public int increaseHit(SqlSessionTemplate sst, String drvoNo) {
		return sst.update("dataroom.increaseHit",drvoNo);
	}
		

}