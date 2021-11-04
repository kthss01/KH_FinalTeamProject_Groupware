package com.kh.spring.hr.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.hr.model.vo.Work;

@Repository
public class HrDao {

	public ArrayList<Work> selectWorkList(SqlSessionTemplate sqlSession, int loginNo) {
		
		return (ArrayList)sqlSession.selectList("hrMapper.selectWorkList", loginNo);
	}

}
