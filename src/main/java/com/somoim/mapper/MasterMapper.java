package com.somoim.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.somoim.DTO.ApplyDTO;
import com.somoim.DTO.BoardDTO;
import com.somoim.DTO.MaincategoryDTO;
import com.somoim.DTO.MemberDTO;
import com.somoim.DTO.MessageDTO;
import com.somoim.DTO.PageDTO;
import com.somoim.DTO.SubcategoryDTO;

@Mapper
public interface MasterMapper {

	ArrayList<MemberDTO> memberList(PageDTO pageDTO);

	int getMemberCount();

	ArrayList<BoardDTO> moimList(PageDTO pageDTO);

	int getmoimCount();

	ArrayList<MemberDTO> masmemSearch(String mastersearch);

	ArrayList<MaincategoryDTO> cateList(PageDTO pageDTO);

	

	int findccode();

	int cate1Add(MaincategoryDTO cate1);

	int delcate1(int c_code);

	ArrayList<SubcategoryDTO> cate2List(PageDTO pageDTO);

	int findsccode();

	int cate2Add(SubcategoryDTO subdto);

	int delcate2(int sc_code);

	String getmcName(int mc_code);

	int addMaster(MemberDTO memdto);

	BoardDTO boardView(int b_code);

	ArrayList<BoardDTO> moimmemList(PageDTO pageDTO);

	ArrayList<MessageDTO> messageList(PageDTO pageDTO);

	int getmsgSearchCount(String keyword);

	int msgdelete(int msg_code);

	ArrayList<MessageDTO> masmsgSearch(PageDTO pageDTO);

	ArrayList<ApplyDTO> masapplyList(PageDTO pageDTO);

	ApplyDTO applyView(int a_code);

	int applyDelete(int a_code);

	int getapplyCount();

	ArrayList<ApplyDTO> masapplySearch(PageDTO pageDTO);

	ArrayList<MemberDTO> masmemSearch(PageDTO pageDTO);

	int getMemSearchCount(String keyword);

	int getcate1Count();

	ArrayList<MaincategoryDTO> cateList();

	int getcate2Count();

	ArrayList<BoardDTO> moimSearch(PageDTO pageDTO);

	int getSearchMoimCount(String keyword);

	int getmsgCount();

	int getapplySearchCount(String keyword);

	int getSearchMoimmemCount(String b_memail);

	ArrayList<MaincategoryDTO> maincateList();

	int SendMasMsg(String b_memail, String msg_content);

	int SendMasMsg(MessageDTO msgdto);

	int getmsgcode();

	ArrayList<BoardDTO> msgmemList(PageDTO pageDTO);

	int getMsgmemCount(String msg_memail);

	int masMemModi(HashMap<String, String> map);

	int masterCallMsg();

	ArrayList<MessageDTO> mascallMsgList(PageDTO pageDTO);

	void MsgCheck(int msg_code);


}
