package com.somoim.DTO;

import lombok.Data;

@Data
public class SubcategoryDTO {
	private int sc_code,sc_mccode;
	private String sc_name,sc_mcname;
}


/*
CREATE TABLE SUBCATEGORY(
    SC_CODE NUMBER,         --고유키
    SC_MCCODE NUMBER ,      --MAINCATEGORY 참조키
    SC_NAME NVARCHAR2(50)   --종목명
);
ALTER TABLE SUBCATEGORY
ADD CONSTRAINT PK_SC_CODE PRIMARY KEY(SC_CODE)
ADD CONSTRAINT FK_SC_MCODE FOREIGN KEY(SC_MCCODE) REFERENCES MAINCATEGORY(MC_CODE);


*/