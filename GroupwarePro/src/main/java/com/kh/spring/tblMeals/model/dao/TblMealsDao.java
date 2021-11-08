package com.kh.spring.tblMeals.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.tblMeals.model.vo.TblMeals;

@Repository
public class TblMealsDao {

	public int insertT(SqlSessionTemplate sqlSession, TblMeals tm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("tblMealsMapper.insertT",tm);
	}

}
