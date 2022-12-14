package com.somoim.controller5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.somoim.DTO.MemberDTO;
import com.somoim.DTO.SubcategoryDTO;
import com.somoim.service.MasterService;

@Controller
public class MasterController {
	
	private ModelAndView mav;
	@Autowired
	private MasterService masterservice;
	
	
	@RequestMapping(value = "/masterpage")
	public ModelAndView masterpage() {
		System.out.println("/masterpage");
		mav= masterservice.masterCallMsg();		
		return mav;
	}
	
	//회원리스트,회원검색
	@RequestMapping(value = "/memberList")
	public ModelAndView memberList(@RequestParam(value = "page",defaultValue = "1") int page,String keyword){
		System.out.println("/memberList::page"+page+"\n keyword::"+keyword);
		
		mav = masterservice.memberList(page,keyword);
		return mav;
	}
	

	//회원삭제
	@RequestMapping(value = "/masMemDelete")
	public ModelAndView masMemDelete(String m_email,@RequestParam(value = "page",defaultValue = "1") int page,String keyword){
		System.out.println("/masMemDelete::page"+page);
		mav = masterservice.masMemDelete(m_email, page,keyword);
		return mav;
	}
	//회원정보
	@RequestMapping(value = "/mastermemView")
	public ModelAndView mastermemView(String m_email) {
		System.out.println("/mastermemView");
		System.out.println("m_email : " + m_email);
		mav = masterservice.memberView(m_email);
		return mav;
	}
	
	//관리자권한 아이디 추가
	@RequestMapping(value = "/addMaster")
	public ModelAndView addMaster(MemberDTO memdto,@RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/addMaster");
		System.out.println(memdto);
		mav = masterservice.addMaster(memdto,page,keyword);
		return mav;
	}
	
	
	//게시물리스트
	@RequestMapping(value = "/somoimList")
	public ModelAndView somoimLIst(@RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/somoimList::page"+page+"\n keyword::"+keyword);
		mav = masterservice.moimList(page,keyword);		
		return mav;
	}
	
	//게시물삭제
	@RequestMapping(value = "/masboardDelete")
	public ModelAndView masboardDelete(int b_code,@RequestParam(value = "page",defaultValue = "1") int page,String keyword){
		System.out.println("/masboardDelete::page"+page);
		mav = masterservice.masboardDelete(b_code, page,keyword);
		return mav;
	}
	
	//선택한 회원의 게시물 보기
	@RequestMapping(value = "/masbodmemlist")
	public ModelAndView masbodmemlist(String b_memail,@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/masbodmemlist");
		
		mav = masterservice.masbodmemlist(b_memail,page);
		return mav;
	}
	
	
	//게시물 보기
	@RequestMapping(value = "/masboardView")
	public ModelAndView masboardView(int b_code) {
		System.out.println("/masboardView");
		
		mav = masterservice.boardView(b_code);
		return mav;
	}
	

	
	//메인카테고리리스트
	@RequestMapping(value = "/categoryList")
	public ModelAndView categoryList(@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/categoryList");
		System.out.println("categoryList");
		mav = masterservice.categoryList(page);
		return mav;
	}
	
	//메인카테고리 리스트추가
	@RequestMapping(value = "/addCategory1")
	public ModelAndView addCategory1(String cate1Name,@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/addCategory1");
		System.out.println("cate1Name :" +cate1Name);
		mav = masterservice.addcate1(cate1Name,page);
		return mav;
	}
		
	//메인카테고리 리스트삭제
	@RequestMapping(value = "/delcate1")
	public ModelAndView delcate1(int mc_code,@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/delcate1");
		System.out.println("c_code :" +mc_code);
		mav = masterservice.delcate1(mc_code,page);
		return mav;
	}
	
	//서브카테고리 리스트
	@RequestMapping(value = "/subcategory")
	public ModelAndView subcategory(@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/subcategory");
		mav = masterservice.subcateList(page);
		return mav;
	}
	
