package com.somoim.DTO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	private int m_code;
	private String m_email;
	private String m_password;
	private String m_nickname;
	private String m_name;
	private Date m_birth;
	private String m_phone;
	private String m_filename;
	private MultipartFile m_file;
}

/*
CREATE TABLE MEMBER( -- 회원테이블
 M_EMAIL NVARCHAR2(50), --회원아이디 
 M_PASSWORD NVARCHAR2(50), --회원비밀번호
 M_NICKNAME NVARCHAR2(50), -- 회원 닉네임
 M_NAME NVARCHAR2(10), --회원이름
 M_BIRTH DATE, --회원생년월일
 M_PHONE NVARCHAR2(50),--회원전화번호
 M_FILENAME NVARCHAR2(1000)--회원프로필사진
 );
ALTER TABLE MEMBER
ADD CONSTRAINT PK_M_EMAIL PRIMARY KEY(M_EMAIL);

*/