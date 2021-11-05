package com.kh.spring.hr.model.service;

import java.util.ArrayList;

import com.kh.spring.hr.model.vo.VacationInfo;
import com.kh.spring.hr.model.vo.Work;
import com.kh.spring.hr.model.vo.WorkSInfo;

public interface HrService {

	ArrayList<Work> selectWorkList(int empNo);

	void insertWork(int empNo);

	void updateWork(String wNo);

	void insertWorkStatus(WorkSInfo wsi);

	VacationInfo selectVacationInfo(int empNo);




}
