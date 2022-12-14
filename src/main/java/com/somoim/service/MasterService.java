package com.somoim.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somoim.DTO.ApplyDTO;
import com.somoim.DTO.BoardDTO;
import com.somoim.DTO.MaincategoryDTO;
import com.somoim.DTO.MemberDTO;
import com.somoim.DTO.MessageDTO;
import com.somoim.DTO.PageDTO;
import com.somoim.DTO.SubcategoryDTO;
import com.somoim.mapper.MasterMapper;
import com.somoim.mapper.boardMapper;
import com.somoim.mapper.memberMapper;

@Service
public class MasterService {
	
	@Autowired
	private MasterMapper masterMapper;
	
	@Autowired
	private memberMapper membermapper;
	
	@Autowired
	private boardMapper boardmapper;
	private ModelAndView mav;
	
	
	
	@Autowired
	private HttpSession session;
	

	public ModelAndView memberList(int page, String keyword) {
		mav = new ModelAndView();
		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		if(keyword==null) {
			keyword="";
		}
		pageDTO.setKeyword(keyword);
		
		ArrayList<MemberDTO> memberList = masterMapper.masmemSearch(pageDTO);
		
		int ListCount = masterMapper.getMemSearchCount(keyword);
		
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
		mav.addObject("memberList",memberList);
		mav.setViewName("master/memberList");
		
		return mav;
	}
	
	public ModelAndView memberView(String m_email) {
		mav = new ModelAndView();

		MemberDTO memberDTO = membermapper.memberView(m_email);
		System.out.println(memberDTO);
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("master/mastermemView");

		return mav;
	}



	
	public ModelAndView masMemDelete(String m_email, int page, String keyword) {
		String savePath = "C:\\Users\\LEE\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\somoim\\src\\main\\webapp\\resources\\profileImg\\";
		String mfileName = membermapper.getMfilename(m_email);
		File file = new File(savePath+mfileName);
		file.delete();
		
		int deleteResult = membermapper.memberDelete(m_email);
		if(deleteResult>0) {
			memberList(page,keyword);
		}
		
		return mav;
	}
	
	//회원게시물에서 해당 컬럼의 데이터 삭제
	public ModelAndView masmemModi(String m_email, String modisel, String reason, int page, String keyword) {
		mav = new ModelAndView();
		String msg_content="고객님의 회원정보에 부적절한 내용이 있어 해당 데이터를 삭제합니다.회원정보 수정으로 다시 입력바랍니다.\n삭제사유:"+reason;
		int msg_code=masterMapper.getmsgcode()+1;
		
		MessageDTO msgdto = new MessageDTO();
		msgdto.setMsg_receiveid(m_email); //나중에 관리자 이메일 확인
		msgdto.setMsg_sendid("관리자");
		msgdto.setMsg_content(msg_content);
		msgdto.setMsg_code(msg_code);
		
		int messageResult=masterMapper.SendMasMsg(msgdto);
		if(messageResult>0) {
			System.out.println("경고메세지 전송 성공");
		} else {
			System.out.println("경고메세지 전송 실패");
		}		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", modisel);
		map.put("m_email", m_email);
		int delresult = masterMapper.masMemModi(map);
		if(delresult>0) {
			memberList(page,keyword);
		}
		return mav;
	}

	

	
	public ModelAndView addMaster(MemberDTO memdto, int page, String keyword) {
		String m_nickname = "관리자";
		memdto.setM_nickname(m_nickname);
		int result = masterMapper.addMaster(memdto);
		
		if(result>0) {
			
			memberList(page,keyword);
		}
				
		return mav;
	}


	public ModelAndView moimList(int page, String keyword) {
		mav = new ModelAndView();

		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		if(keyword==null) {
			keyword="";
		}
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		pageDTO.setKeyword(keyword);
		
		ArrayList<BoardDTO> moimList = masterMapper.moimSearch(pageDTO);
		
		int ListCount = masterMapper.getSearchMoimCount(keyword);
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
		
		mav.addObject("pageDTO",pageDTO);
		mav.addObject("moimList",moimList);
		mav.setViewName("master/somoimList");
		
		return mav;
	}
	
