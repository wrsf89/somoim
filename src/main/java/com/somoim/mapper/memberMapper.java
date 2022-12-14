package com.somoim.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.somoim.DTO.MemberDTO;
@Mapper
public interface memberMapper {

	@Select("SELECT NVL(MAX(M_CODE),0) FROM MEMBER")
	public int getMcode();
	
	@Insert("INSERT INTO MEMBER(M_CODE,M_EMAIL,M_PASSWORD,M_NICKNAME,M_NAME,M_BIRTH,M_PHONE,M_FILENAME) VALUES(#{m_code},#{m_email},#{m_password},#{m_nickname},#{m_name},#{m_birth},#{m_phone},#{m_filename})")
	public int memberJoin(MemberDTO memberDTO);

	@Select("SELECT M_EMAIL FROM MEMBER WHERE M_EMAIL=#{m_email} AND M_PASSWORD=#{m_password}")
	public String memberLoginMemail(MemberDTO memberDTO);

	@Select("SELECT M_NICKNAME FROM MEMBER WHERE M_EMAIL=#{m_email} AND M_PASSWORD=#{m_password}")
	public String memberLoginMnickname(MemberDTO memberDTO);

	@Select("SELECT * FROM MEMBER WHERE M_EMAIL=#{m_email}")
	public MemberDTO memberView(String m_email);

	@Select("SELECT M_FILENAME FROM MEMBER WHERE M_EMAIL=#{m_email}")
	public String getMfilename(String m_email);

	@Delete("DELETE FROM MEMBER WHERE M_EMAIL=#{m_email}")
	public int memberDelete(String m_email);

	@Update("UPDATE MEMBER SET M_PASSWORD=#{m_password} WHERE M_EMAIL=#{m_email}")
	public int mpasswordUpdate(MemberDTO memberDTO);

	@Update("UPDATE MEMBER SET M_NICKNAME=#{m_nickname} WHERE M_EMAIL=#{m_email}")
	public int mnicknameUpdate(MemberDTO memberDTO);

	@Update("UPDATE MEMBER SET M_PHONE=#{m_phone} WHERE M_EMAIL=#{m_email}")
	public int mphoneUpdate(MemberDTO memberDTO);

	@Select("SELECT M_EMAIL FROM MEMBER WHERE M_EMAIL=#{m_email}")
	public String idCheck(String m_email);

	@Select("SELECT M_NICKNAME FROM MEMBER WHERE M_NICKNAME=#{m_nickname}")
	public String nicknameCheck(String m_nickname);
    
	@Select("SELECT M_NICKNAME FROM MEMBER WHERE M_EMAIL=#{m_email}")
	public String selectMnickname(String m_email);
    
	public int findPasswordUpdate(@Param("m_email")String m_email,@Param("pw") String pw);
    
	@Select("SELECT M_EMAIL FROM MEMBER WHERE M_EMAIL=#{m_email} AND M_NAME=#{m_name}")
	public String selectFindPassword(MemberDTO memberDTO);



	

	


	

}
