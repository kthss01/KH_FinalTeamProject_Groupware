package com.kh.spring.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.CommunityDao;
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
		// TODO Auto-generated method stub
		return null;
	}


}
