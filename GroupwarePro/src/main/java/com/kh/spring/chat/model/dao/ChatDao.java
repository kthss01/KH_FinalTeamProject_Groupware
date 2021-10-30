package com.kh.spring.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;

@Repository
public class ChatDao {

	public ArrayList<Department> selectDeptList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatMapper.selectDeptList");
	}

	public ArrayList<ContectList> selectContectList(SqlSessionTemplate sqlSession, String deptTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatMapper.selectContectList");
	}

}
