package com.kh.spring.library.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.spring.community.model.vo.SelectBoardListInfo;
import com.kh.spring.library.model.vo.LibraryBoard;

public interface LibraryService {

	int selectListCount(int cno);

	ArrayList<LibraryBoard> selectBoardList(SelectBoardListInfo info);

	int insertBoard(LibraryBoard b);

	void fileDownload(HttpServletRequest request, HttpServletResponse response, String fileName);




	/*
	 * LibraryCategory selectCategory(int cno);
	 */
}
