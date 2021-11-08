package com.kh.spring.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.reservation.model.service.ReservationService;
import com.kh.spring.reservation.model.vo.Asset;
import com.kh.spring.reservation.model.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("reservation.rez")
	public String main(){
		return "/reservation/reservation";
	}
	
	/************************************************************************************************************************/
	
	@ResponseBody
	@RequestMapping(value="selectReservationList.rez", produces="application/json; charset=utf-8")
	public String selectReservationList(int empNo) {
		
		ArrayList<Reservation> list = reservationService.selectReservationList(empNo); 
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="selectAsList.rez", produces="application/json; charset=utf-8")
	public String selectAsList() {
		
		ArrayList<Asset> list = reservationService.selectAsList();
		
		return new GsonBuilder().create().toJson(list);
	}
	
	/************************************************************************************************************************/
	
	@ResponseBody
	@RequestMapping("insertReservation.rez")
	public String insertReservation(Reservation rez) {
		
		int result = reservationService.insertReservation(rez);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("insertAsset.rez")
	public String insertAsset(Asset as) {
		
		int result = reservationService.insertAsset(as);
		
		return String.valueOf(result);
	}
	
	/************************************************************************************************************************/
	
	@ResponseBody
	@RequestMapping("updateReservation.rez")
	public String updateReservation(Reservation rez) {
		
		int result = reservationService.updateReservation(rez);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("updateAsset.rez")
	public String updateAsset(Asset as) {
		
		int result = reservationService.updateAsset(as);
		
		return String.valueOf(result);
	}
	
	/************************************************************************************************************************/
	
	@ResponseBody
	@RequestMapping("deleteReservation.rez")
	public String deleteReservation(int rezNo) {
		
		int result = reservationService.deleteReservation(rezNo);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("deleteAsset.rez")
	public String deleteAsset(int asNo) {
		
		int result = reservationService.deleteAsset(asNo);
		
		return String.valueOf(result);
	}
}