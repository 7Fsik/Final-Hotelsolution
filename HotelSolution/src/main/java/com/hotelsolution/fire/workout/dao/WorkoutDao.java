package com.hotelsolution.fire.workout.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.workout.vo.WorkoutVo;

public interface WorkoutDao {

	int recordStartTime(SqlSessionTemplate sst, Map<String, Object> map);

	int recordEndTime(SqlSessionTemplate sst, Map<String, Object> map);

	Date getStartTime(SqlSessionTemplate sst, String userNo);

	Date getEndTime(SqlSessionTemplate sst, String userNo);

	WorkoutVo getCommuteRecordNo(SqlSessionTemplate sst, String no);

	int updateTotalWorkHours(SqlSessionTemplate sst, Map<String, String> params);

	List<WorkoutVo> getWorkOutVoListByWeek(SqlSessionTemplate sst, Map<String, Object> map);


}
