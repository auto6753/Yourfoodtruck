package com.food.project.controller;



import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.service.LoginService;
import com.food.project.service.SellerService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller

@RequestMapping(value = "/login")
public class LoginController {
	private LoginService loginservice;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model,HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("sessionid");
		session.removeAttribute("seller");
		return "redirect:/";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(Locale locale, Model model,CustomerVO cus,HttpSession session) {
		String email = cus.getEmail();
		String password = cus.getPassword();
		System.out.println(email+password);
		CustomerVO c = new CustomerVO();
		c = loginservice.getCustomer(email);
		
		if(c==null) {
			return "idfail";
		}else if(password.equals(c.getPassword())){
			System.out.println(c.getEmail());
			System.out.println(c.getPassword());
			FoodTruckVO fd = new FoodTruckVO();
			fd = loginservice.getFoodTruck(email);
			System.out.println("ㅇ");
			if(fd == null){
				session.setAttribute("sessionid", c);
			}else {
				session.setAttribute("sessionid", c);
				session.setAttribute("seller", fd);
			}
			System.out.println("success");
			return "success";
			
		}else {
			return "pwfail";
		}	
	}

	@RequestMapping(value = "/idSearchck", method = RequestMethod.GET)
	@ResponseBody
	public String idSearchck(Model model,CustomerVO vo) {

		//데이터를 받아
		//받은데이터로 DB랑 검사
		//ajax -> LoginController.java ->  MemberService -> MemberServiceimplement.java - > MemberMapper.java-> MemberMapper.xml 
		//db쿼리 실행후 비교를하거나 결과값을 화면에 안뿌려준다면 여기서 끝 아니라면 다시 돌아감
		// MemberMapper.xml에서 실행한결과값을 들고 MemberMapper.java-> MemberSErviceimplement.java
		//-> MemberSErvice - > LoginController.java -> ajax 
		
		CustomerVO ck = loginservice.idSearch(vo);	
		if(ck == null) {
			return "false"; 
		}else {
			return ck.getEmail();
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
	public String passSearchck(Locale locale, Model model , CustomerVO vo) {
		CustomerVO ck = loginservice.passSearch(vo);
		 if (ck == null) {
			 return "false";
		 }else
			 return ck.getPassword();
				
	}

	@RequestMapping(value = "/passSearch", method = RequestMethod.GET)
	public String passSearch(Locale locale, Model model) {
		return "login/passSearch";
	}

	@RequestMapping(value = "/registerAgree", method = RequestMethod.GET)
	public String registerAgree(Locale locale, Model model) {
		return "login/registerAgree";
	}

	@RequestMapping(value = "/registerForm", method = RequestMethod.POST)
	public String registerForm(Locale locale, Model model, HttpServletRequest request) {
		String a = request.getParameter("accept1");
		if (a == null) {
			return "login/registerAgree";
		} else{
			return "login/registerForm";
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		return "login/registerAgree";
	}
	
	@RequestMapping(value = "/idck", method = RequestMethod.GET)
	@ResponseBody
	public String idck(Locale locale, Model model,@RequestParam("email") String email,@RequestParam("nickname") String nickname,@RequestParam("telephone") String telephone) {
		System.out.println(email);
		CustomerVO mail = loginservice.getCustomer(email);
		CustomerVO name = loginservice.getName(nickname);
		CustomerVO phone=loginservice.getTelephone(telephone);
		if(mail == null) {	//이메일 같은게 없을때
			if(name == null && phone==null){ //닉네임 같은게 없을때
				return "success";
			} else if(name == null && phone!=null)
				return "telephone";
			return "nicname";
		}
			return "email";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Locale locale, Model model,CustomerVO cus) {
		cus.setRegdate(new Date());
		loginservice.insertCustomer(cus);
		return "redirect:/login/registerSuccess";
	}
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
	public String joinsuccess() {	
		return "/login/registerSuccess";
	}
	
}
