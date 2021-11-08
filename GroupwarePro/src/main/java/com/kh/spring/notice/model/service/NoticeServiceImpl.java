package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.notice.model.vo.CompanyNotice;
import com.kh.spring.notice.model.vo.NoReply;

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

	@Override
	public CompanyNotice selectNotice(int nno) {
		// TODO Auto-generated method stub
		CompanyNotice notice=null;
		int result=noticeDao.increaseCount(sqlSession,nno);
		if(result<0) {
			throw new CommException("increaseCount 실패");
		}else {
			notice=noticeDao.selectNotice(sqlSession,nno);
		}
		return notice;
	}







	@Override
	public int insertReply(NoReply r) {
		// TODO Auto-generated method stub
		int result=noticeDao.insertReply(sqlSession,r);
		if(result<0) {
			throw new CommException("insertReply실패");
		}
		return result;
	}







	@Override
	public CompanyNotice selectNotify(int nno) {
		// TODO Auto-generated method stub
		CompanyNotice notice=null;
		
		notice=noticeDao.selectNotify(sqlSession,nno);
		return notice;
	}







	@Override
	public int insertNotify(CompanyNotice notice) {
		// TODO Auto-generated method stub
		int result=noticeDao.insertNotify(sqlSession,notice);
		if(result<0) {
			throw new CommException(" failed");
		}
		return result;
	}






	




	

	
	
	
	
	
	
	
	
	
	
	
}
