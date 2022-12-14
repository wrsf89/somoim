package com.somoim.controller5;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.somoim.DTO.MessageDTO;
import com.somoim.service.Messageservice;


@Controller
public class MessageController {
 
	private ModelAndView mav;
	
	@Autowired
	private Messageservice messageservice;
	
	@RequestMapping(value = "/massageForm")
	public String magForm() {
		System.out.println("/messageForm");
		return "/member/messageForm";
	}
	
	@RequestMapping(value = "/sendMessage")
	public @ResponseBody String sendMessage(MessageDTO msgDTO) {
		System.out.println("/sendMessage_msgDTO::"+msgDTO);
		String sendResult = messageservice.sendMessage(msgDTO) ;
		return sendResult;
	}
	@RequestMapping(value = "/receiveMessage")
	public @ResponseBody ArrayList<MessageDTO> receiveMessage(String msg_receiveid){
		System.out.println("/receiveMessage_msg_receiveid::"+msg_receiveid);
		ArrayList<MessageDTO> messageList = messageservice.receiveMessage(msg_receiveid);
		return messageList;
	}
	@RequestMapping(value = "/checkMsg")
	public @ResponseBody String checkMsg(MessageDTO msgDTO) {
		System.out.println("/checkMsg"+msgDTO);
		String checkResult = messageservice.checkMsg(msgDTO);
		return checkResult;
	}
	@RequestMapping(value = "/MyMsgList")
	public String MyMsgList() {
		System.out.println("/MyMsgList");
		return "/member/MyMsgList";
	}

}
 