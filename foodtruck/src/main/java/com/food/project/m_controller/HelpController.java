package com.food.project.m_controller;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/help")
public class HelpController {

//	@Autowired
//	private PageMapper pageMapper;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {
		return "help/helpMain";
	}
	
	@RequestMapping(value = "/questionReg", method = RequestMethod.GET)
	public String questionReg(Locale locale, Model model) {
		return "help/questionReg";
	}
	
	@RequestMapping(value = "/questionReg", method = RequestMethod.POST)
	public String registerQna() {
		System.out.println("for Test");
		return "help/helpMain";
	}
	
	
	@RequestMapping(value = "/myQuestion", method = RequestMethod.GET)
	public String myQuestion(Locale locale, Model model) {
		return "help/myQuestion";
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
