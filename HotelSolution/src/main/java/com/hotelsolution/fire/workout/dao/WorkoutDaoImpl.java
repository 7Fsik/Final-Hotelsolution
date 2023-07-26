package com.hotelsolution.fire.workout.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.workout.vo.WorkoutVo;

@Repository
public class WorkoutDaoImpl implements WorkoutDao{

	@Override
	public int checkWorkStart(SqlSessionTemplate sst, WorkoutVo vo) {
		return sst.insert("workout.recordStartTime" , vo);
	}

}
