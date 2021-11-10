package com.kh.spring.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.reservation.model.vo.Asset;
import com.kh.spring.reservation.model.vo.AssetCategory;
import com.kh.spring.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {

	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectReservationList", empNo);
	}

	public ArrayList<Asset> selectAsList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectAsList");
	}

	public ArrayList<AssetCategory> selectAsCatList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectAsCatList");
	}
	
	public int insertReservation(SqlSessionTemplate sqlSession, Reservation rez) {
		return sqlSession.insert("reservationMapper.insertReservation", rez);
	}

	public int insertAsset(SqlSessionTemplate sqlSession, Asset as) {
		return sqlSession.insert("reservationMapper.insertAsset", as);
	}
	
	public int insertAssetCategory(SqlSessionTemplate sqlSession, AssetCategory asc) {
		return sqlSession.insert("reservationMapper.insertAssetCategory", asc);
	}

	public int updateReservation(SqlSessionTemplate sqlSession, Reservation rez) {
		return sqlSession.update("reservationMapper.updateReservation", rez);
	}

	public int updateAsset(SqlSessionTemplate sqlSession, Asset as) {
		return sqlSession.update("reservationMapper.updateAsset", as);
	}
	
	public int updateAssetCategory(SqlSessionTemplate sqlSession, AssetCategory asc) {
		return sqlSession.update("reservationMapper.updateAssetCategory", asc);
	}

	public int deleteReservation(SqlSessionTemplate sqlSession, int rezNo) {
		return sqlSession.update("reservationMapper.deleteReservation", rezNo);
	}

	public int deleteAsset(SqlSessionTemplate sqlSession, int asNo) {
		return sqlSession.update("reservationMapper.deleteAsset", asNo);
	}

	public int deleteAssetCategory(SqlSessionTemplate sqlSession, int ascNo) {
		return sqlSession.update("reservationMapper.deleteAssetCategory", ascNo);
	}

}
