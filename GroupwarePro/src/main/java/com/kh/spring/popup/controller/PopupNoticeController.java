package com.kh.spring.popup.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.popup.model.service.PopupNoticeService;
import com.kh.spring.popup.model.vo.PopupNotice;

@Controller
public class PopupNoticeController {
	
	
	@Autowired
	PopupNoticeService pNoticeService;
	
	
	@RequestMapping("popupNoticeList.no")
	public String popupNoticeList(Model model) throws Exception {
		
		ArrayList<PopupNotice> list = pNoticeService.selectPNoticeList();
		model.addAttribute("list",list);
		
		return "popupNotice/popupNoticeList";
	}
	
	@RequestMapping("pNoticeInsertForm.no")
	public String popupNoticeInsertForm() {
		
		return "popupNotice/popupNoticeInsertForm";
	}
	
	
	@RequestMapping("pNoticeDetail.no")
	public String popupNoticeDetail(Model model,String popNo) {
		
		PopupNotice pNotice = pNoticeService.selectPNotice(popNo);
		model.addAttribute("pNotice",pNotice);
		
		return "popupNotice/popupNoticeDetail";
	}
	
	@RequestMapping("pNoticeUpdateForm.no")
	public String popupNoticeUpdateFrom(Model model,String popNo) {
		
		PopupNotice pNotice = pNoticeService.selectPNotice(popNo);
		model.addAttribute("pNotice",pNotice);
		
		return "popupNotice/popupNoticeUpdateForm";
	}
	
	@RequestMapping("updatepNotice.no")
	public String updatePopupNotice(@ModelAttribute PopupNotice p,Model model) {
		
		int result = pNoticeService.updatePNotice(p);
		
		return "redirect:/popupNoticeUpdateForm.no?popNo="+p.getPopNo();
	}
	
	
	@RequestMapping("insertPNotice.no")
	public String insertPopupNotice(PopupNotice p) {
		
		int result = pNoticeService.insertPNotice(p);
		
		return "redirect:/popupNoticeList.no";
	}
	
	@RequestMapping("deletePNotice.no")
	public String deletePopupNotice(String popNo) {
		
		int result = pNoticeService.deletePNotice(popNo);
		
		return "redirect:/popupNoticeList.no";
	}
	
	

}
