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

		if (result <= 0) {
			throw new CommException("이벤트 등록 실패");
		}

		int evtNo = calendarDao.selectEvtNo(sqlSession) - 1; // 이게 마지막 번호가 아니라 다음 번호였음

		// insertAttendant
		for (Attendant att : evt.getAttendantList()) {
			att.setEvtNo(evtNo);
			result = calendarDao.insertAttendant(sqlSession, att);

			if (result <= 0) {
				throw new CommException("참석자 등록 실패");
			}
		}

		// insertEvtCalReg
		result = calendarDao.insertEvtCalReg(sqlSession, calNo, evtNo);

		if (result <= 0) {
			throw new CommException("캘린더 이벤트 등록 실패");
		}

		return result;
	}

	@Override
	public int insertCalendar(Calendar cal) {
		// insertCalendar
		int result = calendarDao.insertCalendar(sqlSession, cal);

		if (result <= 0) {
			throw new CommException("캘린더 등록 실패");
		}

		int calNo = calendarDao.selectCalNo(sqlSession) - 1;
		cal.setCalNo(calNo);

		// insertCalReg
		result = calendarDao.insertCalReg(sqlSession, cal);

		if (result <= 0) {
			throw new CommException("My 캘린더 등록 실패");
		}

		return result;
	}

	@Override
	public int selectEvtNo() {
		return calendarDao.selectEvtNo(sqlSession);
	}

	@Override
	public int selectAttNo() {
		return calendarDao.selectAttNo(sqlSession);
	}

	@Override
	public int selectCalNo() {
		return calendarDao.selectCalNo(sqlSession);
	}

	@Override
	public int deleteEvent(int evtNo) {
		return calendarDao.deleteEvent(sqlSession, evtNo);
	}

	@Override
	public int deleteCalendar(int calNo) {
		return calendarDao.deleteCalendar(sqlSession, calNo);
	}

	@Override
	public int updateEvent(Event evt) {

		int result = 0;
		
		ArrayList<Attendant> oldList = calendarDao.selectAttList(sqlSession, evt.getEvtNo());

		if (evt.getAttendantList() != null && !isSameAtt(evt.getAttendantList(), oldList)) {

			result = calendarDao.deleteAttendant(sqlSession, evt.getEvtNo());

			if (result <= 0) {
				throw new CommException("참석자 삭제 실패");
			}

			// insertAttendant
			for (Attendant att : evt.getAttendantList()) {
				result = calendarDao.insertAttendant(sqlSession, att);

				if (result <= 0) {
					throw new CommException("참석자 등록 실패");
				}
			}

		}
		
		if (checkChangeEvent(evt)) {
			result = calendarDao.updateEvent(sqlSession, evt);
			
			if (result <= 0) {
				throw new CommException("이벤트 수정 실패");
			}
		}

		return result;
	}

	private boolean checkChangeEvent(Event evt) {
		if (evt.getName() != null || evt.getStartDate() != null || evt.getEndDate() != null 
				|| evt.getLocation() != null || evt.getContent() != null || evt.getCatNo() != 0)
			return true;
		return false;
	}

	private boolean isSameAtt(ArrayList<Attendant> newList, ArrayList<Attendant> oldList) {

		if (newList.size() != oldList.size()) {
			return false;
		} else {
			for (int i = 0; i < newList.size(); i++) {
				if (newList.get(i).getAttNo() != oldList.get(i).getAttNo()) {
					return false;
				}
			}
		}

		return true;
	}

	@Override
	public int updateCalendar(Calendar cal) {

		int result = 0;
		
		if (cal.getColor() != null) {
			result = calendarDao.updateCalRegistration(sqlSession, cal);

			if (result < 0) {
				throw new CommException("캘린더 설정 수정 실패");
			}
		}

		if (cal.getName() != null) {
			result = calendarDao.updateCalRegistration(sqlSession, cal);

			if (result < 0) {
				throw new CommException("캘린더 수정 실패");
			}			
		}
		
		return result;
	}

}
