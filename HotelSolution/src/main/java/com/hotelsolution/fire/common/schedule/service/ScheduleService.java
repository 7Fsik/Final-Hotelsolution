package com.hotelsolution.fire.common.schedule.service;

import java.util.List;
import java.util.Map;

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

	public int createSchedule(MemberVo loginMember, ScheduleVo vo)  {
		
		return dao.createSchedule(sst, loginMember, vo);
	}

	public int modifySchedule(MemberVo loginMember, String[] data) {
		return dao.modifySchedule(sst, loginMember, data);
				
	}

	
	public List<ScheduleVo> getMySchedule(String no) {
		return dao.getMySchedule(sst,no);
	}

	public List<ScheduleVo> getTeamSchedule(MemberVo loginMember) {
		return dao.getTeamSchedule(sst,loginMember);
	}

	public ScheduleVo detailSchedule(Map<String, String> map) {
		return dao.detailSchedule(sst,map);
	}

	public int deleteScheduleByNo(MemberVo loginMember, String no) {
		return dao.deleteScheduleByNo(sst, loginMember, no);
	}

	public List<ScheduleVo> getScheduleList(MemberVo loginMember) {
		return dao.getScheduleList(sst,loginMember);
	}

	
	
}
