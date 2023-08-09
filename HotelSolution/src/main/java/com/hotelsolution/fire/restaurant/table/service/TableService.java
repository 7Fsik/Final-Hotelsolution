package com.hotelsolution.fire.restaurant.table.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.restaurant.table.vo.TableIntVo;
import com.hotelsolution.fire.restaurant.table.vo.TablePrice;
import com.hotelsolution.fire.restaurant.vo.MenuVo;
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
	
	//테이블 가격
	List<TablePrice> getTotalPrice(Map<String, String> date);
	//메뉴
	List<MenuVo> getMenu();
	//그 해당되는 테이블 가져오기 
	TableBookVo getUse(Map<String, String> date);
	//메뉴주문
	int posOrder(Map<String, Object> posOrderMap);
	//금액 바꿈
	int totalPrice(Map<String, String> price);
	//결제 
	int payment(String useNo);

}
