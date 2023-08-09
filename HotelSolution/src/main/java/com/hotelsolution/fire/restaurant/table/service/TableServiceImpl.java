package com.hotelsolution.fire.restaurant.table.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.restaurant.table.dao.TableDao;
import com.hotelsolution.fire.restaurant.table.vo.TableIntVo;
import com.hotelsolution.fire.restaurant.table.vo.TablePrice;
import com.hotelsolution.fire.restaurant.vo.MenuVo;
import com.hotelsolution.fire.restaurant.table.vo.TableBookVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TableServiceImpl implements TableService{
	
	private final SqlSessionTemplate sst;
	private final TableDao td;
	
	
	//객실 예약 이용
	@Override
	public List<TableIntVo> getRoomInt() {
		return td.getRoomInt(sst);
	}

	@Override
	public List<TableBookVo> getBook(Map<String, LocalDateTime> date) {
		return td.getBook(sst, date);
	}

	@Override
	public int checkOk(String no) {
		return td.checkOk(sst,no);
	}

	@Override
	public int cancel(String num) {
		return td.cancel(sst,num);
	}

	@Override
	public int useBook(Map<String, String> useMap) {
		return td.useBook(sst,useMap);
	}

	@Override
	public int book(Map<String, String> bookMap) {
		return td.book(sst, bookMap);
	}

	@Override
	public List<TablePrice> getTotalPrice(Map<String, String> date) {
		return td.getTotalPrice(sst,date);
	}

	@Override
	public List<MenuVo> getMenu() {
		return td.getMenu(sst);
	}

	@Override
	public TableBookVo getUse(Map<String, String> date) {
		return td.getUse(sst,date);
	}

	@Override
	public int posOrder(Map<String, Object> posOrderMap) {
		return td.posOrder(sst,posOrderMap);
	}

	@Override
	public int totalPrice(Map<String, String> price) {
		return td.totalPrice(sst, price);
	}

	@Override
	public int payment(String useNo) {
		return td.payment(sst,useNo);
	}

}
