package com.kh.spring.manager.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.member.model.vo.Member;

public interface ManagerService {

	ArrayList<Member> selectMemberList();
	public void deleteMember();
	void insertMember(Member m);

}
