package com.hotelsolution.fire.workout.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.workout.vo.WorkoutVo;

public interface WorkoutDao {

	int checkWorkStart(SqlSessionTemplate sst, WorkoutVo vo);

}
