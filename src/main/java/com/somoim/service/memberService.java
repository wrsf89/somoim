package com.somoim.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.somoim.DTO.MemberDTO;
import com.somoim.mapper.applyMapper;
import com.somoim.mapper.boardMapper;
import com.somoim.mapper.memberMapper;

@Service
public class memberService {
 private ModelAndView mav;
 @Autowired
	private HttpSession session;
 @Autowired
 private memberMapper membermapper;
 
 @Autowired
 private boardMapper boardmapper;
 
 @Autowired
 private applyMapper applymapper;
 
	public ModelAndView memberJoin(MemberDTO memberDTO) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		System.out.println("memberservice");
		UUID uuid = UUID.randomUUID();
		MultipartFile mfile = memberDTO.getM_file();
		String mfileName = uuid.toString()+"_"+mfile.getOriginalFilename();
		
        String savePath = "C:\\Users\\박세홍\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\somoim\\src\\main\\webapp\\resources\\profileImg\\";
		
        if(!mfile.isEmpty()) {
        	mfile.transferTo(new File(savePath+mfileName));
		}
        
        System.out.println("mfileName" + mfileName);
        memberDTO.setM_filename(mfileName);
        
		int getMcode = membermapper.getMcode()+1;
		System.out.println("getMcode" + getMcode);
		memberDTO.setM_code(getMcode);
				
		int insertResult = membermapper.memberJoin(memberDTO);
		System.out.println("insertResult"+insertResult);
        mav.setViewName("member/memberLoginForm");
		return mav;
	}

	public ModelAndView memberLogin(MemberDTO memberDTO) {
		mav = new ModelAndView();
		
		System.out.println("memberDTO : " + memberDTO);

		String m_email = membermapper.memberLoginMemail(memberDTO);
		System.out.println("m_email:" + m_email);
		session.setAttribute("m_email", m_email);
		
		String m_nickname = membermapper.memberLoginMnickname(memberDTO);
		System.out.println("m_nickname:" + m_nickname);
		session.setAttribute("m_nickname", m_nickname);

		mav.setViewName("redirect:/");
		return mav;
	}

	public ModelAndView memberView(String m_email) {
		mav = new ModelAndView();

		MemberDTO memberDTO = membermapper.memberView(m_email);
		System.out.println(memberDTO);
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("member/memberView");

		return mav;
	}

	public ModelAndView memberDelete(String m_email) {
		mav = new ModelAndView();
        String savePath = "C:\\Users\\박세홍\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\somoim\\src\\main\\webapp\\resources\\profileImg\\";
		String mfileName = membermapper.getMfilename(m_email);
		File file = new File(savePath+mfileName);
		file.delete();
		
		int boardDelete = boardmapper.memberdelete(m_email);
        int applyDelete = applymapper.applyMemberDelete(m_email);
		int deleteResult = membermapper.memberDelete(m_email);

		System.out.println("deleteResult : " + deleteResult);
		mav.setViewName("redirect:/");
		return mav;
	}

	public String mpasswordUpdate(MemberDTO memberDTO) {
		int result = membermapper.mpasswordUpdate(memberDTO);

		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public String mnicknameUpdate(MemberDTO memberDTO) {
		int result = membermapper.mnicknameUpdate(memberDTO);
		int boardListUpdate = boardmapper.boardListUpdate(memberDTO);
		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public String mphoneUpdate(MemberDTO memberDTO) {
		int result = membermapper.mphoneUpdate(memberDTO);

		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public String idCheck(String inputMemail) {
		String idCheck = membermapper.idCheck(inputMemail);

		String checkResult = null;
		if (idCheck == null) {
			checkResult = "OK";
		} else {
			checkResult = "NO";
		}

		return checkResult;
	}

	public String nicknameCheck(String inputMnickname) {
		String nicknameCheck = membermapper.nicknameCheck(inputMnickname);

		String checkResult = null;
		
		if (nicknameCheck != null) {
			checkResult = "NO";
		} else {
			checkResult = "OK";
		}

		return checkResult;
	}

		public int findPassword(String m_email, String pw) {
		System.out.println("m_email :" + m_email + "pw : " + pw);
		int findPasswordUpdate = membermapper.findPasswordUpdate(m_email,pw);
		return findPasswordUpdate;
	}

		public String selectFindPassword(MemberDTO memberDTO) {
            String selectFindPassword = membermapper.selectFindPassword(memberDTO);
			String result = null;
			if(selectFindPassword == null) {
				result = "NO";
			}else {
				result = "OK";
			}
			return result;
		}

}
