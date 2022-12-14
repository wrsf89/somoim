package com.somoim.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.servlet.ModelAndView;

import com.somoim.DTO.ApplyDTO;
import com.somoim.DTO.BoardDTO;
@Mapper
public interface applyMapper {

	public int applyWrite(ApplyDTO applyDTO);

	public int autoAcode();

	public int applyMemberDelete(String m_email);

	public int applyBcodeDelete(int b_code);

	public ArrayList<ApplyDTO> myboardApply(int a_bcode);

	public int applyApproval(ApplyDTO applyDTO);

	public int applyRefuse(ApplyDTO applyDTO);
    
	@Select("SELECT * FROM BOARD WHERE B_CODE IN(SELECT A_BCODE FROM APPLY WHERE A_MEMAIL =#{a_memail})")
	public ArrayList<BoardDTO> MyapplyList(String a_memail);

	public int applyDelete(ApplyDTO applyDTO);



}