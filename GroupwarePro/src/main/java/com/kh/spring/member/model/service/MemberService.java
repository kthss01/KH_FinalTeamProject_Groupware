package com.kh.spring.member.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws Exception;

	void insertMember(Member m);

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	Member updateMember(Member m) throws Exception;

	void deleteMember(String userId);

	ArrayList<Member> selectMemberList();

	Member selectMember(String empNo);

	int checkMember(String empNo);

	ArrayList<Member> sortMemberList(String value);

	int checkMemberId(String loginId);

	String searchLoginId(String empNo);

	int updatePassword(Member m);



}
