package com.kh.spring.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.chat.model.dao.ChatDao;
import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;
import com.kh.spring.chat.model.vo.Favorites;
import com.kh.spring.common.exception.CommException;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ChatDao chatDao;

	@Override
	public ArrayList<Department> selectDeptList() {

		ArrayList<Department> list = chatDao.selectDeptList(sqlSession);
		return list;
	}

	@Override
	public ArrayList<ContectList> selectContectList(String title) {

		ArrayList<ContectList> list = chatDao.selectContectList(sqlSession,title);
		return list;
	}

	@Override
	public ContectList selectContectMember(int eno) {
		
		 ContectList receiver = chatDao.selectContectMember(sqlSession,eno); 
		
		return receiver;
	}

	@Override
	public int insertMessage(Chat chat) {

		int result = chatDao.insertMessage(sqlSession,chat);
		
		if(result < 0) {
			throw new CommException("채팅 저장 실패");
		}
		
		return result;
	}

	@Override
	public int updateStatus(ContectList con) {

		int result = chatDao.updateStatus(sqlSession,con);
		
		if(result < 0) {
			throw new CommException("상태 변경 실패");
		}		
	
		return result;

	}

	@Override
	public ArrayList<Chat> selectChatList(Chat chat) {
		ArrayList<Chat> list = chatDao.selectChatList(sqlSession,chat);
		return list;
	}

	@Override
	public ArrayList<Favorites> selectFavoriteList(int eno) {
		ArrayList<Favorites> list = chatDao.selectFavoriteList(sqlSession,eno);
		return list;
	}

	@Override
	public int insertFavorites(Favorites f) {
		int result = chatDao.insertFavorites(sqlSession,f);
		
		if(result < 0) {
			throw new CommException("즐겨찾기 등록 실패");
		}		
	
		return result;
	}

	@Override
	public void deleteFavorites(Favorites f) {
		int result = chatDao.deleteFavorites(sqlSession,f);
		
		if(result < 0) {
			throw new CommException("즐겨찾기 해제 실패");
		}		
	
	}

	@Override
	public Favorites checkFavorites(Favorites f) {

		Favorites resultF = chatDao.checkFavorites(sqlSession,f);
		
		return resultF;
	}




}