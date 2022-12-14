package com.somoim.controller5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.somoim.DTO.ApplyDTO;
import com.somoim.service.applyService;


@Controller
public class applyController {
  private ModelAndView mav;
  @Autowired
  private applyService applyservice;
  
 
  
	@RequestMapping(value = "/applyWriteForm")
	public ModelAndView applyWriteForm(int a_bcode) {
		System.out.println("/applyWriteForm");
		System.out.println("a_bcode" + a_bcode);
		mav = applyservice.applyWriteForm(a_bcode);
		
		return mav;
	}
	
	@RequestMapping(value = "/applyWrite")
	public ModelAndView applyWrite(ApplyDTO applyDTO) {
		System.out.println("/applyWrite");
		System.out.println(applyDTO);
		mav = applyservice.applyWrite(applyDTO);
		return mav;
	}
	
	@RequestMapping(value = "/myboardApply")
	public ModelAndView myboardApply(int a_bcode) {
		System.out.println("/myboardApply");
		System.out.println("a_bcode ::" + a_bcode);
		mav = applyservice.myboardApply(a_bcode);
		return mav;
	}
	
	@RequestMapping(value = "/applyApproval")
	public @ResponseBody String applyApproval(ApplyDTO applyDTO) {
		System.out.println("/applyApproval");
		System.out.println(applyDTO);
		String applyApproval = applyservice.applyApproval(applyDTO);
		return applyApproval;
	}
	
	@RequestMapping(value = "/applyRefuse")
	public @ResponseBody String applyRefuse(ApplyDTO applyDTO) {
		System.out.println("/applyRefuse");
		System.out.println(applyDTO);
		String applyRefuse = applyservice.applyRefuse(applyDTO);
		return applyRefuse;
	}
	@RequestMapping(value = "/MyapplyList")
	public ModelAndView MyapplyList(String a_memail) {
		System.out.println("/MyapplyList");
		System.out.println("a_meail ::" + a_memail);
		mav = applyservice.MyapplyList(a_memail);
		return mav;
	}
	
	@RequestMapping(value = "/applydelete")
	public ModelAndView applyDelete(ApplyDTO applyDTO) {
		System.out.println("/applyDelete");
		System.out.println(applyDTO);
		mav = applyservice.applyDelete(applyDTO);
		return mav;
	}
}
