package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;

public interface ChatService {

	ArrayList<Department> selectDeptList();

	ArrayList<ContectList> selectContectList(String title);

}
