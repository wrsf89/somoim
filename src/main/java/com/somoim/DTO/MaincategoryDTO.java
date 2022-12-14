package com.somoim.DTO;

import lombok.Data;

@Data
public class MaincategoryDTO {
	
	private int mc_code;
	private String mc_name;
	
}
/*
 CREATE TABLE MAINCATEGORY(      --카테고리 테이블
   MC_CODE NUMBER,            --고유키
   MC_NAME NVARCHAR2(50)     --분류명
);
ALTER TABLE MAINCATEGORY
ADD CONSTRAINT PK_MC_CODE PRIMARY KEY(MC_CODE); 
  
 */
 