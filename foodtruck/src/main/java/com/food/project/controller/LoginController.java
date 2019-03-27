package com.food.project.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model,HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("sessionid");
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(Locale locale, Model model,MemberVO mem,HttpSession session) {
		System.out.println("좀와라 시발");
		String id = mem.getM_mail();
		String pw = mem.getM_passwd();
		MemberVO m = new MemberVO();
		m = memservice.getmember(id);
		if(m==null) {
			return "idfail";
		}else if(pw.equals(m.getM_passwd())){
			session.setAttribute("sessionid", m);
			System.out.println("success");
			return "success";
			
		}else {
			return "pwfail";
		}	
	}

	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	public String idSearch(Locale locale, Model model) {
		return "login/idSearch";
	}

	@RequestMapping(value = "/idSearch1", method = RequestMethod.POST)
	public String idSearch1(Locale locale, Model model) {
		return "login/idSearch1";
	}

	@RequestMapping(value = "/passSearch", method = RequestMethod.POST)
	public String passSearch(Locale locale, Model model) {
		return "login/passSearch";
	}

	@RequestMapping(value = "/passSearch1", method = RequestMethod.POST)
	public String passSearch1(Locale locale, Model model) {
		return "login/passSearch1";
	}

	@RequestMapping(value = "/passSearch2", method = RequestMethod.POST)
	public String passSearch2(Locale locale, Model model) {
		return "login/passSearch2";
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
	public String idck(Locale locale, Model model,@RequestParam("m_mail") String m_mail,@RequestParam("m_nicname") String m_nicname) {
		System.out.println(m_mail);
		MemberVO mail = memservice.getmember(m_mail);
		MemberVO name = memservice.getname(m_nicname);
		if(mail == null) {	//이메일 같은게 없을때
			if(name == null){ //닉네임 같은게 없을때
				return "success";
			}
			return "nicname";
		}
			return "email";
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Locale locale, Model model,MemberVO mem) {
		memservice.meminsert(mem);
		return "redirect:/login/registerSuccess";
	}
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
	public String joinsuccess(Locale locale, Model model,MemberVO mem) {	
		return "/login/registerSuccess";
	}
	
}
