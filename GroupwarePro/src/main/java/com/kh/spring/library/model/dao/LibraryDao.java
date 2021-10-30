package com.kh.spring.library.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.SelectBoardListInfo;
import com.kh.spring.library.model.vo.LibraryBoard;

@Repository
public class LibraryDao {

	public int selectListCount(SqlSessionTemplate sqlSession, int cno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("libraryMapper.selectListCount",cno);
	}

	public ArrayList<LibraryBoard> selectBoardList(SqlSessionTemplate sqlSession, SelectBoardListInfo info) {

		PageInfo pi = info.getPageInfo();
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		return (ArrayList)sqlSession.selectList("libraryMapper.selectBoardList",info,rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, LibraryBoard b) {
		
		return sqlSession.insert("libraryMapper.insertBoard",b);
	}

	public String selectOriginFileName(SqlSessionTemplate sqlSession,String fileName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("libraryMapper.selectOriginFileName",fileName);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int lno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("libraryMapper.deleteBoard",lno);
	}

	public int countLibrary(SqlSessionTemplate sqlSession, String fileName) {
		// TODO Auto-generated method stub
		return sqlSession.update("libraryMapper.countLibrary",fileName);
	}

	/*
	 * public LibraryCategory selectCategory(SqlSessionTemplate sqlSession, int cno)
	 * { // TODO Auto-generated method stub return
	 * sqlSession.selectOne("libraryMapper.selectCategory",cno); }
	 */
}
