package com.hotelsolution.fire.front.bookManage.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.bookManage.vo.BookManageVo;

public interface BookManageDao {

	List<BookManageVo> list(SqlSessionTemplate sst, PageVo pv, String searchType, String searchValue);

	int getBookCnt(SqlSessionTemplate sst);

	BookManageVo getBookByNo(SqlSessionTemplate sst, int no);

	int checkIn(SqlSessionTemplate sst, Map<String, String> paramMap);

	int cencel(SqlSessionTemplate sst, Map<String,String>paramMap);
	//체크인한 방
	List<BookManageVo> useList(SqlSessionTemplate sst);

}
