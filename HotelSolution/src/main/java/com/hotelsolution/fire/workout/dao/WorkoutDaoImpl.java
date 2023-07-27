package com.hotelsolution.fire.workout.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.workout.vo.WorkoutVo;

@Repository
public class WorkoutDaoImpl implements WorkoutDao{

	@Override
	//출근시간 기록
	public int recordStartTime(SqlSessionTemplate sst, String no) {
		return sst.insert("workout.recordStartTime" , no);
	}

	@Override
	//퇴근시간 기록
	public int recordEndTime(SqlSessionTemplate sst, String no) {
		return sst.insert("workout.recordEndTime" , no);
	}

}
