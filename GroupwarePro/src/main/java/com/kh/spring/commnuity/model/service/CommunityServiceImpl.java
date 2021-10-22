package com.kh.spring.commnuity.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.commnuity.model.dao.CommunityDao;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CommunityDao communityDao;
}
