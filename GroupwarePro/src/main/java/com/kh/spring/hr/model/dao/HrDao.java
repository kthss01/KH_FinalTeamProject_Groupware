package com.kh.spring.hr.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.hr.model.vo.VRequest;
import com.kh.spring.hr.model.vo.VacationInfo;
import com.kh.spring.hr.model.vo.Work;
import com.kh.spring.hr.model.vo.WorkSInfo;

@Repository
public class HrDao {

	public ArrayList<Work> selectWorkList(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("hrMapper.selectWorkList", empNo);
	}

	public int insertWork(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.insert("hrMapper.insertWork", empNo);
	}

	public int updateWork(SqlSessionTemplate sqlSession, String wNo) {
		
		return sqlSession.update("hrMapper.updateWork", wNo);
	}

	public int insertWorkStatus(SqlSessionTemplate sqlSession, WorkSInfo wsi) {
		
		return sqlSession.insert("hrMapper.insertWorkStatus", wsi);
	}

	public VacationInfo selectVacationInfo(SqlSessionTemplate sqlSession, int empNo) {
		
		return (VacationInfo)sqlSession.selectOne("hrMapper.selectVacationInfo", empNo);
	}

	public ArrayList<VRequest> selectVRequestList(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("hrMapper.selectVRequestList", empNo);
	}


}
