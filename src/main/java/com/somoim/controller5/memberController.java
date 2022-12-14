package com.somoim.controller5;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.somoim.DTO.MemberDTO;
import com.somoim.service.memberService;


@Controller
public class memberController {

	private ModelAndView mav;
	
	@Autowired
	private memberService memberservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/joinForm")
	public String joinForm() {
		System.out.println("/joinForm");
		return "member/memberJoinForm";
	}
	
	@RequestMapping(value = "/idCheck")
	public @ResponseBody String idCheck(String inputMemail) {
		String checkResult = memberservice.idCheck(inputMemail);
		return checkResult;
	}
	
	@RequestMapping(value = "/nicknameCheck")
	public @ResponseBody String nicknameCheck(String inputMnickname) {
		String checkResult = memberservice.nicknameCheck(inputMnickname);
		return checkResult;
	}
	
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDTO memberDTO) throws IllegalStateException, IOException {
		System.out.println("/memberJoin");
		System.out.println(memberDTO);
		mav = memberservice.memberJoin(memberDTO);
		
		
		return mav;
	}
	@RequestMapping(value = "/loginForm")
	public String loginForm() {
		System.out.println("/loginForm");
		return "member/memberLoginForm";
	}
	
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(MemberDTO memberDTO) {
		System.out.println("/memberLogin");
		mav = memberservice.memberLogin(memberDTO);
		return mav;
	}
	
	@RequestMapping(value = "/memberLogout")
	public String memberLogout() {
		System.out.println("/memberLogout");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/memberView")
	public ModelAndView memberView(String m_email) {
		System.out.println("/memberView");
		System.out.println("m_email : " + m_email);
		mav = memberservice.memberView(m_email);
		return mav;
	}
	
	@RequestMapping(value = "/memberDelete")
	public ModelAndView memberDelete(String m_email) {
		System.out.println("/memberDelete");
		System.out.println("m_email : " + m_email);
		mav = memberservice.memberDelete(m_email);
		session.invalidate();
		return mav;
	}
	@RequestMapping(value = "/mpasswordUpdate")
	public @ResponseBody String mpasswordUpdate(MemberDTO memberDTO) {
		System.out.println("/mpasswordUpdate");
		String updateResult = memberservice.mpasswordUpdate(memberDTO);
		return updateResult;
	}
	
	@RequestMapping(value = "/mnicknameUpdate")
	public @ResponseBody String mnicknameUpdate(MemberDTO memberDTO) {
		System.out.println("/mnicknameUpdate");
		String updateResult = memberservice.mnicknameUpdate(memberDTO);
		return updateResult;
	}
	
	@RequestMapping(value = "/mphoneUpdate")
	public @ResponseBody String mphoneUpdate(MemberDTO memberDTO) {
		System.out.println("/mphoneUpdate");
		String updateResult = memberservice.mphoneUpdate(memberDTO);
		return updateResult;
	}
	
	@RequestMapping(value = "/passwordSearch")
	public String passwordSearch() {
		System.out.println("/passwordSearch");
		return "member/passwordSearch";
	}
	

}
