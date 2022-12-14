package com.somoim.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.somoim.DTO.ApplyDTO;
import com.somoim.DTO.BoardDTO;
import com.somoim.DTO.MaincategoryDTO;
import com.somoim.DTO.MemberDTO;
import com.somoim.DTO.PageDTO;
import com.somoim.DTO.SubcategoryDTO;

@Mapper
public interface boardMapper {

	public int nextBcode();

	public int boardWrite(BoardDTO boardDTO);

	public ArrayList<BoardDTO> boardList(PageDTO pageDTO);

	public void boardUphit(int b_code);

	public BoardDTO boardView(int b_code);

	public int btitleUpdate(BoardDTO boardDTO);

	public int bcontentUpdate(BoardDTO boardDTO);

	public int boardDelete(int b_code);

	public String getfileName(int b_code);

	public ArrayList<BoardDTO> upHitList();

	public ArrayList<BoardDTO> boardList(int b_sccode);

	public ArrayList<BoardDTO> boardListCategory(int b_sccode);

	public int boardListUpdate(MemberDTO memberDTO);

	@Select("SELECT * FROM BOARD WHERE B_MEMAIL=#{b_memail} ORDER BY B_CODE")
	public ArrayList<BoardDTO> MyboardList(BoardDTO boardDTO);

	public ArrayList<BoardDTO> boardListCategory(@Param("b_mccode") int b_mccode, @Param("b_sccode") int b_sccode);

    
    @Select("SELECT * FROM BOARD WHERE B_TITLE LIKE '%'||#{keyWord}||'%' OR B_MNICKNAME LIKE '%'||#{keyWord}||'%' ")
    public ArrayList<BoardDTO> boardSearch(String keyWord);
    
	public ArrayList<MaincategoryDTO> getMaincategoryList();

	public ArrayList<SubcategoryDTO> getSubCategoryList(int sc_mccode);

	public ArrayList<BoardDTO> getBoardAddrList(int b_sccode);

	public ArrayList<BoardDTO> finalList(@Param("b_sccode")int b_sccode, @Param("b_region")String b_region);

	public ArrayList<BoardDTO> upPeopleList();

	public int memberdelete(String m_email);

	public int insertapeole(ApplyDTO applyDTO);

	public int updatePeople(ApplyDTO applyDTO);

	public int updateApeople(ApplyDTO applyDTO);

	public int getmoimCount();


	

	

	

	
}
