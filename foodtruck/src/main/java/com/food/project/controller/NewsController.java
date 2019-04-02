package com.food.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.food.project.domain.PostVO;
import com.food.project.service.PostService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class NewsController {
	PostService service;
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(Model model) {
		model.addAttribute("postList",service.getPostList());
		return "news/news";
	}
	
	@RequestMapping(value = "/news/specific", method = RequestMethod.GET)
	public String getNews(Model model,PostVO vo) {
//		String post_code2="190401001";
//		model.addAttribute("post",service.getPost(post_code2));
//		model.addAttribute("replyList",service.getReply(post_code2));
		return "news/specific";
	}
	
	@RequestMapping(value= "/news/addNews", method= RequestMethod.POST)
	public String addNews(Model model, PostVO vo) {
		vo.setPost_class(0);
		service.insertPost(vo);
		model.addAttribute("postList",service.getPostList());
		return "news/news";
	}
	

	@RequestMapping(value = "/eventOn", method = RequestMethod.GET)
	public String eventOn(Locale locale, Model model) {
		return "event/event";
	}


	
//	@RequestMapping(value = "/eventOff", method = RequestMethod.GET)
//	public String eventOff(Locale locale, Model model) {
//		return "event/off";
//	}
}
