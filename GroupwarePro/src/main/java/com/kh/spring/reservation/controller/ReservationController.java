package com.kh.spring.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectReservationList.rez", produces="application/json; charset=utf-8")
	public String selectReservationList(int empNo) {
		
		ArrayList<Reservation> list = reservationService.selectReservationList(empNo); 
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create().toJson(list);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectAsList.rez", produces="application/json; charset=utf-8")
	public String selectAsList() {
		
		ArrayList<Asset> list = reservationService.selectAsList();
		
		return new GsonBuilder().create().toJson(list);
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertReservation.rez", method=RequestMethod.POST)
	public String insertReservation(Reservation rez) {
		
		int result = 0;
		
		if (rez.getRezNo() != 0) {			
			result = reservationService.insertReservation(rez);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertAsset.rez", method=RequestMethod.POST)
	public String insertAsset(Asset as) {
		
		int result = 0;
		
		if (as.getAsNo() != 0) {
			result = reservationService.insertAsset(as);
		}
		
		return String.valueOf(result);
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="updateReservation.rez", method=RequestMethod.PUT)
	public String updateReservation(Reservation rez) {
		
		int result = 0;
		
		if (rez.getRezNo() != 0) {
			result = reservationService.updateReservation(rez);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="updateAsset.rez", method=RequestMethod.PUT)
	public String updateAsset(Asset as) {

		int result = 0;
		
		if (as.getAsNo() != 0) {
			result = reservationService.updateAsset(as);
		}
		
		return String.valueOf(result);
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="deleteReservation.rez", method=RequestMethod.DELETE)
	public String deleteReservation(int rezNo) {
		
		int result = 0;
		
		if (rezNo != 0) {
			result = reservationService.deleteReservation(rezNo);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="deleteAsset.rez", method=RequestMethod.DELETE)
	public String deleteAsset(int asNo) {
		
		int result = 0;
		
		if (asNo != 0) {
			result = reservationService.deleteAsset(asNo);
		}
		
		return String.valueOf(result);
	}
}