package com.food.project.mapper;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;

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
	
	//전화번호 찾기
	public CustomerVO getTelephone(String telephone);
	
	//비밀번호 찾기
	public CustomerVO passSearch(CustomerVO vo);

	//트럭등록 여부
	public FoodTruckVO getFoodTruck(String email);

	public CustomerVO updatePassword(String email);
}
