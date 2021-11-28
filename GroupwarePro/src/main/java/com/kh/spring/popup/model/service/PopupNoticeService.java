package com.kh.spring.popup.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.spring.popup.model.vo.PopupNotice;

@Service
public interface PopupNoticeService {

	ArrayList<PopupNotice> selectPNoticeList();

	int insertPNotice(PopupNotice p);

	int deletePNotice(String popNo);

	int updatePNotice(PopupNotice popupNotice);

	PopupNotice selectPNotice(String popNo);

	ArrayList<PopupNotice> selectPNoticeNewList();

	
	
}
