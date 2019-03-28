package com.food.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.MemberVO;
import com.food.project.service.MemberService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/login", method = RequestMethod.GET)
public class LoginController {
private MemberService memservice;
	
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public String loginCheck(Locale locale, Model model) {
		return null;
	}
	
	@RequestMapping(value = "/idSearchck", method = RequestMethod.POST)
	@ResponseBody
	public String idSearchck(Locale locale, Model model,MemberVO vo) {
		//데이터를 받아
		//받은데이터로 DB랑 검사
		//ajax -> LoginController.java ->  MemberService -> MemberServiceimplement.java - > MemberMapper.java-> MemberMapper.xml 
		//db쿼리 실행후 비교를하거나 결과값을 화면에 안뿌려준다면 여기서 끝 아니라면 다시 돌아감
		// MemberMapper.xml에서 실행한결과값을 들고 MemberMapper.java-> MemberSErviceimplement.java
		//-> MemberSErvice - > LoginController.java -> ajax 
		
		
		
		
		MemberVO ck = memservice.idSearch(vo);
		System.out.println("개새끼야");
		
		if(ck == null) {
			return "false"; 
		}else {
			return ck.getM_mail();
		}
		
	}
	@RequestMapping(value = "/idSearch", method = RequestMethod.GET)
	public String idSearch(Locale locale, Model model) {
		 
		return "login/idSearch";
		
	}	

	/*
	 * @RequestMapping(value = "/idSearch1", method = RequestMethod.POST) public
	 * String idSearch1(Locale locale, Model model) { return "login/idSearch1"; }
	 */
	
	
	@RequestMapping(value = "/passSearchck", method = RequestMethod.POST)
	@ResponseBody
	public String passSearchck(Locale locale, Model model , MemberVO vo) {
	
		
		 MemberVO ck = memservice.passSearch(vo);
		
		 if (ck == null) {
			 return "false";
		 }else
			 return ck.getM_passwd();
						
	}
	
	@RequestMapping(value = "/passSearch", method = RequestMethod.POST)
	public String passSearch(Locale locale, Model model) {
		return "login/passSearch";
	}
	
	
	
	@RequestMapping(value = "/registerAgree", method = RequestMethod.GET)
	public String registerAgree(Locale locale, Model model) {
		return "login/registerAgree";
	}
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm(Locale locale, Model model) {
		return "login/registerForm";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		return "login/registerAgree";
	}
}
