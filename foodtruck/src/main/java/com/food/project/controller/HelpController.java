package com.food.project.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.HelpVO;
import com.food.project.service.HelpService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/help")
public class HelpController {

//	@Autowired
//	private PageMapper pageMapper;
	private HelpService helpservice;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {
		return "help/helpMain";
	}
	
	@RequestMapping(value = "/questionReg", method = RequestMethod.GET)
	public String questionReg(Locale locale, Model model) {
	
		return "help/questionReg";
	}
	
	@RequestMapping(value = "/questionReg", method = RequestMethod.POST)
	public String registerQna(Model model,HelpVO vo,HttpSession session) {
		CustomerVO cvo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println("?");
	
		System.out.println(cvo);
		if(cvo!=null) {
			vo.setEmail(cvo.getEmail());
			System.out.println("f");
		}else {
			vo.setEmail("비로그인");
			System.out.println("z");
		}
			
		helpservice.insertHelp(vo);
		System.out.println("for Test");
		System.out.println(vo);
		
		return "redirect:/help";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/myQuestion", method = RequestMethod.GET)
	public String myQuestion(Locale locale, Model model, HttpSession session) {
		CustomerVO cvo = (CustomerVO) session.getAttribute("sessionid");
		
		if(cvo!=null){
		HelpVO vo = new HelpVO();
		vo.setEmail(cvo.getEmail());
		ArrayList<HelpVO> list = helpservice.getHelpList(vo);
		
		JSONArray hi = new JSONArray();
		for(int i=0;i<list.size();i++) {
			JSONObject object = new JSONObject();
			object.put("question_code", list.get(i).getQuestion_code());
			object.put("question_title", list.get(i).getQuestion_title());
			object.put("question_content", list.get(i).getQuestion_content());
			object.put("question_regdate", list.get(i).getQuestion_regdate());
			if(list.get(i).getQu_replay_content()!=null) {
			object.put("status", "답변완료");
			}else {
			object.put("status", "답변대기");
			}
		hi.add(object);
		}
		System.out.println(hi.size());
		System.out.println(hi.toString());
		
		model.addAttribute("list", hi);
		return "help/myQuestion";
		
		}else {
			
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
//		PageMaker pageMaker = new PageMaker();
//		String pageNum = request.getParameter("pageNum");
//		String postPerPage = request.getParameter("postPerPage");
//		int cPageNum = Integer.parseInt(pageNum);
//		int cPostPerPage = Integer.parseInt(postPerPage);
//		
//		pageMaker.setTotalPost(pageMapper.testCount());
//		pageMaker.setPageNum(cPageNum-1);
//		pageMaker.setPostPerPage(cPostPerPage);
//		pageMaker.setCurrentBlock(cPageNum);
//		
//		pageMaker.contPrevNext(cPageNum);
//		pageMaker.setBeginPage(pageMaker.getCurrentBlock());
//		pageMaker.setLastPage(pageMaker.getLastBlock(), pageMaker.getCurrentBlock());
//		
//		List<Test> testList = new ArrayList<>();
//		testList = pageMapper.testList(pageMaker.getPageNum()*10, pageMaker.getPostPerPage());
//		
//		request.setAttribute("list", testList);
//		request.setAttribute("page", pageMaker);
		
		return "help/list";
	}
}
