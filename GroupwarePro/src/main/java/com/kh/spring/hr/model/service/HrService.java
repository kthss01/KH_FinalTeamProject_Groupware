package com.kh.spring.hr.model.service;

import java.util.ArrayList;

import com.kh.spring.hr.model.vo.Work;

public interface HrService {

	ArrayList<Work> selectWorkList(int empNo);

	void insertWork(int empNo);

	void updateWork(String wNo);



}
