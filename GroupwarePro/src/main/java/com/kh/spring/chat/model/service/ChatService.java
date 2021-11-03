package com.kh.spring.chat.model.service;

import java.util.ArrayList;
import java.util.Optional;

import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;

public interface ChatService {

	ArrayList<Department> selectDeptList();

	ArrayList<ContectList> selectContectList(String title);

	ContectList selectContectMember(int eno);

	int insertMessage(Chat chat);

	int updateStatus(ContectList con);

	ArrayList<Chat> selectChatList(Chat chat);

}
