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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
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
	@RequestMapping(value="insert.bo",method = RequestMethod.POST)//produces="application/json; charset=utf-8"
	public String insert(HttpServletRequest request,ArrayList<TblMeals> alldata) {
		
		
		//json형태의 문자열을  배열로 변환
		
		
		
		

		
		int result=tblMealsService.insert(alldata);
		
		
		
		if(result>0) {
			System.out.println("insert success");
		}
		
			
		return "성공";
		
	}
	

	//방법2
//	@ResponseBody
//	@RequestMapping(value="insert.bo",method = RequestMethod.POST,produces="application/json; charset=utf-8")
//	public String insert(HttpServletRequest request,@RequestBody String paramData) {
//		
//
//		
//		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
//	    resultMap = JSONArray.fromObject(paramData);
//	         
//	    for (Map<String, Object> map : resultMap) {
//	        System.out.println(map.get("lnc") + " : " + map.get("startDate")+map.get("endDate"));
//	        //관리자 : 1111
//	        //직원 : 2222
//	    }
//
//
//		
//		
//		
//		
//		int result=tblMealsService.insert(resultMap);
//		if(result>0) {
//			System.out.println("insert success");
//		}
//		
//			
//		return "성공";
//		
//	}
	
	
	
	@ResponseBody
	@RequestMapping(value="list.bo",produces="application/json; charset=utf-8")
	public String selectList(HttpServletRequest request) {	
		

		ArrayList<TblMealsCal> tList=tblMealsService.selectList();
		System.out.println(tList);
		
		JSONArray jsonArray = new JSONArray();
		
		for (int i = 0; i < tList.size(); i++) {
		 
		            JSONObject data = new JSONObject();
		            data.put("tList", tList);
		            jsonArray.add(i, data);    
		 }
	

	
		
		
		//return jsonArray.toString();
		return new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create().toJson(tList);            
		
		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		ArrayList<TblMealsCal> planList = tblMealsService.selectList();
//		map.put("planList", planList);
//		return map;
		
		
	}
	
	
	
}
