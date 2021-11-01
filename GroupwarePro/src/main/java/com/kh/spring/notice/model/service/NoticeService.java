package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import com.kh.spring.common.PageInfo;
import com.kh.spring.notice.model.vo.CompanyNotice;


public interface NoticeService {

	

	

	int selectListCount();

	ArrayList<CompanyNotice> selectNoticeList(PageInfo pi);

	void insertNotice(CompanyNotice notice);

	

	

}
