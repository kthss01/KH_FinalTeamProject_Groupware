package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.dao.CommunityDao;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.SelectBoardListInfo;

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

		ArrayList<CommunityBoard> list = communityDao.selectBoardList(sqlSession,info);
		
		return list;
	}

	@Override
	public CommunityBoard selectBoard(int bno) {

		CommunityBoard b = communityDao.selectBoard(sqlSession,bno);
		return b;
	}

	@Override
	public int selectSeqBno() {

		int nextBno = communityDao.selectSeqBno(sqlSession);
		
		return nextBno;
	}

	@Override
	public void insertBoard(CommunityBoard b) {

		int result = communityDao.insertBoard(sqlSession,b);
		
		 if(result < 0) {
			 throw new CommException("게시글 등록 실패");
		 }
	}

	@Override
	public void insertCommunityAttachment(CommunityAttachment at) {
		int result = communityDao.insertCommunityAttachment(sqlSession,at);
		
		 if(result < 0) {
			 throw new CommException("게시물 첨부파일 등록 실패");
		 }		
	}

	@Override
	public ArrayList<CommunityAttachment> selectAttachmentList(int bno) {

		ArrayList<CommunityAttachment> list = communityDao.selectAttachmentList(sqlSession,bno);
		return list;
	}

	@Override
	public void updateBoard(CommunityBoard b) {
		int result = communityDao.updateBoard(sqlSession,b);
		
		if(result<0) {
			 throw new CommException("게시물 업데이트 실패");

		}
	}


}
