package com.somoim.controller5;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.somoim.DTO.BoardDTO;
import com.somoim.DTO.MaincategoryDTO;
import com.somoim.DTO.SubcategoryDTO;
import com.somoim.service.boardService;


@Controller
public class boardController {
	
private ModelAndView mav;
@Autowired
private boardService boardservice;

	@RequestMapping(value = "/boardWriteForm")
	public String boardWriteForm( ) {
		System.out.println("/boardWriteForm");
		
		return "board/boardWriteForm";
	}
	@RequestMapping(value="/boardWrite")
	public ModelAndView boardWrite(BoardDTO boardDTO , RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("/boardWrite");
		System.out.println(boardDTO);
		mav = boardservice.boardWrite(boardDTO,ra);
		return mav;
	}
	@RequestMapping(value = "/boardList")
	public ModelAndView boardList(@RequestParam(value = "page",defaultValue = "1") int page){
		System.out.println("/boardList");
		mav = boardservice.boardList(page);
		return mav;
	}
	
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(int b_code) {
		System.out.println("/boardView");
		mav = boardservice.boardView(b_code);
		return mav;
	}
	@RequestMapping(value = "/btitleUpdate")
	public @ResponseBody String btitleUpdate(BoardDTO boardDTO) {
		System.out.println("/btitleUpdate");
		System.out.println(boardDTO); 
		String updateResult = boardservice.btitleUpdate(boardDTO);
		return updateResult;
	}
	@RequestMapping(value = "/bcontentUpdate")
	public @ResponseBody String bcontentUpdate(BoardDTO boardDTO) {
		System.out.println("/bcontentUpdate");
		System.out.println(boardDTO);
		String updateResult = boardservice.bcontentUpdate(boardDTO);
		return updateResult;
	}
	@RequestMapping(value = "/boardDelete")
	public ModelAndView boardDelete(int b_code) {
		System.out.println("/boardDelete");
		System.out.println(b_code);
		mav = boardservice.boardDelete(b_code);
		return mav;
	}
	@RequestMapping(value = "/upHitList")
	public @ResponseBody ArrayList<BoardDTO> upHitList() {
		System.out.println("/upHitList");
		ArrayList<BoardDTO> upHitList = boardservice.upHitList();
		return upHitList;
	}
	@RequestMapping(value = "/boardListCategory")
	public ModelAndView boardListCategory(int b_mccode, int b_sccode){
		System.out.println("/boardListCategory");
		mav = boardservice.boardListCategory(b_mccode, b_sccode);
		return mav;
	}
	@RequestMapping(value = "/MyboardList")
	public ModelAndView MyboardList(BoardDTO boardDTO){
		System.out.println("/MyboardList");
		mav = boardservice.MyboardList(boardDTO);
		return mav;
	}
	@RequestMapping(value = "/searchinfo")
	public ModelAndView boardSearch(@RequestParam("keyWord") String keyWord) {
		System.out.println("/searchinfo");
		System.out.println(keyWord);
		mav = boardservice.searchinfo(keyWord);
		return mav;
	}	
	@RequestMapping(value = "/getMaincategoryList")
	public @ResponseBody ArrayList<MaincategoryDTO> getMaincategoryList() {
		System.out.println("/getMaincategoryList");
		ArrayList<MaincategoryDTO> getMaincategoryList = boardservice.getMaincategoryList();
		return getMaincategoryList;
	}
	@RequestMapping(value = "/getSubCategoryList")
	public @ResponseBody ArrayList<SubcategoryDTO> getSubCategoryList(int sc_mccode) {
		System.out.println("/getSubCategoryList");
		System.out.println("sc_mccode"+ sc_mccode);
		ArrayList<SubcategoryDTO> getSubCategoryList = boardservice.getSubCategoryList(sc_mccode);
		return getSubCategoryList;
	}
	@RequestMapping(value = "/getBoardAddrList")
	public @ResponseBody ArrayList<BoardDTO> getBoardAddrList(int b_sccode){
		System.out.println("/getBoardAddrList");
		ArrayList<BoardDTO> getBoardAddrList = boardservice.getBoardAddrList(b_sccode);
		return getBoardAddrList;
	}
	@RequestMapping(value = "/finalList")	
	public ModelAndView  finalList(int b_sccode , String b_region) {
		System.out.println("/finalList");
		System.out.println("b_sccode ::" + b_sccode + "b_region :: " + b_region);
		mav = boardservice.finalList(b_sccode,b_region);
		return mav;
	}
	
	@RequestMapping(value = "/upPeople")
	public @ResponseBody ArrayList<BoardDTO> upPeople() {
		 ArrayList<BoardDTO> upPeopleList = boardservice.upPeopleList();
		return upPeopleList;
	}
	 
}
