package com.hotelsolution.fire.restaurant.table.dao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.restaurant.table.vo.TableIntVo;
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


}
