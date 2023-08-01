package com.hotelsolution.fire.workout.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.work.session.WorkSession;
import com.hotelsolution.fire.workout.vo.WorkoutVo;

public interface WorkoutService {

	int recordStartTime(String no);

	int recordEndTime(String workoutNo);

	Date getStartTime(String userNo);

	Date getEndTime(String userNo);

	WorkoutVo getCommuteRecordNo(String no);

	int updateTotalWorkHours(String workoutNo);

	


}
