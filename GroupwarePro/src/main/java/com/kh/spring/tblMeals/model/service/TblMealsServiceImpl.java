package com.kh.spring.tblMeals.model.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.tblMeals.model.dao.TblMealsDao;
import com.kh.spring.tblMeals.model.vo.TblMeals;
import com.kh.spring.tblMeals.model.vo.TblMealsCal;

@Service
public class TblMealsServiceImpl implements TblMealsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TblMealsDao tblMealsDao;

	@Override
	public void inserT(TblMeals tm) {
		// TODO Auto-generated method stub
		int result=tblMealsDao.insertT(sqlSession,tm);
		
	}

	@Override
	public ArrayList<TblMeals> selectT() {
		// TODO Auto-generated method stub
		return tblMealsDao.selectT(sqlSession);
	}

	

	@Override
	public ArrayList<Date> selectDateList() {
		// TODO Auto-generated method stub
		return tblMealsDao.selectDateList(sqlSession);
	}

	@Override
	public ArrayList<TblMealsCal> selectList() {
		// TODO Auto-generated method stub
		return tblMealsDao.selectList(sqlSession);
	}

	

	

	
	@Override
	public int insert(ArrayList<TblMeals> alldata) {
		// TODO Auto-generated method stub
		int result=tblMealsDao.insert(sqlSession,alldata);
		
		return result;
	}

	@Override
	public void insertTblMeals(TblMealsCal tmc) {
		// TODO Auto-generated method stub
		int result=tblMealsDao.insertTblMeals(sqlSession,tmc);
		
	}
	
	
	
	
	
	


}
