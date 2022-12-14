package com.somoim.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class MessageDTO {
	  private int msg_code;
	  private String msg_sendid,msg_memail,msg_receiveid, msg_content;
	  private Date msg_date;
	  private int msg_check;   	  
}
		/*
	
CREATE TABLE MESSAGE( --메세지
    MSG_CODE NUMBER,
    MSG_SENDID NVARCHAR2(50), --보내는사람 닉네임
    MSG_MEMAIL NVARCHAR2(50), --보내는사람 이메일
    MSG_RECEIVEID NVARCHAR2(50), --받는사람
    MSG_CONTENT NVARCHAR2(1000), --메세지내용
    MSG_DATE DATE, --보낸시간
    MSG_CHECK NUMBER, --체크
    MSG_DISPOSAL NVARCHAR2(10)
);


ALTER TABLE MESSAGE
ADD CONSTRAINT PK_MSG_CODE PRIMARY KEY(MSG_CODE);

ALTER TABLE MESSAGE
ADD MSG_DISPOSAL NVARCHAR2(10);
*/