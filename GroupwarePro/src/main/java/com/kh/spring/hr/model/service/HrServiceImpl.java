package com.kh.spring.hr.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.hr.model.dao.HrDao;
import com.kh.spring.hr.model.vo.EmpInfo;
import com.kh.spring.hr.model.vo.VOccur;
import com.kh.spring.hr.model.vo.VRequest;
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
	public ArrayList<Work> selectWorkList(Work work) {

		ArrayList<Work> list = hrDao.selectWorkList(sqlSession, work);
		
		return list;
	}
	
	@Override
	public Work selectWork(int empNo) {
		
		Work w = hrDao.selectWork(sqlSession, empNo);
		
		return w;
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

	@Override
	public ArrayList<VRequest> selectVRequestList(int empNo) {
		
		ArrayList<VRequest> vrList = hrDao.selectVRequestList(sqlSession, empNo);
		
		return vrList;
	}

	@Override
	public ArrayList<VOccur> selectVOccurList(int empNo) {
		
		ArrayList<VOccur> voList = hrDao.selectVOccurList(sqlSession, empNo);
		
		return voList;
	}

	@Override
	public EmpInfo selectEmpInfo(int empNo) {
		
		EmpInfo empInfo = hrDao.selectEmpInfo(sqlSession, empNo);
		
		return empInfo;
	}

	@Override
	public ArrayList<WorkSInfo> selectWorkSInfoList(String wNo) {
		
		ArrayList<WorkSInfo> list = hrDao.selectWorkSInfoList(sqlSession, wNo);
		
		return list;
	}




}
