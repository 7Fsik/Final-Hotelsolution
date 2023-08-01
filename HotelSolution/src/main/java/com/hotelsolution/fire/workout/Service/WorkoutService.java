package com.hotelsolution.fire.workout.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.workout.vo.WorkoutVo;

public interface WorkoutService {

	int recordStartTime(Map<String, Object> map);

	int recordEndTime(Map<String, Object> map);

	Date getStartTime(String userNo);

	Date getEndTime(String userNo);

	WorkoutVo getCommuteRecordNo(String no);

	int updateTotalWorkHours(Map<String, String> params);

	List<WorkoutVo> getWorkOutVoListByWeek(Map<String, Object> map);

	


}