	public ModelAndView masboardDelete(int b_code, int page, String keyword) {
		String savePath = "C:\\Users\\LEE\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\somoim\\src\\main\\webapp\\resources\\images\\";
		String bfileName = boardmapper.getfileName(b_code);
		File file = new File(savePath+bfileName);
		file.delete();
		
		int deleteResult = boardmapper.boardDelete(b_code);
		if(deleteResult>0) {
			moimList(page,keyword);
		}
		return mav;
	}
	
	
	//선택한 회원의 게시물 리스트(나중에 페이징 필요)
	public ModelAndView masbodmemlist(String b_memail, int page) {
		mav = new ModelAndView();
		
		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		pageDTO.setKeyword(b_memail);

		ArrayList<BoardDTO> moimList = masterMapper.moimmemList(pageDTO);
		
		int ListCount = masterMapper.getSearchMoimmemCount(b_memail);
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

		
		mav.addObject("moimList",moimList);
		mav.setViewName("master/somoimList");
		
		return mav;	
	}
	// 게시물 보기
	public ModelAndView boardView(int b_code) {
		mav = new ModelAndView();
		BoardDTO boarddto = masterMapper.boardView(b_code);
		mav.addObject("boarddto",boarddto);
		mav.setViewName("master/somoimView");
		return mav;
	}



	//메인 카테고리 리스트
	public ModelAndView categoryList(int page) {
		mav = new  ModelAndView();
		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		ArrayList<MaincategoryDTO> cate1List = masterMapper.cateList(pageDTO);
		
		int ListCount = masterMapper.getcate1Count();
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
		
		mav.addObject("pageDTO",pageDTO);
		mav.addObject("cate1List",cate1List);
		mav.setViewName("master/Category");
		return mav;
	}
	//메인 카테고리 추가
	public ModelAndView addcate1(String cate1Name, int page) {
		
		int mc_code = masterMapper.findccode() +1;
		MaincategoryDTO cate1= new MaincategoryDTO();
		cate1.setMc_code(mc_code);
		cate1.setMc_name(cate1Name);
		System.out.println("cate1.setMc_name =" + cate1.getMc_name());
		int result = masterMapper.cate1Add(cate1);
		if(result>0) {
			categoryList(page);
		}
		return mav;
	}
	//메인 카테고리 데이터 삭제
	public ModelAndView delcate1(int mc_code, int page) {
		int result = masterMapper.delcate1(mc_code);
		if(result>0) {
			categoryList(page);
		}
		return mav;
	}
	
	//서브 카테고리 리스트
	public ModelAndView subcateList(int page) {
		mav = new  ModelAndView();
		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		ArrayList<MaincategoryDTO> cate1List = masterMapper.maincateList();
		ArrayList<SubcategoryDTO> cate2List = masterMapper.cate2List(pageDTO);
		for(int i=0; i<cate2List.size();i++) {
			int mc_code=cate2List.get(i).getSc_mccode();
			String sc_mcname= masterMapper.getmcName(mc_code);
			cate2List.get(i).setSc_mcname(sc_mcname);
		}
		
		int ListCount = masterMapper.getcate2Count();
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
		
		mav.addObject("pageDTO",pageDTO);
		mav.addObject("cate1List",cate1List);
		mav.addObject("cate2List",cate2List);
		mav.setViewName("master/Category2");
		return mav;
	}




