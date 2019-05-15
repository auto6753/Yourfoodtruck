package com.food.project.m_controller;


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
import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@AllArgsConstructor
@Controller

@RequestMapping(value = "/m.login")
public class M_LoginController {
	private LoginService loginservice;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(CustomerVO cus) {
		String email = cus.getEmail();
		String password = cus.getPassword();
		System.out.println(email+password);
		CustomerVO c = new CustomerVO();
		c = loginservice.getCustomer(email);
		JSONObject sessionInfo = new JSONObject();
		JSONObject userInfo = new JSONObject();
		JSONObject truckInfo = new JSONObject();
		
		//로그인 결과(아이디 불일치)
		if(c==null) {
			sessionInfo.put("result","idfail");
			return sessionInfo.toString();
			
		//로그인 결과(성공)
		}else if(password.equals(c.getPassword())){
			System.out.println(c.getEmail());
			System.out.println(c.getPassword());
			userInfo.put("email", email);
			userInfo.put("password",password);
			userInfo.put("nickname",c.getNickname());
			sessionInfo.put("user",userInfo);
			FoodTruckVO fd = new FoodTruckVO();
			fd = loginservice.getFoodTruck(email);
			
			//푸드트럭 정보가 없으면 그냥 사용자정보만 리턴
			if(fd == null){
				sessionInfo.put("result","success");
				return  sessionInfo.toString();
				
			//트럭정보가 있으면 트럭정보도 리턴
			}else {
				truckInfo.fromObject(fd);
				sessionInfo.put("result","success");
				sessionInfo.put("foodtruck",truckInfo);
				return sessionInfo.toString();
			}
			
		//로그인 결과(비밀번호 불일치)
		}else {
			sessionInfo.put("result","pwfail");
			return sessionInfo.toString();
		}	
	}

	@RequestMapping(value = "/idSearchck", method = RequestMethod.GET)
	@ResponseBody
	public String idSearchck(CustomerVO vo) {

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

	/*
	 * @RequestMapping(value = "/idSearch1", method = RequestMethod.POST) public
	 * String idSearch1(Locale locale, Model model) { return "login/idSearch1"; }
	 */
	
	
	@RequestMapping(value = "/passSearchck", method = RequestMethod.POST)
	@ResponseBody
	public String passSearchck(CustomerVO vo) {
		CustomerVO ck = loginservice.passSearch(vo);
		 if (ck == null) {
			 return "false";
		 }else
			 return ck.getPassword();
				
	}

	@RequestMapping(value = "/idck", method = RequestMethod.GET)
	@ResponseBody
	public String idck(@RequestParam("email") String email,@RequestParam("nickname") String nickname,@RequestParam("telephone") String telephone) {
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
	@ResponseBody
	public String insert(CustomerVO cus) {
		cus.setRegdate(new Date());
		loginservice.insertCustomer(cus);
		return "success";
	}
}
