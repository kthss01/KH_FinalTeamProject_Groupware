package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.chat.model.dao.ChatDao;
import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ChatDao chatDao;

	@Override
	public ArrayList<Department> selectDeptList() {

		ArrayList<Department> list = chatDao.selectDeptList(sqlSession);
		return list;
	}

	@Override
	public ArrayList<ContectList> selectContectList(String deptTitle) {

		ArrayList<ContectList> list = chatDao.selectContectList(sqlSession,deptTitle);
		return list;
	}


}