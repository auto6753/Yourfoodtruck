package com.food.project.service;

import com.food.project.domain.MemberVO;

public interface MemberService {
	public void meminsert(MemberVO vo);
	public MemberVO getmember(String m_mail);

	public MemberVO getname(String m_nicname);
	public void deletemem(String m_mail);

	public MemberVO idSearch(MemberVO vo);
	public MemberVO passSearch(MemberVO vo);
}
