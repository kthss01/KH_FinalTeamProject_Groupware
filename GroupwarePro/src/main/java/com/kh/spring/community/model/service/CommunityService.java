package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.spring.common.SelectBoardListInfo;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.community.model.vo.CommunityReply;

public interface CommunityService {


	ArrayList<CommunityBoard> selectBoardList(SelectBoardListInfo info);
	
	ArrayList<CommunityAttachment> selectAttachmentList(int bno);

	ArrayList<CommunityReply> selectReplyList(int bno);

	ArrayList<CommunityReply> selectReComentList(CommunityReply r);

	ArrayList<CommunityCategory> selectCategoryList();
	
	ArrayList<CommunityBoard> selectBestBoardList();

	CommunityBoard selectBoard(int bno);

	CommunityCategory selectCategory(int cno);
	
	CommunityAttachment selectAttachment(CommunityAttachment info);

	int selectListCount(int cno);

	int selectSeqBno();

	void insertBoard(CommunityBoard b);

	void insertCommunityAttachment(CommunityAttachment at);

	int insertReply(CommunityReply r);

	void countBoard(int bno);
	
	void updateBoard(CommunityBoard b);

	int updateCommunityAttachment(CommunityAttachment at);

	void deleteCommunityAttachment(CommunityAttachment at);
	
	int deleteReply(CommunityReply r);
	
	int deleteBoard(int bno);
	



}
