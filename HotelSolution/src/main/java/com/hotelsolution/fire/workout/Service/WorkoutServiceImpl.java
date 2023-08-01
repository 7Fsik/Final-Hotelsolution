package com.hotelsolution.fire.workout.Service;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int recordStartTime(Map<String,Object> map) {
		return dao.recordStartTime(sst,map);
	}

	@Override
	//퇴근시간 기록
	public int recordEndTime(Map<String,Object> map) {
		return dao.recordEndTime(sst,map);
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
	//기록 번호 가져오기
	public WorkoutVo getCommuteRecordNo(String no) {
		return dao.getCommuteRecordNo(sst,no);
	}

	@Override
	//근무시간 기록
	public int updateTotalWorkHours(Map<String, String> params) {
		return dao.updateTotalWorkHours(sst, params);
	}

	@Override
	public List<WorkoutVo> getWorkOutVoListByWeek(Map<String, Object> map) {
		return dao.getWorkOutVoListByWeek(sst, map);
	}



}
