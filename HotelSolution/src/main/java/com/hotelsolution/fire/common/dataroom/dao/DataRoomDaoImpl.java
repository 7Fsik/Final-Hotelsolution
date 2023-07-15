package com.hotelsolution.fire.common.dataroom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;

@Repository
public class DataRoomDaoImpl implements DataRoomDao {

	@Override
	public List<DataRoomVo> getDataRoomList(SqlSessionTemplate sst, String no) {
		return sst.selectList("dataroom.getDataRoomList", no);
	}

	@Override
	public int write(SqlSessionTemplate sst, DataRoomVo drvo, List<DataRoomFileVo> drfvoList) {
		int result = sst.insert("survey.writeDataroom", drvo);
		if(result !=1) {
			throw new RuntimeException("자료실 작성 에러");
		}
	
		for (DataRoomFileVo drfVo : drfvoList) {
			if(result ==1) {
				
				result = sst.insert("survey.writeDataRoomFile", drfVo);
			}else {
				throw new RuntimeException("첨부파일 첨부중 에러");
			}
		}
		
		return result;
	}
		

}