	public ModelAndView addcate2(int sc_mccode, String sc_name, int page) {
		int sc_code = masterMapper.findsccode() +1;
		SubcategoryDTO subdto = new SubcategoryDTO();
		subdto.setSc_code(sc_code);
		subdto.setSc_mccode(sc_mccode);
		subdto.setSc_name(sc_name);
		
		int result = masterMapper.cate2Add(subdto);
		if(result>0) {
			subcateList(page);
		}
		return mav;
	}

	
	public ModelAndView delcate2(int sc_code, int page) {
		int result = masterMapper.delcate2(sc_code);
		if(result>0) {
			subcateList(page);
		}
		return mav;
	}


	public ModelAndView masmessageList(int page, String keyword) {
mav = new ModelAndView();
		

		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		if(keyword==null) {
			keyword="";
		}
		

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		pageDTO.setKeyword(keyword);
		
		System.out.println(pageDTO);
		
		ArrayList<MessageDTO> msgdto = masterMapper.masmsgSearch(pageDTO);
		
		int ListCount = masterMapper.getmsgSearchCount(keyword);
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
		
		mav.addObject("msgdto",msgdto);
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("master/messageList");
		return mav;
	}
	

	public ModelAndView masmessageDelete(int msg_code, int page, String keyword) {
		int delresult = masterMapper.msgdelete(msg_code);
		if(delresult>0) {
			masmessageList(page,keyword);
		}
		return mav;
	}
	
	public ModelAndView masmsgmemlist(String msg_memail, int page) {
	mav = new ModelAndView();
		
		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		pageDTO.setKeyword(msg_memail);

		ArrayList<BoardDTO> msgdto = masterMapper.msgmemList(pageDTO);
		
		int ListCount = masterMapper.getMsgmemCount(msg_memail);
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
		
		mav.addObject("msgdto",msgdto);
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("master/messageList");
		
		return mav;	
	}
	
	public ModelAndView masMsgMassage(String msg_memail, int msg_code, int page, String keyword) {
		mav = new ModelAndView();
		
		String msg_content="고객님이 작성하신 메세지에 부적절한 내용이 포함되어 있어 삭제합니다.";
		int wanmsg_code=masterMapper.getmsgcode()+1;
		
		MessageDTO msgdto = new MessageDTO();
		msgdto.setMsg_receiveid(msg_memail); //나중에 관리자 이메일 확인
		msgdto.setMsg_sendid("관리자");
		msgdto.setMsg_content(msg_content);
		msgdto.setMsg_code(wanmsg_code);
		
		int messageResult=masterMapper.SendMasMsg(msgdto);
		if(messageResult>0) {
			System.out.println("경고메세지 전송 성공");
		} else {
			System.out.println("경고메세지 전송 실패");
		}		
		
		int delresult = masterMapper.msgdelete(msg_code);
		if(delresult>0) {
			masmessageList(page,keyword);
		}
		return mav;
	}
	







	public ModelAndView masapplyList(int page, String keyword) {
		mav = new ModelAndView();

		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		if(keyword==null) {
			keyword="";
		}
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		pageDTO.setKeyword(keyword);
		ArrayList<ApplyDTO> applyDTO = masterMapper.masapplySearch(pageDTO);
		
		int ListCount = masterMapper.getapplySearchCount(keyword);
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
		
		mav.addObject("applyDTO",applyDTO);
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("master/applyList");
		return mav;
	}

	public ModelAndView applyView(int a_code) {
		mav = new ModelAndView();
		ApplyDTO applyddto = masterMapper.applyView(a_code);
		mav.addObject("applyddto",applyddto);
		mav.setViewName("master/applyView");
		return mav;
	}


	public ModelAndView applyDelete(int a_code, int page, String keyword) {
		int delresult = masterMapper.applyDelete(a_code);
		if(delresult>0) {
			masapplyList(page,keyword);
		}
		return mav;		
	}
	
	
	
	
	
	
	

