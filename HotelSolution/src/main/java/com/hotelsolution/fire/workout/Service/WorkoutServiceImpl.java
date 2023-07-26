package com.hotelsolution.fire.workout.Service;

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
	public int checkWorkStart(WorkoutVo vo) {
		return dao.checkWorkStart(sst,vo);
	}

	
	
}
