package com.kh.spring.hr.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.hr.model.dao.HrDao;
import com.kh.spring.hr.model.vo.Work;

@Service
public class HrServiceImpl implements HrService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HrDao hrDao;
	
	@Override
	public ArrayList<Work> selectWorkList(int loginNo) {
		
		ArrayList<Work> list = hrDao.selectWorkList(sqlSession, loginNo);
		
		return list;
	}

}
