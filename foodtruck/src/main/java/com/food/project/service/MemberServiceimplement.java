package com.food.project.service;

import org.springframework.stereotype.Service;

import com.food.project.domain.MemberVO;
import com.food.project.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceimplement implements MemberService {
	private MemberMapper memmapper; //MemberMapper 
	
	//member insert
	public void meminsert(MemberVO vo) {
		// mapper

		memmapper.meminsert(vo);
	}
	@Override
	public MemberVO getmember(String m_mail) {
		// TODO Auto-generated method stub
		
		return memmapper.getmember(m_mail);
	}
	@Override

	public MemberVO getname(String m_nicname) {
		// TODO Auto-generated method stub
		return memmapper.getname(m_nicname);
	}
	@Override
	public void deletemem(String m_mail) {
		// TODO Auto-generated method stub
		 memmapper.deletmem(m_mail);
		
	}
	public MemberVO idSearch(MemberVO vo) {
		// TODO Auto-generated method stub
		return memmapper.idSearch(vo);
	}
	@Override
	public MemberVO passSearch(MemberVO vo) {
		// TODO Auto-generated method stub
		return memmapper.passSearch(vo);
	}

}
