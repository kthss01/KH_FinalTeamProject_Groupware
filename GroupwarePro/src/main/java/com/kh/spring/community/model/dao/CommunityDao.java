package com.kh.spring.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.SelectBoardListInfo;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.community.model.vo.CommunityReply;

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

	public int insertReply(SqlSessionTemplate sqlSession, CommunityReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("communityMapper.insertReply",r);
	}

	public ArrayList<CommunityReply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("communityMapper.selectReplyList", bno);
	}

	public ArrayList<CommunityReply> selectReComentList(SqlSessionTemplate sqlSession, CommunityReply r) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("communityMapper.selectReCommnetList", r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, CommunityReply r) {
		// TODO Auto-generated method stub
		return sqlSession.delete("communityMapper.deleteReply",r);
	}

	public ArrayList<CommunityCategory> selectCategoryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("communityMapper.selectCategoryList");
	}

	public CommunityCategory selectCategory(SqlSessionTemplate sqlSession, int cno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("communityMapper.selectCategoryName",cno);
	}

	public int countBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("communityMapper.countBoard",bno);
	}

	public ArrayList<CommunityBoard> selectBestBoardList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("communityMapper.selectBestBoardList");
	}

	public int deleteCommunityAttachment(SqlSessionTemplate sqlSession, CommunityAttachment at) {
		// TODO Auto-generated method stub
		return sqlSession.delete("communityMapper.deleteCommunityAttachment",at);
	}

	public int updateCommunityAttachment(SqlSessionTemplate sqlSession, CommunityAttachment at) {
		// TODO Auto-generated method stub
		return sqlSession.insert("communityMapper.updateCommunityAttachment",at);
	}

	public CommunityAttachment selectAttachment(SqlSessionTemplate sqlSession, CommunityAttachment info) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("communityMapper.selectAttachment",info);
	}

}
