package com.kh.spring.reservation.model.service;

import java.util.ArrayList;

import com.kh.spring.reservation.model.vo.Asset;
import com.kh.spring.reservation.model.vo.Reservation;

public interface ReservationService {

	ArrayList<Reservation> selectReservationList(int empNo);

	ArrayList<Asset> selectAsList();

	int insertReservation(Reservation rez);

	int insertAsset(Asset as);

	int updateReservation(Reservation rez);

	int updateAsset(Asset as);

	int deleteReservation(int rezNo);

	int deleteAsset(int asNo);

}