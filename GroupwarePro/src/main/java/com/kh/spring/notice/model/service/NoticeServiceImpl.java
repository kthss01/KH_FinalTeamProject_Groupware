package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.notice.model.vo.CompanyNotice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;

	

	



	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return NoticeDao.selectListCount(sqlSession);
	}







	@Override
	public ArrayList<CompanyNotice> selectNoticeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return NoticeDao.selectNoticeList(sqlSession,pi);
	}







	@Override
	public void insertNotice(CompanyNotice notice) {
		// TODO Auto-generated method stub
		int result=NoticeDao.insertNotice(sqlSession,notice);
		if(result<0) {
			throw new CommException("INSERT 실패");
		}
		
	}

	
	
	
	
	
	
	
	
	
	
	
}
