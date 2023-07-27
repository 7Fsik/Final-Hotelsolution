package com.hotelsolution.fire.workout.Service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.workout.dao.WorkoutDao;

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
	public int recordEndTime(String no) {
		return dao.recordEndTime(sst,no);
	}

	
	
}
