package com.hotelsolution.fire.restaurant.table.dao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.restaurant.table.vo.TableIntVo;
import com.hotelsolution.fire.restaurant.table.vo.TableBookVo;

public interface TableDao {

	//객실 예약 이용
	List<TableIntVo> getRoomInt(SqlSessionTemplate sst);

	List<TableBookVo> getBook(SqlSessionTemplate sst, Map<String, LocalDateTime> date);
	//홧인
	int checkOk(SqlSessionTemplate sst, String no);
	//취소
	int cancel(SqlSessionTemplate sst, String num);
	//이용
	int useBook(SqlSessionTemplate sst, Map<String, String> useMap);
	//예약
	int book(SqlSessionTemplate sst, Map<String, String> bookMap);

}
