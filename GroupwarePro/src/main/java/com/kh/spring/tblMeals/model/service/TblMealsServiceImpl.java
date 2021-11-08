package com.kh.spring.tblMeals.model.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.tblMeals.model.dao.TblMealsDao;
import com.kh.spring.tblMeals.model.vo.TblMeals;

@Service
public class TblMealsServiceImpl implements TblMealsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TblMealsDao tblMealsDao;

	@Override
	public void insertT(TblMeals tm) {
		// TODO Auto-generated method stub
		int result=tblMealsDao.insertT(sqlSession,tm);
		if(result<0) {
			throw new CommException("INSERT 실패");
		}
	}

}
