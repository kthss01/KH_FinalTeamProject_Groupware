package com.kh.spring.popup.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.popup.model.dao.PopupNoticeDao;
import com.kh.spring.popup.model.vo.PopupNotice;

@Service
public class PopupNoticeServiceImpl implements PopupNoticeService{
	
	
	@Autowired
	SqlSessionTemplate session;

	@Autowired
	PopupNoticeDao popupNoticeDao;

	@Override
	public ArrayList<PopupNotice> selectPNoticeList() {
		
		ArrayList<PopupNotice> list = popupNoticeDao.selectPNoticeList(session);
		
		return list;
	}

	@Override
	public int insertPNotice(PopupNotice p) {
		
		int result = popupNoticeDao.insertPNotice(session,p);
		
		return result;
	}

	@Override
	public int deletePNotice(String popNo) {
		
		int result = popupNoticeDao.deletePNotice(session,popNo);
		
		return result;
	}

	@Override
	public int updatePNotice(PopupNotice p) {
		
		int result = popupNoticeDao.updatePNotice(session,p);
		
		return result;
	}

	@Override
	public PopupNotice selectPNotice(String popNo) {
		
		PopupNotice pNotice = popupNoticeDao.selectPNotice(session,popNo);
		
		return pNotice;
	}


	
	

	
	
	
	
}
