package com.kh.spring.tblMeals.controller;


import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.common.Pagination;
import com.kh.spring.tblMeals.model.service.TblMealsService;
import com.kh.spring.tblMeals.model.vo.TblMeals;
import com.kh.spring.tblMeals.model.vo.TblMealsCal;




@Controller
public class TblMealsController {
	
	
	
	@Autowired
	private TblMealsService tblMealsService;
	
	
	
	
	
	
	
	@RequestMapping("registerForm.bo")
	public String registerForm() {
	   return "tblMeals/tmRegisterForm";
	}
	
//	@RequestMapping("insertT.bo")
//	public String insertT(TblMeals tm,HttpServletRequest request,Model model) {
//		   
//	
//			tblMealsService.insertT(tm);
//
//
//			return "redirect:/tblMeals.bo";
//	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("cal.bo")
	public String calendar(@RequestParam("command") String command) {
		
		if(command.equals("calendar")) {
			System.out.println("!!!!");
		}
		
	   return "tblMeals/tbl_meals";
	}
	
	@RequestMapping("test.bo")
	public String test() {
	   return "tblMeals/calendar";
	}
	
	
	
	@RequestMapping("testCal.bo")
	public String testCal() {
	   return "tblMeals/tbl_meals";
	}
	
	
	@ResponseBody
	@RequestMapping(value="insert.bo",method = RequestMethod.POST,produces="application/json; charset=utf-8")
	public String insert(HttpServletRequest request,@RequestBody ArrayList<Map> alldata) {

		
		//json형태의 문자열을  배열로 변환
		System.out.println(alldata);
		
	    
		
		

	
		
		//tblMealsService.insert(anlysList);
		
			
		return "성공";
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="list.bo",produces="application/json; charset=utf-8")
	public String selectList(Model model,HttpServletRequest request) {	
		

		ArrayList<TblMealsCal> tList=tblMealsService.selectList();
		System.out.println(tList);
		
		JSONArray jsonArray = new JSONArray();
		
		for (int i = 0; i < tList.size(); i++) {
		 
		            JSONObject data = new JSONObject();
		            data.put("tList", tList);
		            jsonArray.add(i, data);    
		 }
	
		
		
		//model.addAttribute("list",list);
	
		
		
		return jsonArray.toString();

		
		
	}
	
	
	
}
