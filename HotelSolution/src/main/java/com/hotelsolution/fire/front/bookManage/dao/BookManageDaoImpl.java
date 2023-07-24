package com.hotelsolution.fire.front.bookManage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.bookManage.vo.BookManageVo;

@Repository
public class BookManageDaoImpl implements BookManageDao{

	@Override
	public List<BookManageVo> list(SqlSessionTemplate sst, PageVo pv, String searchType ,String searchValue) {
		
		Map<String, Object> search = new HashMap<>();
		 search.put("searchType", searchType);
		 search.put("searchValue", searchValue);
		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		
		return sst.selectList("bookManage.list",search,rb);
	}

	@Override
	public int getBookCnt(SqlSessionTemplate sst) {
		return sst.selectOne("bookManage.getBookCnt");
	}

	@Override
	public BookManageVo getBookByNo(SqlSessionTemplate sst, int no) {
		return sst.selectOne("bookManage.getBookByNo", no);
	}

}
