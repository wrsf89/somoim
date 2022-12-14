package com.somoim.controller5;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somoim.DTO.MemberDTO;
import com.somoim.service.memberService;


@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private memberService memberservice;
    
	@RequestMapping(value = "/selectFindPassword")
	public @ResponseBody String selectFindPassword(MemberDTO memberDTO) {
		// 회원목록에 메일과 이름이 일치하는 회원이 있는지 확인
		System.out.println("/selectFindPassword");
		System.out.println(memberDTO);
		String selectFindPassword = memberservice.selectFindPassword(memberDTO);
		return selectFindPassword;
	}
	
	
	@RequestMapping(value = "/findPassword")
	public String findPassword(String m_email, String m_name, Model model) {
	   MemberDTO memberDTO = new MemberDTO();
       System.out.println("m_email ::" + m_email + "m_name ::" + m_name);
		// 임시비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		System.out.println("newPassword ::" + pw);
	
		// 비밀번호를 임시비밀번호로 변경
		int updateReuslt = memberservice.findPassword(m_email,pw); 

		String setfrom = "guranama0@gmail.com";
		String tomail = m_email; // 받는 사람 이메일
		String title = "somoim 임시비밀번호 메일입니다."; // 제목
		String content = m_name + " 님의 임시비밀번호는 : " + pw + "입니다"; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		 
		return "member/memberLoginForm";
	}

}
