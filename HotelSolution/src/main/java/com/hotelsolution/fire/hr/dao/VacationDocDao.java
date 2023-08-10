package com.hotelsolution.fire.hr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.vo.VacationDocVo;
@Repository
public class VacationDocDao {

	public List<VacationDocVo> getSubmitList(SqlSessionTemplate sst, Map<String, Object> map) {
		PageVo pv = (PageVo) map.get("pv");
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("vacationDoc.getSubmitList",map,rb);
	}

	public int getSubmitListCnt(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.selectOne("vacationDoc.getSubmitListCnt",map);
	}

	public List<VacationDocVo> getNoSubmitList(SqlSessionTemplate sst) {
		return sst.selectList("vacationDoc.getNoSubmitList");
	}

}
