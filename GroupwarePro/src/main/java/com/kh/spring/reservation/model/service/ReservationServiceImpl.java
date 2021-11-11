package com.kh.spring.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.reservation.model.dao.ReservationDao;
import com.kh.spring.reservation.model.vo.Asset;
import com.kh.spring.reservation.model.vo.AssetCategory;
import com.kh.spring.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ReservationDao reservationDao;

	@Override
	public ArrayList<Reservation> selectReservationList(int empNo) {
		return reservationDao.selectReservationList(sqlSession, empNo);
	}

	@Override
	public ArrayList<Asset> selectAsList() {
		return reservationDao.selectAsList(sqlSession);
	}
	
	@Override
	public ArrayList<AssetCategory> selectAsCatList() {
		return reservationDao.selectAsCatList(sqlSession);
	}

	@Override
	public ArrayList<Asset> selectAsWithCatList() {
		return reservationDao.selectAsWithCatList(sqlSession);
	}
	
	@Override
	public int insertReservation(Reservation rez) {
		int result = reservationDao.insertReservation(sqlSession, rez);

		if (result <= 0) {
			throw new CommException("예약 생성 실패");
		}

		return result;
	}

	@Override
	public int insertAsset(Asset as) {
		int result = reservationDao.insertAsset(sqlSession, as);

		if (result <= 0) {
			throw new CommException("자산 생성 실패");
		}

		return result;
	}
	
	@Override
	public int insertAssetCategory(AssetCategory asc) {
		int result = reservationDao.insertAssetCategory(sqlSession, asc);

		if (result <= 0) {
			throw new CommException("자산 목록 생성 실패");
		}

		return result;
	}

	@Override
	public int updateReservation(Reservation rez) {
		int result = reservationDao.updateReservation(sqlSession, rez);

		if (result <= 0) {
			throw new CommException("예약 수정 실패");
		}

		return result;
	}

	@Override
	public int updateAsset(Asset as) {
		int result = reservationDao.updateAsset(sqlSession, as);

		if (result <= 0) {
			throw new CommException("자산 수정 실패");
		}

		return result;
	}
	
	@Override
	public int updateAssetCategory(AssetCategory asc) {
		int result = reservationDao.updateAssetCategory(sqlSession, asc);

		if (result <= 0) {
			throw new CommException("자산 목록 수정 실패");
		}

		return result;
	}

	@Override
	public int deleteReservation(int rezNo) {
		int result = reservationDao.deleteReservation(sqlSession, rezNo);

		if (result <= 0) {
			throw new CommException("예약 삭제 실패");
		}

		return result;
	}

	@Override
	public int deleteAsset(int asNo) {
		int result = reservationDao.deleteAsset(sqlSession, asNo);

		if (result <= 0) {
			throw new CommException("자산 삭제 실패");
		}

		return result;
	}

	@Override
	public int deleteAssetCategory(int ascNo) {
		int result = reservationDao.deleteAssetCategory(sqlSession, ascNo);

		if (result <= 0) {
			throw new CommException("자산 목록 삭제 실패");
		}

		return result;
	}

}
