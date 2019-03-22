package com.food.project.mapper;

import com.food.project.domain.MemberVO;

public interface MemberMapper {

	public void meminsert(MemberVO vo);
	
	public MemberVO getmember(String m_mail);
}
