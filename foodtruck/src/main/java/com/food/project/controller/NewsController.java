package com.food.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//	@RequestMapping(value = "/news/specific", method = RequestMethod.GET)
//	public String specific(Model model,PostVO vo) {
////		String post_code2="190401001";
////		model.addAttribute("post",service.getPost(post_code2));
////		model.addAttribute("replyList",service.getReply(post_code2));
//		System.out.println("ㅇ");
//		return "news/specific";
//	}
	
	@RequestMapping(value = "/news/specificck", method = RequestMethod.GET)
	public String specificck(Model model,@RequestParam("post_code") String post_code) {
		
		/* System.out.println(post_code); */
		PostVO ck = service.getPost(post_code);
		service.updatePostvisit(post_code);
		/* System.out.println(ck); */
		model.addAttribute( "specific" , ck);
		
		return "news/specific";
	}
	
	@RequestMapping(value= "/news/addNews", method= RequestMethod.GET)
	public String addNews(Model model) {
		
		
		/*
		 * vo.setPost_class(0); service.insertPost(vo);
		 * model.addAttribute("postList",service.getPostList());
		 */
		return "news/addNews";
	}
	@RequestMapping(value= "/news/addNews", method= RequestMethod.POST)
	public String addNews(Model model, PostVO vo) {
		
		
		
		service.insertPost(vo);
		
		
		 vo.setPost_class(0);//뉴스와 이벤트 구분해주는것 ex)뉴스는 0 , 이벤트는 1 
		 //model.addAttribute("postList",service.getPostList());
		
		return "redirect:/news";
	}
	
	@RequestMapping(value = "/news/delete", method = RequestMethod.POST)
	@ResponseBody//다시 js에 있는 ajax 로 돌아가는거
	public String delete(Model model , PostVO vo) {
		
		
		service.deletePost(vo);
		
		//	String post_code2="190401001";
//		model.addAttribute("post",service.getPost(post_code2));
//		model.addAttribute("replyList",service.getReply(post_code2));
		
		return "";
	}
	@RequestMapping(value = "/news/modifyNewsck", method = RequestMethod.GET)
	public String modifyNewsck(Model model,PostVO vo) {

		PostVO vo1 = service.getSpecific(vo);
		/* System.out.println(vo.getPost_code()); */
		model.addAttribute( "specificcontent" , vo1);
		
		return "news/modifyNews";
	}
	
	@RequestMapping(value = "/news/modifyNews", method = RequestMethod.POST)
	public String modifyNews(Model model,PostVO vo) {
//		String post_code2="190401001"; 
//		model.addAttribute("post",service.getPost(post_code2));
//		model.addAttribute("replyList",service.getReply(post_code2));
		/*
		 * System.out.println(vo); System.out.println(vo.getPost_code()+"옴");
		 */
		service.updatePost(vo);
		 vo.setPost_class(0);
		
		return "redirect:/news";
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
