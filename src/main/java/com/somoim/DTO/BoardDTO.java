package com.somoim.DTO;

import java.sql.Date;
import java.sql.Time;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class BoardDTO {

	private int b_code, b_mccode, b_sccode, b_people , b_hit;
	private String b_mnickname , b_addr , b_memail , b_region;
	private String b_title;
	private String b_content;
	private String b_filename;
	private MultipartFile b_file;
	private String b_date , b_time;
	
	/*
	CREATE TABLE BOARD( --게시판테이블
    B_CODE NUMBER, -- 게시판 코드
    B_MCCODE NUMBER, -- maincategory 참조
    B_SCCODE NUMBER, -- subcategory 참조 
    B_MEMAIL NVARCHAR2(50), --작성자이메일
    B_MNICKNAME NVARCHAR2(50), -- 작성자닉네임
    B_TITLE NVARCHAR2(50), --제목
    B_CONTENT NVARCHAR2(2000), --내용
    B_REGION NVARCHAR2(50), -- 모임지역
    B_ADDR NVARCHAR2(1000), --상세주소
    B_FILENAME NVARCHAR2(1000), --파일
    B_DATE NVARCHAR2(50),         --모임시간
    B_HIT NUMBER,         --조회수
    B_PEOPLE NUMBER --신청인원
);

ALTER TABLE BOARD 
ADD CONSTRAINT PK_B_CODE PRIMARY KEY(B_CODE);
	 */

	
	
	
	
	
}
