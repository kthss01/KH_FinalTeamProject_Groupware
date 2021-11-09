package com.kh.spring.tblMeals.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.tblMeals.model.service.TblMealsService;
import com.kh.spring.tblMeals.model.vo.TblMeals;





@Controller
public class TblMealsController {
	
	
	
	@Autowired
	private TblMealsService tblMealsService;
	
	@RequestMapping("tblMeals.bo")
	public String tblMeals() {
	   return "tblMeals/tblMeals";
	}
	
	@RequestMapping("registerForm.bo")
	public String registerForm() {
	   return "tblMeals/tmRegisterForm";
	}
	
	@RequestMapping("insertT.bo")
	public String insertT(TblMeals tm,HttpServletRequest request,Model model) {
		   
	
			tblMealsService.insertT(tm);


			return "redirect:/tblMeals.bo";
	}
	
	
	
	
	
}
