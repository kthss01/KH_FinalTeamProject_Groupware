package com.kh.spring.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.reservation.model.vo.Asset;
import com.kh.spring.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {

	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectReservationList", empNo);
	}

	public ArrayList<Asset> selectAsList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectAsList");
	}

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation rez) {
		return sqlSession.insert("reservationMapper.insertReservation", rez);
	}

	public int insertAsset(SqlSessionTemplate sqlSession, Asset as) {
		return sqlSession.insert("reservationMapper.insertAsset", as);
	}

	public int updateReservation(SqlSessionTemplate sqlSession, Reservation rez) {
		return sqlSession.update("reservationMapper.updateReservation", rez);
	}

	public int updateAsset(SqlSessionTemplate sqlSession, Asset as) {
		return sqlSession.update("reservationMapper.updateAsset", as);
	}

	public int deleteReservation(SqlSessionTemplate sqlSession, int rezNo) {
		return sqlSession.update("reservationMapper.deleteReservation", rezNo);
	}

	public int deleteAsset(SqlSessionTemplate sqlSession, int asNo) {
		return sqlSession.update("reservationMapper.deleteAsset", asNo);
	}

}
