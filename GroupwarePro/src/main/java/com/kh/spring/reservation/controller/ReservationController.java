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
import com.kh.spring.reservation.model.vo.AssetCategory;
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
	@RequestMapping(value="selectRezList.rez", produces="application/json; charset=utf-8")
	public String selectRezList() {
		
		ArrayList<Reservation> list = reservationService.selectRezList(); 
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create().toJson(list);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectAsList.rez", produces="application/json; charset=utf-8")
	public String selectAsList() {
		
		ArrayList<Asset> list = reservationService.selectAsList();
		
		return new GsonBuilder().create().toJson(list);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectAsCatList.rez", produces="application/json; charset=utf-8")
	public String selectAsCatList() {
		
		ArrayList<AssetCategory> list = reservationService.selectAsCatList();
		
		return new GsonBuilder().create().toJson(list);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectAsWithCatList.rez", produces="application/json; charset=utf-8")
	public String selectAsWithCatList() {
		
		ArrayList<Asset> list = reservationService.selectAsWithCatList();
		
		return new GsonBuilder().create().toJson(list);
		
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectRezListForCat.rez", produces="application/json; charset=utf-8")
	public String selectRezListForCat(int ascNo) {
		
		ArrayList<Reservation> list = reservationService.selectRezListForCat(ascNo); 
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create().toJson(list);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectAsListForCat.rez", produces="application/json; charset=utf-8")
	public String selectAsListForCat(int ascNo) {
		
		ArrayList<Asset> list = reservationService.selectAsListForCat(ascNo);
		
		return new GsonBuilder().create().toJson(list);
		
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertReservation.rez", method=RequestMethod.POST)
	public String insertReservation(Reservation rez) {
		
		int result = 0;
		
		if (rez.getAsNo() != 0) {			
			result = reservationService.insertReservation(rez);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertAsset.rez", method=RequestMethod.POST)
	public String insertAsset(Asset as) {
		
		int result = 0;
		
		if (as.getAscNo() != 0) {
			result = reservationService.insertAsset(as);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertAssetCategory.rez", method=RequestMethod.POST)
	public String insertAssetCategory(AssetCategory asc) {
		
		int result = 0;
		
		result = reservationService.insertAssetCategory(asc);
		
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
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="updateAssetCategory.rez", method=RequestMethod.PUT)
	public String updateAssetCategory(AssetCategory asc) {

		int result = 0;
		
		if (asc.getAscNo() != 0) {
			result = reservationService.updateAssetCategory(asc);
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
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="deleteAssetCategory.rez", method=RequestMethod.DELETE)
	public String deleteAssetCategory(int ascNo) {
		
		int result = 0;
		
		if (ascNo != 0) {
			result = reservationService.deleteAssetCategory(ascNo);
		}
		
		return String.valueOf(result);
	}
}