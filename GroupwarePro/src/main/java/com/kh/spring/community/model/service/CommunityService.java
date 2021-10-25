package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.SelectBoardListInfo;

public interface CommunityService {



	int selectListCount(int cno);

	ArrayList<CommunityBoard> selectBoardList(SelectBoardListInfo info);

	CommunityBoard selectBoard(int bno);

	int selectSeqBno();

	void insertBoard(CommunityBoard b);

	void insertCommunityAttachment(CommunityAttachment at);

	ArrayList<CommunityAttachment> selectAttachmentList(int bno);

	void updateBoard(CommunityBoard b);

}
