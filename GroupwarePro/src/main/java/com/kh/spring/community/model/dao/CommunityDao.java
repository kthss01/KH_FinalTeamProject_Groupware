package com.kh.spring.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.SelectBoardListInfo;

@Repository
public class CommunityDao {



	public int selectListCount(SqlSessionTemplate sqlSession, int cno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("communityMapper.selectListCount",cno);
	}

	public ArrayList<CommunityBoard> selectBoardList(SqlSessionTemplate sqlSession, SelectBoardListInfo info) {
		
		PageInfo pi = info.getPageInfo();
		int cno = info.getCno();
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return 	(ArrayList)sqlSession.selectList("communityMapper.selectBoardList", cno, rowBounds);
	}

	public CommunityBoard selectBoard(SqlSessionTemplate sqlSession, int bno) {

		return sqlSession.selectOne("communityMapper.selectBoard",bno);
	}

	public int selectSeqBno(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("communityMapper.selectSeqBno");
	}

	public int insertBoard(SqlSessionTemplate sqlSession,CommunityBoard b) {
		
		return sqlSession.insert("communityMapper.insertBoard",b);
	}

	public int insertCommunityAttachment(SqlSessionTemplate sqlSession, CommunityAttachment at) {

		return sqlSession.insert("communityMapper.insertCommunityAttachment",at);
	}

	public ArrayList<CommunityAttachment> selectAttachmentList(SqlSessionTemplate sqlSession,int bno) {

		return (ArrayList)sqlSession.selectList("communityMapper.selectAttachmentList",bno);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, CommunityBoard b) {
		
		return sqlSession.update("communityMapper.updateBoard",b);

	}

}
