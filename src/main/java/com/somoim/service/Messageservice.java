package com.somoim.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somoim.DTO.MessageDTO;
import com.somoim.mapper.MessageMapper;

@Service
public class Messageservice {

	@Autowired
	private MessageMapper msgMapper;

	public String sendMessage(MessageDTO msgDTO) {
		int insertResult = msgMapper.sendMessage(msgDTO);
		String sendResult = "";
		if(insertResult>0) {
			sendResult = "OK";
		}else {
			sendResult = "NO";
		}
	
	
		return sendResult;
	}
	public ArrayList<MessageDTO> receiveMessage(String msg_receiveid) {
		ArrayList<MessageDTO> messageList = msgMapper.receiveMessage(msg_receiveid);
		System.out.println("messageList::"+messageList);
		return messageList;
	}
	public String checkMsg(MessageDTO msgDTO) {
		int updateResult = msgMapper.checkMsg(msgDTO);
		String checkResult = "NO";
		if(updateResult>0) {
			checkResult = "OK";
		}
		return checkResult;
	}
	
	
	

}
