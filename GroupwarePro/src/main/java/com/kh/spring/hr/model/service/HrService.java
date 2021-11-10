package com.kh.spring.hr.model.service;

import java.util.ArrayList;

import com.kh.spring.hr.model.vo.EmpInfo;
import com.kh.spring.hr.model.vo.VOccur;
import com.kh.spring.hr.model.vo.VRequest;
import com.kh.spring.hr.model.vo.VacationInfo;
import com.kh.spring.hr.model.vo.Work;
import com.kh.spring.hr.model.vo.WorkSInfo;

public interface HrService {

	ArrayList<Work> selectWorkList(int empNo);

	void insertWork(int empNo);

	void updateWork(String wNo);

	void insertWorkStatus(WorkSInfo wsi);

	VacationInfo selectVacationInfo(int empNo);

	ArrayList<VRequest> selectVRequestList(int empNo);

	ArrayList<VOccur> selectVOccurList(int empNo);

	EmpInfo selectEmpInfo(int empNo);




}
