package com.food.project.mapper;

import com.food.project.domain.MemberVO;

public interface MemberMapper {

	public void meminsert(MemberVO vo);
	
	public MemberVO getmember(String m_mail);
	
	public MemberVO idSearch(MemberVO vo);

	public MemberVO mailSearch(MemberVO mail);

	public MemberVO passSearch(MemberVO vo);
}
