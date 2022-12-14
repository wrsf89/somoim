package com.somoim.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.somoim.DTO.BoardDTO;
import com.somoim.DTO.MaincategoryDTO;
import com.somoim.DTO.PageDTO;
import com.somoim.DTO.SubcategoryDTO;
import com.somoim.mapper.applyMapper;
import com.somoim.mapper.boardMapper;
import com.somoim.mapper.memberMapper;

@Service
public class boardService {

	private ModelAndView mav;

	@Autowired
	private applyMapper applymapper;
	
	@Autowired
	private memberMapper membermapper;

	@Autowired
	private boardMapper boardmapper;

	public ModelAndView boardWrite(BoardDTO boardDTO, RedirectAttributes ra) throws IllegalStateException, IOException {
		mav = new ModelAndView();

		boardDTO.setB_date(boardDTO.getB_date() + " " + boardDTO.getB_time());

		UUID uuid = UUID.randomUUID();
		MultipartFile bfile = boardDTO.getB_file();
		String bfileName = uuid.toString() + "_" + bfile.getOriginalFilename();
		String savePath = "C:\\Users\\박세홍\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\somoim\\src\\main\\webapp\\resources\\profileImg\\";

		if (!bfile.isEmpty()) {
			bfile.transferTo(new File(savePath + bfileName));
		}

		boardDTO.setB_filename(bfileName);

		int nextBcode = boardmapper.nextBcode() + 1;
		System.out.println("nextBcode" + nextBcode);
		boardDTO.setB_code(nextBcode);

		int insertResult = boardmapper.boardWrite(boardDTO);
		ra.addFlashAttribute("msg", "등록");
		mav.setViewName("redirect:/boardList");
		return mav;
	}

	public ModelAndView boardList(int page) {	
		mav = new ModelAndView();

		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		
		ArrayList<BoardDTO> boardList = boardmapper.boardList(pageDTO);
		System.out.println(boardList);
		int ListCount = boardmapper.getmoimCount();
		int maxPage = (int)(Math.ceil((double)ListCount/pageLimit));
		int startPage =	((int)(Math.ceil((double)page/pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		System.out.println(pageDTO);
		mav.addObject("pageDTO",pageDTO);
		mav.addObject("boardList",boardList);
		mav.setViewName("board/boardList");
		
		return mav;

	}

	public ModelAndView boardView(int b_code) {
		mav = new ModelAndView();

		boardmapper.boardUphit(b_code);
		BoardDTO boardDTO = boardmapper.boardView(b_code);

		mav.addObject("boardDTO", boardDTO);
		mav.setViewName("board/boardView");
		return mav;
	}

	public String btitleUpdate(BoardDTO boardDTO) {

		int btitleUpdate = boardmapper.btitleUpdate(boardDTO);

		String updateResult = "";
		if (btitleUpdate > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}

		return updateResult;
	}

	public String bcontentUpdate(BoardDTO boardDTO) {

		int bcontentUpdate = boardmapper.bcontentUpdate(boardDTO);
		String updateResult = "";
		if (bcontentUpdate > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}

		return updateResult;
	}

	public ModelAndView boardDelete(int b_code) {
		mav = new ModelAndView();

		String savePath = "C:\\Users\\박세홍\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\somoim\\src\\main\\webapp\\resources\\profileImg\\";
		String bfileName = boardmapper.getfileName(b_code);
		File file = new File(savePath + bfileName);
		file.delete();
        
		int applyBcodeDelete = applymapper.applyBcodeDelete(b_code);
		int deleteResult = boardmapper.boardDelete(b_code);
       
		mav.setViewName("redirect:/boardList");
		return mav;
	}

	public ArrayList<BoardDTO> upHitList() {
		ArrayList<BoardDTO> upHitList = boardmapper.upHitList();
		System.out.println("upHitList : " + upHitList);
		return upHitList;
	}

	public ModelAndView boardListCategory(int b_mccode, int b_sccode) {
		mav = new ModelAndView();
		ArrayList<BoardDTO> boardList = boardmapper.boardListCategory(b_mccode,b_sccode);
		System.out.println(boardList);
		
		mav.addObject("boardList",boardList);
		mav.setViewName("board/boardListCategory");
		return mav;
	}

	public ModelAndView MyboardList(BoardDTO boardDTO) {
		mav = new ModelAndView();
		ArrayList<BoardDTO> MyboardList = boardmapper.MyboardList(boardDTO);
		System.out.println(MyboardList);
		mav.addObject("boardList",MyboardList);
		mav.setViewName("board/MyboardList");
		return mav;
	}
	public ModelAndView searchinfo(String keyWord) {
		mav = new ModelAndView();
		ArrayList<BoardDTO> boardList = null;

		
		boardList = boardmapper.boardSearch(keyWord);
		
		mav.addObject("boardList", boardList);
		mav.setViewName("board/boardList");
		return mav;
	}

	public ArrayList<MaincategoryDTO> getMaincategoryList() {
		ArrayList<MaincategoryDTO> getMaincategoryList = boardmapper.getMaincategoryList();
		System.out.println(getMaincategoryList);
		return getMaincategoryList;
	}

	public ArrayList<SubcategoryDTO> getSubCategoryList(int sc_mccode) {
		ArrayList<SubcategoryDTO> getSubCategoryList = boardmapper.getSubCategoryList(sc_mccode);
		return getSubCategoryList;
	}

	public ArrayList<BoardDTO> getBoardAddrList(int b_sccode) {
		ArrayList<BoardDTO> getBoardAddrList = boardmapper.getBoardAddrList(b_sccode);
		return getBoardAddrList;
	}

	public ModelAndView finalList(int b_sccode, String b_region) {
		mav = new ModelAndView();
		ArrayList<BoardDTO> finalList = boardmapper.finalList(b_sccode,b_region);
		
		mav.addObject("boardList",finalList);
		mav.setViewName("board/boardList");
		return mav;
	}

	public ArrayList<BoardDTO> upPeopleList() {
		ArrayList<BoardDTO> upPeopleList = boardmapper.upPeopleList();
		
		return upPeopleList;
	}




	

}
