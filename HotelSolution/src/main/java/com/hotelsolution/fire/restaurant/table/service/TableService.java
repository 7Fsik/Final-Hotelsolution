package com.hotelsolution.fire.restaurant.table.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.restaurant.table.vo.TableIntVo;
import com.hotelsolution.fire.restaurant.table.vo.TableBookVo;

public interface TableService {

	//객실 예약 이용
	List<TableIntVo> getRoomInt();
	List<TableBookVo> getBook(Map<String, LocalDateTime> date);
	//확인
	int checkOk(String no);
	//취소
	int cancel(String num);
	//useBook
	int useBook(Map<String, String> useMap);
	//예약
	int book(Map<String, String> bookMap);

}
