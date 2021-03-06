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


//	@Override
//	public int insertNotify(CompanyNotice notice) {
//		// TODO Auto-generated method stub
//		int result=noticeDao.insertNotify(sqlSession,notice);
//		if(result<0) {
//			throw new CommException(" failed");
//		}
//		return result;
//	}












	@Override
	public ArrayList<NoReply> selectReplyList(int nno) {
		// TODO Auto-generated method stub
		return noticeDao.selectReplyList(sqlSession,nno);
	}
	
	


	@Override
	public int updateNotice(int nno) {
		// TODO Auto-generated method stub
		int result=noticeDao.updateNotice(sqlSession,nno);
//		if(result<0) {
//			throw new CommException("update 실패");
//		}
		return result;
	}







	@Override
	public void updateBNotice(CompanyNotice notice) {
		// TODO Auto-generated method stub
		int result=noticeDao.updateBNotice(sqlSession,notice);
	}







	@Override
	public void increaseSupport(int nno) {
		// TODO Auto-generated method stub
		int result=noticeDao.increaseSupport(sqlSession,nno);
	}







	@Override
	public int getListCountCon() {
		// TODO Auto-generated method stub

		
		int listCount=noticeDao.getListCountCon(sqlSession);
	
		return listCount;
	}







	@Override
	public ArrayList<CompanyNotice> selectListCon(String search) {
		// TODO Auto-generated method stub
		
		ArrayList<CompanyNotice> list=noticeDao.selectListCon(sqlSession,search);
		
		return list;
	}







	@Override
	public void deleteNotify(int nno) {
		// TODO Auto-generated method stub
		int result=noticeDao.deleteNotify(sqlSession,nno);
	}







	@Override
	public void deleteCall(int nno) {
		// TODO Auto-generated method stub
		int result=noticeDao.deleteCall(sqlSession,nno);
	}







	@Override
	public void updateTopBoard(int nno) {
		// TODO Auto-generated method stub
		int result=noticeDao.updateTopBoard(sqlSession,nno);
	}







	@Override
	public int deleteTopBoard(int nno) {
		// TODO Auto-generated method stub
		int result=noticeDao.deleteTopBoard(sqlSession,nno);
		
		return result;
	}







	
	
	
}