	//서브카테고리 리스트 추가
	@RequestMapping(value = "/addCategory2")
	public ModelAndView addCategory2(int sc_mccode, String sc_name,@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/addCategory2");
		
		mav = masterservice.addcate2(sc_mccode,sc_name,page);
		return mav;
	}
	
	
	//서브카테고리 리스트 삭제
	@RequestMapping(value = "/delcate2")
	public ModelAndView delcate2(int sc_code,@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/delcate2");
		System.out.println("sc_code :" +sc_code);
		mav = masterservice.delcate2(sc_code,page);
		return mav;
	}
	


	//메세지 리스트
	@RequestMapping(value = "/masmessageList")
	public ModelAndView masmessageList(@RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/masmessageList");
		
		mav = masterservice.masmessageList(page,keyword);
		return mav;
	}
	
	//메세지 삭제
	@RequestMapping(value = "/masmsgDelete")
	public ModelAndView masmsgDelete(int msg_code, @RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/masmsgDelete");
		
		mav = masterservice.masmessageDelete(msg_code,page,keyword);
		return mav;
	}
	//선택한 회원의 메세지 리스트
	@RequestMapping(value = "/masmsgmemlist")
	public ModelAndView masmsgmemlist(String msg_memail,@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/masmsgmemlist");
		
		mav = masterservice.masmsgmemlist(msg_memail,page);
		return mav;
	}
	//경고 메세지 후 모임게시물 삭제
	@RequestMapping(value = "/masmemMassage")
	public ModelAndView masmemMassage(String b_memail,int b_code,@RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/masmemMassage");
		System.out.println("b_memail :" +b_memail);
		mav = masterservice.masmemMessage(b_memail,b_code,page,keyword);
		return mav;
	}

	
	//신청 리스트
	@RequestMapping(value = "/masapplyList")
	public ModelAndView masapplyList(@RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/masapplyList");
		
		mav = masterservice.masapplyList(page,keyword);
		return mav;
	}
	
	//신청내용 보기
	@RequestMapping(value = "/applyView")
	public ModelAndView applyView(int a_code) {
		System.out.println("/applyView");
		System.out.println("a_code :"+a_code);
		
		mav = masterservice.applyView(a_code);
		return mav;
	}
	
	//신청데이터 삭제
	@RequestMapping(value = "/applyDelete")
	public ModelAndView applyDelete(int a_code, @RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/applyDelete");
		
		mav = masterservice.applyDelete(a_code,page,keyword);
		return mav;
	}
	
	//경고메세지 후 신청게시물 삭제
	@RequestMapping(value = "/masMsgMassage")
	public ModelAndView masMsgMassage(String msg_memail,int msg_code,@RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
		System.out.println("/masMsgMassage");
		System.out.println("msg_memail :" +msg_memail);
		mav = masterservice.masMsgMassage(msg_memail,msg_code,page,keyword);
		return mav;
	}
	
	//회원게시물에서 해당 컬럼의 데이터 삭제
		@RequestMapping(value = "/masmemModi")
		public ModelAndView masmemModi(String m_email,String modisel,String reason,@RequestParam(value = "page",defaultValue = "1") int page,String keyword) {
			System.out.println("/masmemModi");
			System.out.println("msg_memail :" +m_email);
			mav = masterservice.masmemModi(m_email,modisel,reason,page,keyword);
			return mav;
		}
	
		
	//관리자 문의 메세지
	@RequestMapping(value = "/mascallMsgList")
	public ModelAndView mascallMsgList(@RequestParam(value = "page",defaultValue = "1") int page,String msg_memail) {
		System.out.println("/mascallMsgList");
		
		mav = masterservice.mascallMsgList(page,msg_memail);
		return mav;
	}
	
	//관리자 문의 답변
	@RequestMapping(value = "/masAnswer")
	public ModelAndView masAnswer(int msg_code,String msg_receiveid,String msg_content,@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/masAnswer");
		
		mav = masterservice.masAnswer(msg_code,msg_receiveid,msg_content,page);
		return mav;
	}	
	
	
	
		

	

}
