package com.somoim.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class ApplyDTO {
	/*
	 * CREATE TABLE APPLY( --신청테이블
 A_CODE NUMBER,--신청코드
 A_BCODE NUMBER, --등록한 게시글 코드
 A_MEMAIL NVARCHAR2(50), --신청자 아이디
 A_MNICKNAME NVARCHAR2(50),--신청자닉네임
 A_CONTENT NVARCHAR2(1000), --신청내용
 A_DATE DATE, --신청시간
 A_CHECK NUMBER --가입확인 숫자 가입되면 1 아니먄 0
);
	 */
	
	
	private String a_mnickname,a_memail, a_content;
	private Date a_date;
	private int a_bcode, a_code, a_check;
}


