package com.food.project.service;

import com.food.project.domain.MemberVO;

public interface MemberService {
	
	public void meminsert(MemberVO vo);
	public String getmember(String m_mail);
}
