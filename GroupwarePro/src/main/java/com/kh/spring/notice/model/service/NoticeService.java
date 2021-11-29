package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import com.kh.spring.common.PageInfo;
import com.kh.spring.notice.model.vo.CompanyNotice;
import com.kh.spring.notice.model.vo.NoReply;


public interface NoticeService {

	

	

	int selectListCount();

	ArrayList<CompanyNotice> selectNoticeList(PageInfo pi);

	void insertNotice(CompanyNotice notice);

	CompanyNotice selectNotice(int nno);

	int insertReply(NoReply r);

	CompanyNotice selectNotify(int nno);

	//int insertNotify(CompanyNotice notice);



	ArrayList<NoReply> selectReplyList(int nno);

	int updateNotice(int nno);

	void updateBNotice(CompanyNotice notice);

	void increaseSupport(int nno);

	int getListCountCon();

	ArrayList<CompanyNotice> selectListCon(String search);

	void deleteNotify(int nno);

	void deleteCall(int nno);

	void updateTopBoard(int nno);

	int deleteTopBoard(int nno);



	

	

}
