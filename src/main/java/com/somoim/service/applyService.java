package com.somoim.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.somoim.DTO.ApplyDTO;
import com.somoim.DTO.BoardDTO;
import com.somoim.mapper.applyMapper;
import com.somoim.mapper.boardMapper;

@Service
public class applyService {
	private ModelAndView mav;

	@Autowired
	private applyMapper applymapper;

	@Autowired
	private boardMapper boardmapper;

	public ModelAndView applyWriteForm(int a_bcode) {
		mav = new ModelAndView();
		mav.addObject("a_bcode", a_bcode);
		mav.setViewName("apply/applyWriteForm");
		return mav;
	}

	public ModelAndView applyWrite(ApplyDTO applyDTO) {
		mav = new ModelAndView();
		int autoAcode = applymapper.autoAcode() + 1;
		applyDTO.setA_code(autoAcode);
		int insertApeople = boardmapper.insertapeole(applyDTO);
		int insertResult = applymapper.applyWrite(applyDTO);
		System.out.println("insertResult : " + insertResult);
		mav.setViewName("redirect:/boardList");
		return mav;
	}

	public ModelAndView myboardApply(int a_bcode) {
		mav = new ModelAndView();
		ArrayList<ApplyDTO> myboardApplyList = applymapper.myboardApply(a_bcode);
		System.out.println(myboardApplyList);
		mav.addObject("applyList", myboardApplyList);
		mav.setViewName("apply/myBoardApplyList");
		return mav;
	}

	public String applyApproval(ApplyDTO applyDTO) {
		int applyApproval = applymapper.applyApproval(applyDTO);
		int updatePeople = boardmapper.updatePeople(applyDTO);
		int updateApeople = boardmapper.updateApeople(applyDTO);
		String updateResult = "";
		if (applyApproval > 0) {
			updateResult = "OK";
		}
		return updateResult;
	}

	public String applyRefuse(ApplyDTO applyDTO) {
		int applyRefuse = applymapper.applyRefuse(applyDTO);
		int updateApeople = boardmapper.updateApeople(applyDTO);
		String deleteResult = "";
		if (applyRefuse > 0) {
			deleteResult = "OK";
		}
		return deleteResult;
	}

	public ModelAndView MyapplyList(String a_memail) {
		mav = new ModelAndView(); 
		System.out.println("a_memail ::" + a_memail);
		ArrayList<BoardDTO> myapplyList = applymapper.MyapplyList(a_memail);
		mav.addObject("boardList",myapplyList);
		mav.setViewName("board/MyapplyList");
		return mav;
	}

	public ModelAndView applyDelete(ApplyDTO applyDTO) {
		mav = new ModelAndView();
		int deleteResult = applymapper.applyDelete(applyDTO);
		mav.addObject("redirect:/MyapplyList");
		return mav;
	}
}