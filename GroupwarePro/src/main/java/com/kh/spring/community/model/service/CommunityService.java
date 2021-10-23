package com.kh.spring.community.model.service;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.SelectBoardListInfo;

public interface CommunityService {



	int selectListCount(int cno);

	ArrayList<CommunityBoard> selectBoardList(SelectBoardListInfo info);

}
