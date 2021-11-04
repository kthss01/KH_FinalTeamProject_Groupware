package com.kh.spring.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.calendar.model.vo.Attendant;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;
import com.kh.spring.common.exception.CommException;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public ArrayList<Event> selectEventList() {
		
		ArrayList<Event> list = calendarDao.selectEventList(sqlSession);
		return list;
	}

	@Override
	public ArrayList<Attendant> selectAttList(int evtNo) {
		ArrayList<Attendant> list = calendarDao.selectAttList(sqlSession, evtNo);
		return list;
	}

	@Override
	public ArrayList<Calendar> selectMyCalList(int empNo) {
		ArrayList<Calendar> list = calendarDao.selectMyCalList(sqlSession, empNo);
		return list;
	}

	@Override
	public int insertEvent(Event evt, int calNo) {

		// insertEvent
		int result = calendarDao.insertEvent(sqlSession, evt);
		
		if (result < 0) {
			throw new CommException("이벤트 등록 실패");
		}
		
		int evtNo = calendarDao.selectEvtNo(sqlSession) - 1; // 이게 마지막 번호가 아니라 다음 번호였음
		
		// insertAttendant
		for (Attendant att : evt.getAttendantList()) {
			att.setEvtNo(evtNo);
			result = calendarDao.insertAttendant(sqlSession, att);
			
			if (result < 0) {
				throw new CommException("참석자 등록 실패");
			}
		}
		
		// insertEvtCalReg
		result = calendarDao.insertEvtCalReg(sqlSession, calNo, evtNo);
		
		if (result < 0) {
			throw new CommException("캘린더 이벤트 등록 실패");
		}
		
		return result;
	}

	@Override
	public int selectAttCount() {
		return calendarDao.selectAttCount(sqlSession);
	}

	@Override
	public int insertCalendar(Calendar cal) {
		// insertCalendar
		int result = calendarDao.insertCalendar(sqlSession, cal);
		
		if (result < 0) {
			throw new CommException("캘린더 등록 실패");
		}
		
		int calNo = calendarDao.selectCalNo(sqlSession) - 1;
		cal.setCalNo(calNo);
		
		// insertCalReg
		result = calendarDao.insertCalReg(sqlSession, cal);
		
		if (result < 0) {
			throw new CommException("My 캘린더 등록 실패");
		}
		
		return result;
	}

}
