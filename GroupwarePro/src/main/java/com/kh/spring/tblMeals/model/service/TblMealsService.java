package com.kh.spring.tblMeals.model.service;



import java.sql.Date;
import java.util.ArrayList;

import com.kh.spring.tblMeals.model.vo.TblMeals;
import com.kh.spring.tblMeals.model.vo.TblMealsCal;

public interface TblMealsService {

	void inserT(TblMeals tm);

	ArrayList<TblMeals> selectT();

	

	ArrayList<Date> selectDateList();

	ArrayList<TblMealsCal> selectList();


}
