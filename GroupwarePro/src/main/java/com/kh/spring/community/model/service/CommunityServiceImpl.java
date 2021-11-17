package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.SelectBoardListInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.dao.CommunityDao;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.community.model.vo.CommunityReply;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CommunityDao communityDao;

	@Override
	public int selectListCount(int cno) {

		int listCount = communityDao.selectListCount(sqlSession, cno);

		return listCount;
	}

	@Override
	public ArrayList<CommunityBoard> selectBoardList(SelectBoardListInfo info) {

		ArrayList<CommunityBoard> list = communityDao.selectBoardList(sqlSession, info);

		return list;
	}

	@Override
	public CommunityBoard selectBoard(int bno) {

		CommunityBoard b = communityDao.selectBoard(sqlSession, bno);
		return b;
	}

	@Override
	public int selectSeqBno() {

		int nextBno = communityDao.selectSeqBno(sqlSession);

		return nextBno;
	}

	@Override
	public void insertBoard(CommunityBoard b) {

		int result = communityDao.insertBoard(sqlSession, b);

		if (result < 0) {
			throw new CommException("게시글 등록 실패");
		}
	}

	@Override
	public void insertCommunityAttachment(CommunityAttachment at) {
		int result = communityDao.insertCommunityAttachment(sqlSession, at);

		if (result < 0) {
			throw new CommException("게시물 첨부파일 등록 실패");
		}
	}

	@Override
	public ArrayList<CommunityAttachment> selectAttachmentList(int bno) {

		ArrayList<CommunityAttachment> list = communityDao.selectAttachmentList(sqlSession, bno);
		return list;
	}

	@Override
	public void updateBoard(CommunityBoard b) {
		int result = communityDao.updateBoard(sqlSession, b);

		if (result < 0) {
			throw new CommException("게시물 업데이트 실패");

		}
	}

	@Override
	public int insertReply(CommunityReply r) {

		int result = communityDao.insertReply(sqlSession, r);

		if (result < 0) {
			throw new CommException("댓글 등록 실패");

		}
		return result;
	}

	@Override
	public ArrayList<CommunityReply> selectReplyList(int bno) {

		ArrayList<CommunityReply> list = communityDao.selectReplyList(sqlSession, bno);

		return list;
	}

	@Override
	public ArrayList<CommunityReply> selectReComentList(CommunityReply r) {
		ArrayList<CommunityReply> list = communityDao.selectReComentList(sqlSession, r);
		return list;
	}

	@Override
	public int deleteReply(CommunityReply r) {
		int result = communityDao.deleteReply(sqlSession, r);

		if (result < 0) {
			throw new CommException("댓글 삭제 실패");

		}
		return result;
	}

	@Override
	public ArrayList<CommunityCategory> selectCategoryList() {
		ArrayList<CommunityCategory> list = communityDao.selectCategoryList(sqlSession);
		return list;
	}

	@Override
	public CommunityCategory selectCategory(int cno) {
		CommunityCategory category = communityDao.selectCategory(sqlSession, cno);
		return category;
	}

	@Override
	public void countBoard(int bno) {
		int result = communityDao.countBoard(sqlSession, bno);

		if (result < 0) {
			throw new CommException("조회수 증가 실패");

		}
	}

	@Override
	public ArrayList<CommunityBoard> selectBestBoardList() {
		ArrayList<CommunityBoard> list = communityDao.selectBestBoardList(sqlSession);
		return list;
	}

	@Override
	public void deleteCommunityAttachment(CommunityAttachment at) {

		int result = communityDao.deleteCommunityAttachment(sqlSession, at);

		if (result < 0) {
			throw new CommException("기존 첨부파일 삭제 실패");
		}

	}

	@Override
	public int updateCommunityAttachment(CommunityAttachment at) {
		int result = communityDao.updateCommunityAttachment(sqlSession, at);
		if (result < 0) {
			throw new CommException("첨부파일 수정 업로드 실패");
		}
		return result;
	}

	@Override
	public CommunityAttachment selectAttachment(CommunityAttachment info) {

		return communityDao.selectAttachment(sqlSession, info);
	}

	@Override
	public int deleteBoard(int bno) {

		int result = communityDao.deleteBoard(sqlSession, bno);

		if (result < 0) {
			throw new CommException("첨부파일 수정 업로드 실패");

		}
		return result;
	}

	@Override
	public int insertCategory(CommunityCategory c) {
		
		int result = communityDao.insertCategory(sqlSession, c);

		if (result < 0) {
			throw new CommException("카테고리 신청 실패");

		}
		return result;
	}

	@Override
	public ArrayList<CommunityCategory> selectApplyCategoryList() {
		ArrayList<CommunityCategory> list = communityDao.selectApplyCategoryList(sqlSession);
		return list;
	}

	@Override
	public void openCategory(int cno) {

		int result = communityDao.openCategory(sqlSession,cno);
		if (result < 0) {
			throw new CommException("카테고리 오픈 실패");

		}
	}

	@Override
	public void closeCategory(int cno) {
		int result = communityDao.closeCategory(sqlSession,cno);
		if (result < 0) {
			throw new CommException("카테고리 숨기기 실패");

		}		
	}

	@Override
	public int selectNewApplyCategory() {
		int result = communityDao.selectNewApplyCategory(sqlSession);

		return result;
	}

	@Override
	public void holdCategory(int cno) {
		int result = communityDao.holdCategory(sqlSession,cno);
		if (result < 0) {
			throw new CommException("카테고리 보류 실패");

		}
	}

}
