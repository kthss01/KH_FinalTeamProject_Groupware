package com.kh.spring.reservation.model.service;

import java.util.ArrayList;

import com.kh.spring.reservation.model.vo.Asset;
import com.kh.spring.reservation.model.vo.AssetCategory;
import com.kh.spring.reservation.model.vo.Reservation;

public interface ReservationService {

	ArrayList<Reservation> selectReservationList(int empNo);

	ArrayList<Asset> selectAsList();

	ArrayList<AssetCategory> selectAsCatList();
	
	int insertReservation(Reservation rez);

	int insertAsset(Asset as);

	int insertAssetCategory(AssetCategory asc);
	
	int updateReservation(Reservation rez);

	int updateAsset(Asset as);

	int updateAssetCategory(AssetCategory asc);
	
	int deleteReservation(int rezNo);

	int deleteAsset(int asNo);

	int deleteAssetCategory(int ascNo);

}