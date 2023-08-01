package com.hotelsolution.fire.workout.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.work.session.WorkSession;
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
	public int recordEndTime(SqlSessionTemplate sst, String workoutNo) {
		return sst.update("workout.recordEndTime" , workoutNo);
	}

	@Override
	//출근시간 가져오기
	public Date getStartTime(SqlSessionTemplate sst, String userNo) {
		return sst.selectOne("workout.getStartTime" , userNo);
	}

	@Override
	//퇴근시간 가져오기
	public Date getEndTime(SqlSessionTemplate sst, String userNo) {
		return sst.selectOne("workout.getEndTime" , userNo);
	}

	@Override
	//기록 번호 가져오기
	public WorkoutVo getCommuteRecordNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("workout.getCommuteRecordNo" , no);
	}

	@Override
	public int updateTotalWorkHours(SqlSessionTemplate sst, String workoutNo) {
		return sst.update("workout.updateTotalWorkHours" , workoutNo);
	}

	


}
