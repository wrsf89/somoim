package com.somoim.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.somoim.DTO.MessageDTO;
@Mapper
public interface MessageMapper {
	

	public int sendMessage(MessageDTO msgDTO);

	public ArrayList<MessageDTO> receiveMessage(String msg_receiveid);

	public int checkMsg(MessageDTO msgDTO);

	
	
	
	
	
	
}
