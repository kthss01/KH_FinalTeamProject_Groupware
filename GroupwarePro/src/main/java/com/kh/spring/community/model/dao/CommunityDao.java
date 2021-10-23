package com.kh.spring.community.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDao {



	public int selectListCount(SqlSessionTemplate sqlSession, int cno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("communityMapper.selectListCount",cno);
	}

}
