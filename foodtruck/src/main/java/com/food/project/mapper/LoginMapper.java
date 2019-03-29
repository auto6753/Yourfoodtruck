package com.food.project.mapper;

import com.food.project.domain.CustomerVO;

public interface LoginMapper {

	//회원가입
	public void insertCustomer(CustomerVO vo);
	
	//로그인 체크, 및 세션담기
	public CustomerVO getCustomer(String email);
	
	//닉네임중복체크
	public CustomerVO getName(String nickname);
	
	//회원탈퇴
	public void delete(String email);
	
	//아이디찾기
	public CustomerVO idSearch(CustomerVO vo);
	
	//비밀번호 찾기
	public CustomerVO passSearch(CustomerVO vo);

}
