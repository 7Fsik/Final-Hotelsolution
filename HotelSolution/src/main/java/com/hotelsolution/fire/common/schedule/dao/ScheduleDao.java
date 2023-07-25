package com.hotelsolution.fire.common.schedule.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.schedule.vo.ScheduleVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ScheduleDao {

	
	
	

	public int createSchedule(SqlSessionTemplate sst, MemberVo loginMember, ScheduleVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("loginMember", loginMember);
		map.put("vo", vo);
	    return sst.insert("schedule.create", map);
	}

	public int modifySchedule(SqlSessionTemplate sst, MemberVo loginMember, String[] data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginMember", loginMember);
		map.put("data", data);
	    return sst.update("schedule.modify", map);
	}

	public int deleteSchedule(SqlSessionTemplate sst, MemberVo loginMember, String[] data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginMember", loginMember);
		map.put("data", data);
	    return sst.delete("schedule.delete", map);
	}
////////////////////////////////////////////////////////////////////////////

	public List<ScheduleVo> getMySchedule(SqlSessionTemplate sst, String no) {
		System.out.println(no);
		return sst.selectList("schedule.getMySchedule", no);
	}

	public List<ScheduleVo> getTeamSchedule(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.selectList("schedule.getTeamSchedule", loginMember);
	}

	public ScheduleVo detailSchedule(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("schedule.detailSchedule",map);
	}
	
	

}
