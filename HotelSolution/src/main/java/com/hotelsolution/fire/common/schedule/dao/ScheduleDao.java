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

	
	
	public List<ScheduleVo> readSchedule(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.selectList("schedule.read", loginMember);
	}

	public int createSchedule(SqlSessionTemplate sst, MemberVo loginMember, String[] data) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		log.info(loginMember.toString());
		map.put("loginMember", loginMember);
		map.put("data", data);
		log.info(data.toString());
		log.info(data[0]);
		log.info(data[1]);
		log.info(data[2]);
	    return sst.insert("schedule.create", map);
	}

	public int modifySchedule(SqlSessionTemplate sst, MemberVo loginMember, String[] data) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.info(loginMember.toString());
		map.put("loginMember", loginMember);
		map.put("data", data);
		log.info(data.toString());
		log.info(data[0]);
		log.info(data[1]);
		log.info(data[2]);
	    return sst.update("schedule.modify", map);
	}

	public int deleteSchedule(SqlSessionTemplate sst, MemberVo loginMember, String[] data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginMember", loginMember);
		map.put("data", data);
	    return sst.delete("schedule.delete", map);
	}
	
	

}
