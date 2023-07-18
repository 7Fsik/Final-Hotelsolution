package com.hotelsolution.fire.common.schedule.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.common.schedule.dao.ScheduleDao;
import com.hotelsolution.fire.common.schedule.vo.ScheduleVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ScheduleService {

	
	private final ScheduleDao dao;
	
	private final SqlSessionTemplate sst;

	public List<ScheduleVo> readSchedule(MemberVo loginMember){
		return dao.readSchedule(sst, loginMember);
	}
	
//	public List<ScheduleVo> tgetFullCalendar(String lectureNo) throws SQLException {
//		Connection conn = JDBCTemplate.getConnection();
//		List<ScheduleVo> voList = dao.tgetTeamCalendar(conn, lectureNo);
//		
//		JDBCTemplate.close(conn);
//		return voList;
//	}

	public int createSchedule(MemberVo loginMember, String[] data)  {
		
		return dao.createSchedule(sst, loginMember, data);
	}

	public int modifySchedule(MemberVo loginMember, String[] data) {
		return dao.modifySchedule(sst, loginMember, data);
		
		
	}

	public int deleteSchedule(MemberVo loginMember, String[] data) {
		return dao.deleteSchedule(sst, loginMember, data);

	
		
	}

	
	
}