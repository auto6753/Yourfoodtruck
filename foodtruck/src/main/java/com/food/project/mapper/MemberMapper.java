package com.food.project.mapper;

import com.food.project.domain.MemberVO;

public interface MemberMapper {

	//회원가입
	public void meminsert(MemberVO vo);
	
	
	//로그인 체크, 및 세션담기
	public MemberVO getmember(String m_mail);
	
	public MemberVO getname(String m_nicname);
	
	public void deletmem(String m_mail);

	public MemberVO idSearch(MemberVO vo);

	public MemberVO mailSearch(MemberVO mail);

	public MemberVO passSearch(MemberVO vo);

}
