package com.kh.spring.chat.model.dao;

import java.util.ArrayList;
import java.util.Optional;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;

@Repository
public class ChatDao {

	public ArrayList<Department> selectDeptList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatMapper.selectDeptList");
	}

	public ArrayList<ContectList> selectContectList(SqlSessionTemplate sqlSession, String title) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatMapper.selectContectList",title);
	}

	public ContectList selectContectMember(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.selectContectMember",eno);
	}

	public int insertMessage(SqlSessionTemplate sqlSession, Chat chat) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.insertMessage",chat);
	}

}
