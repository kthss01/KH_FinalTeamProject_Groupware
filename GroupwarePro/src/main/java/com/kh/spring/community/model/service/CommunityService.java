package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.spring.common.SelectBoardListInfo;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.community.model.vo.CommunityReply;

public interface CommunityService {



	int selectListCount(int cno);

	ArrayList<CommunityBoard> selectBoardList(SelectBoardListInfo info);

	CommunityBoard selectBoard(int bno);

	int selectSeqBno();

	void insertBoard(CommunityBoard b);

	void insertCommunityAttachment(CommunityAttachment at);

	ArrayList<CommunityAttachment> selectAttachmentList(int bno);


	int insertReply(CommunityReply r);

	ArrayList<CommunityReply> selectReplyList(int bno);

	ArrayList<CommunityReply> selectReComentList(CommunityReply r);

	int deleteReply(CommunityReply r);

	ArrayList<CommunityCategory> selectCategoryList();

	CommunityCategory selectCategory(int cno);

	void countBoard(int bno);

	ArrayList<CommunityBoard> selectBestBoardList();

	void deleteCommunityAttachment(CommunityAttachment at);

	void updateBoard(CommunityBoard b);
	
	int updateCommunityAttachment(CommunityAttachment at);

	CommunityAttachment selectAttachment(CommunityAttachment info);

}
