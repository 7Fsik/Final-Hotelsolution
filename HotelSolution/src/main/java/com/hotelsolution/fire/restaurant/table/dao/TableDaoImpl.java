package com.hotelsolution.fire.restaurant.table.dao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.restaurant.table.vo.TableIntVo;
import com.hotelsolution.fire.restaurant.table.vo.TablePrice;
import com.hotelsolution.fire.restaurant.vo.MenuVo;
import com.hotelsolution.fire.restaurant.table.vo.TableBookVo;

@Repository
public class TableDaoImpl implements TableDao{

	@Override
	public List<TableIntVo> getRoomInt(SqlSessionTemplate sst) {
		return sst.selectList("table.getTableInt");
	}

	@Override
	public List<TableBookVo> getBook(SqlSessionTemplate sst, Map<String, LocalDateTime> date) {
		return sst.selectList("table.getBook",date);
	}

	@Override
	public int checkOk(SqlSessionTemplate sst, String no) {
		return sst.update("table.checkOk", no);
	}

	@Override
	public int cancel(SqlSessionTemplate sst, String num) {
		return sst.delete("table.cancel", num);
	}

	@Override
	public int useBook(SqlSessionTemplate sst, Map<String, String> useMap) {
		return sst.insert("table.useBook", useMap);
	}

	@Override
	public int book(SqlSessionTemplate sst, Map<String, String> bookMap) {
		return sst.insert("table.book", bookMap);
	}

	@Override
	public List<TablePrice> getTotalPrice(SqlSessionTemplate sst, Map<String, String> date) {
		return sst.selectList("table.getTotalPrice", date);
	}

	@Override
	public List<MenuVo> getMenu(SqlSessionTemplate sst) {
		return sst.selectList("table.getMenu");
	}

	@Override
	public TableBookVo getUse(SqlSessionTemplate sst, Map<String, String> date) {
		return sst.selectOne("table.getUse", date);
	}

	@Override
	public int posOrder(SqlSessionTemplate sst, Map<String, Object> posOrderMap) {
		return sst.insert("table.posOrder", posOrderMap);
	}

	@Override
	public int totalPrice(SqlSessionTemplate sst, Map<String, String> price) {
		return sst.update("table.totalPrice", price);
	}

	@Override
	public int payment(SqlSessionTemplate sst, String useNo) {
		return sst.update("table.payment", useNo);
	}


}
