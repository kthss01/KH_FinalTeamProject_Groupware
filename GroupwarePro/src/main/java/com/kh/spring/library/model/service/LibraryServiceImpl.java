package com.kh.spring.library.model.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.vo.SelectBoardListInfo;
import com.kh.spring.library.model.dao.LibraryDao;
import com.kh.spring.library.model.vo.LibraryBoard;

@Service
public class LibraryServiceImpl implements LibraryService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private LibraryDao libraryDao;

	@Override
	public int selectListCount(int cno) {

		int listCount = libraryDao.selectListCount(sqlSession, cno);

		return listCount;
	}

	@Override
	public ArrayList<LibraryBoard> selectBoardList(SelectBoardListInfo info) {
		ArrayList<LibraryBoard> list = libraryDao.selectBoardList(sqlSession, info);
		return list;
	}

	@Override
	public int insertBoard(LibraryBoard b) {
		int result = libraryDao.insertBoard(sqlSession, b);

		if (result < 0) {
			throw new CommException("자료 등록 실패");
		}
		return result;
	}

	@Override
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, String fileName) {

		response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		String saveFileName = savePath + fileName;
		String ext = fileName.substring(fileName.lastIndexOf(".")); // 확장자 추출

		File file = new File(saveFileName);
		long fileLength = file.length();

		String contentType = "";

		switch (ext) {
		case "hwp":
			contentType = "application/vnd.hancom.hwp";
			break;
		case "pdf":
			contentType = "application/pdf";
			break;
		case "xls":
			contentType = "application/vnd.ms-excel";
			break;
		case "xlsx":
			contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
			break;
		case "doc":
			contentType = "application/msword";
			break;
		case "txt":
			contentType = "text/plain";
			break;
		case "xml":
			contentType = "text/xml";
			break;
		case "xsl":
			contentType = "text/xsl";
			break;

		}

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileLength);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		FileInputStream fis = null;
		OutputStream out = null;
		try {

			fis = new FileInputStream(saveFileName);
			out = response.getOutputStream();
			// saveFileName을 파라미터로 넣어 inputStream 객체를 만들고
			// response에서 파일을 내보낼 OutputStream을 가져와서
			int readCount = 0;
			byte[] buffer = new byte[1024];
			// 파일 읽을 만큼 크기의 buffer를 생성한 후
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
				// outputStream에 씌워준다
			}
		} catch (Exception e) {
			throw new CommException("file Load Error");
		} finally {

			try {
				fis.close();
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/*
	 * @Override public LibraryCategory selectCategory(int cno) {
	 * 
	 * LibraryCategory category = libraryDao.selectCategory(sqlSession,cno);
	 * 
	 * return category; }
	 */
}
