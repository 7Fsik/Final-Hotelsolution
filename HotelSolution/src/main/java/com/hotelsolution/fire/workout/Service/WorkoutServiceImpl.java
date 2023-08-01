package com.hotelsolution.fire.workout.Service;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.work.session.WorkSession;
import com.hotelsolution.fire.workout.dao.WorkoutDao;
import com.hotelsolution.fire.workout.vo.WorkoutVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class WorkoutServiceImpl implements WorkoutService{

	private final SqlSessionTemplate sst;
	private final WorkoutDao dao;
	
	@Override
	//출근시간 기록
	public int recordStartTime(String no) {
		return dao.recordStartTime(sst,no);
	}

	@Override
	//퇴근시간 기록
	public int recordEndTime(String workoutNo) {
		return dao.recordEndTime(sst,workoutNo);
	}

	@Override
	//출근시간 가져오기
	public Date getStartTime(String userNo) {
		return dao.getStartTime(sst,userNo);
	}

	@Override
	//퇴근시간 가져오기
	public Date getEndTime(String userNo) {
		return dao.getEndTime(sst,userNo);
	}

	@Override
	public WorkoutVo getCommuteRecordNo(String no) {
		return dao.getCommuteRecordNo(sst,no);
	}

	@Override
	public int updateTotalWorkHours(String workoutNo) {
		return dao.updateTotalWorkHours(sst,workoutNo);
	}


}