	public ModelAndView masmemMessage(String b_memail, int b_code, int page, String keyword) {
		mav = new ModelAndView();
		
		String msg_content="고객님이 작성하신 모임 게시물에 부적절한 내용이 포함되어 있어 삭제합니다.";
		int msg_code=masterMapper.getmsgcode()+1;
		
		MessageDTO msgdto = new MessageDTO();
		msgdto.setMsg_receiveid(b_memail); //나중에 관리자 이메일 확인
		msgdto.setMsg_sendid("관리자");
		msgdto.setMsg_content(msg_content);
		msgdto.setMsg_code(msg_code);
		
		int messageResult=masterMapper.SendMasMsg(msgdto);
		if(messageResult>0) {
			System.out.println("경고메세지 전송 성공");
		} else {
			System.out.println("경고메세지 전송 실패");
		}
		String savePath = "C:\\Users\\LEE\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\somoim\\src\\main\\webapp\\resources\\images\\";
		String bfileName = boardmapper.getfileName(b_code);
		File file = new File(savePath+bfileName);
		file.delete();
		
		int deleteResult = boardmapper.boardDelete(b_code);
		if(deleteResult>0) {
			moimList(page,keyword);
		}
		return mav;
	}
	//경고 메세지 후 신청 게시물 삭제
	public ModelAndView masappMessage(String a_memail, int a_code, int page, String keyword) {
		mav = new ModelAndView();
		
		String msg_content="고객님이 작성하신 신청 게시물에 부적절한 내용이 포함되어 있어 삭제합니다.";
		int msg_code=masterMapper.getmsgcode()+1;
		
		MessageDTO msgdto = new MessageDTO();
		msgdto.setMsg_receiveid(a_memail); //나중에 관리자 이메일 확인
		msgdto.setMsg_sendid("관리자");
		msgdto.setMsg_content(msg_content);
		msgdto.setMsg_code(msg_code);
		
		int messageResult=masterMapper.SendMasMsg(msgdto);
		if(messageResult>0) {
			System.out.println("경고메세지 전송 성공");
		} else {
			System.out.println("경고메세지 전송 실패");
		}		
		
		int delresult = masterMapper.applyDelete(a_code);
		if(delresult>0) {
			masapplyList(page,keyword);
		}
		return mav;
	}

	public ModelAndView masterCallMsg() {
		mav= new ModelAndView();
		int MsgCnt = masterMapper.masterCallMsg();
		mav.addObject("MsgCnt",MsgCnt);
		mav.setViewName("master/masterpage");
		return mav;
	}

	public ModelAndView mascallMsgList(int page, String msg_memail) {
		mav = new ModelAndView();
		
		int pageLimit = 20; // 한페이지에 보여줄 글의 갯수
		int pageNumLimit = 5; // 한페이지에 보여줄 페이지 번호 갯수

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		pageDTO.setKeyword(msg_memail);
		

		System.out.println(pageDTO);

		ArrayList<MessageDTO> msgdto = masterMapper.mascallMsgList(pageDTO);

		int ListCount = masterMapper.masterCallMsg();
		int maxPage = (int) (Math.ceil((double) ListCount / pageLimit));
		int startPage = ((int) (Math.ceil((double) page / pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);

		mav.addObject("msgdto", msgdto);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("master/MasCallList");
		return mav;

	}
	
	public ModelAndView masAnswer(int msg_code, String msg_receiveid, String msg_content, int page) {
		
		int msg_code2=masterMapper.getmsgcode()+1;
		MessageDTO msgdto = new MessageDTO();
		msgdto.setMsg_receiveid(msg_receiveid);
		msgdto.setMsg_sendid("관리자");
		msgdto.setMsg_memail("master");
		msgdto.setMsg_content(msg_content);
		msgdto.setMsg_code(msg_code2);
		int result = masterMapper.SendMasMsg(msgdto);
		String msg_memail=msgdto.getMsg_receiveid();
		if(result>0) {
			System.out.println("답변성공");
			masterMapper.MsgCheck(msg_code);
			mascallMsgList(page,msg_memail);
		}
		return mav;
	}
	









}
