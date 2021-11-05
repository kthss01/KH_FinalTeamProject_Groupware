package com.kh.spring.hr.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.hr.model.dao.HrDao;
import com.kh.spring.hr.model.vo.VacationInfo;
import com.kh.spring.hr.model.vo.Work;
import com.kh.spring.hr.model.vo.WorkSInfo;

@Service
public class HrServiceImpl implements HrService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HrDao hrDao;
	
	@Override
	public ArrayList<Work> selectWorkList(int empNo) {
		
		ArrayList<Work> list = hrDao.selectWorkList(sqlSession, empNo);
		
		return list;
	}

	@Override
	public void insertWork(int empNo) {
		
		int result = hrDao.insertWork(sqlSession, empNo);
		
		if(result < 0) {
			throw new CommException("출근 확인 실패");
		}
		
	}

	@Override
	public void updateWork(String wNo) {
		int result = hrDao.updateWork(sqlSession, wNo);
		
		if(result < 0) {
			throw new CommException("퇴근 확인 실패");
		}
	}

	@Override
	public void insertWorkStatus(WorkSInfo wsi) {
		int result = hrDao.insertWorkStatus(sqlSession, wsi);
		
		if(result < 0) {
			throw new CommException("근무상태변경 실패");
		}
		
	}

	@Override
	public VacationInfo selectVacationInfo(int empNo) {
		
		VacationInfo vi = hrDao.selectVacationInfo(sqlSession, empNo);
		
		return vi;
	}


}
