package com.kh.spring.tblMeals.model.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.tblMeals.model.vo.TblMeals;
import com.kh.spring.tblMeals.model.vo.TblMealsCal;

@Repository
public class TblMealsDao {

	public int insertT(SqlSessionTemplate sqlSession, TblMeals tm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("tblMealsMapper.insertT",tm);
	}

	public ArrayList<TblMeals> selectT(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("tblMealsMapper.selectT",null);
	}

	

	public ArrayList<Date> selectDateList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("tblMealsMapper.selectDateList");
	}

	public ArrayList<TblMealsCal> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("tblMealsMapper.selectList");
	}

	

}
