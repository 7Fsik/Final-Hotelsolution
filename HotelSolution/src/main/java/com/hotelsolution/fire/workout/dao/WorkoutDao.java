package com.hotelsolution.fire.workout.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.workout.vo.WorkoutVo;

public interface WorkoutDao {

	int recordStartTime(SqlSessionTemplate sst, String no);

	int recordEndTime(SqlSessionTemplate sst, String no);

}
