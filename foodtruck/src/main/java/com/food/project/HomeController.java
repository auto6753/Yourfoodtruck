package com.food.project;

import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.MemberVO;
import com.food.project.service.MemberService;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@AllArgsConstructor
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private MemberService memservice;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

//	濡쒓렇�씤
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/login";
	}

// rehome 
	@RequestMapping(value = "/rehome", method = RequestMethod.GET)
	public String rehome(Locale locale, Model model) {
//		model.addAttribute("content",main(model));
		return "main/main";
	}

// 硫붿씤
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main/main";
	}

// �뫖�뱶�듃�윮 寃��깋
	@RequestMapping(value = "/serach", method = RequestMethod.GET)
	public String serach(Locale locale, Model model) {
		return "serach/serach";

	}

// mypage	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypagedo(Locale locale, Model model) {
		return "customer/Mypage";
	}

// 怨좉컼�꽱�꽣
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {
		return "help/help";
	}

//forget id
	@RequestMapping(value = "/idsearch", method = RequestMethod.GET)
	public String idsearch(Locale locale, Model model) {
		return "login/idsearch";
	}

//forget id next
	@RequestMapping(value = "/idsearch1", method = RequestMethod.GET)
	public String idsearch1(Locale locale, Model model) {
		return "login/idsearch1";
	}

//forget pw 
	@RequestMapping(value = "/pwsearch", method = RequestMethod.GET)
	public String pwsearch(Locale locale, Model model) {
		return "login/pwsearch";
	}

//forget pw next
	@RequestMapping(value = "/pwsearch1", method = RequestMethod.GET)
	public String pwsearch1(Locale locale, Model model) {
		return "login/pwsearch1";
	}

//forget pw next next 
	@RequestMapping(value = "/pwsearch2", method = RequestMethod.GET)
	public String pwsearch2(Locale locale, Model model) {
		return "login/pwsearch2";
	}

//join
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String joinmember(Locale locale, Model model) {
		return "login/join";
	}

//register
	@RequestMapping(value = "/regi", method = RequestMethod.GET)
	public String register(Locale locale, Model model, MemberVO memvo) {
		System.out.println("레지도착");
		memvo.getM_name();
		memservice.meminsert(memvo);
		return "login/join";
	}

//login check
	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String logincheck(@RequestParam("m_mail") String m_mail,@RequestParam("m_passwd") String m_passwd, Model model,HttpSession session,HttpServletRequest request) {
//		model.addAttribute("customer", memservice.getmember(m_mail));
		String result;
		System.out.println("왔다.");
		System.out.println(m_mail);
		MemberVO memvo =  memservice.getmember(m_mail);
		
		if(memvo == null) {
			System.out.println("아이디틀림");
			result="idfail"; //아이디틀림
		}
		else if(memvo.getM_passwd().equals(m_passwd)) {
			System.out.println("성공");
			result="success";// 성공
			/* HttpSession si = null; */
			/* session.setAttribute("sessionid", memvo.getM_mail()); */
			/* si.setAttribute("sessionid", memvo); */
			
			request.getSession().setAttribute("sessionid", memvo);
			System.out.println(request.getSession().getAttribute("sessionid"));
		}
		else {
			System.out.println("비번틀림");
			result="pwfail";//비번틀림
		}	

//		System.out.println(memvo.getM_passwd());
		System.out.println(result);
		
		return result;
	}
}
