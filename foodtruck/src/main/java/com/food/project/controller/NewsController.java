package com.food.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.EventVO;
import com.food.project.domain.OnboardVO;
import com.food.project.domain.PostVO;
import com.food.project.paging.PostPager;
import com.food.project.service.EventService;
import com.food.project.service.PostService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class NewsController {
	PostService postService;
	EventService eventService;
	
	@RequestMapping(value = "/news")
	public String news(Model model,@RequestParam(defaultValue="0") int post_class,
			@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="") String keyword) {
		int totPage=0;
		PostPager postPager;
		if(keyword.isEmpty()) {
			totPage=postService.totalPage(post_class);
			System.out.println("인자 1개"+totPage);
			postPager=new PostPager(totPage,curPage);
		}else {
			totPage=postService.totalPage2(post_class,keyword);
			System.out.println("인자 2개"+totPage);
			postPager=new PostPager(totPage,curPage);
		}
		int start=postPager.getPageBegin();
		int end=postPager.getPageEnd();
		ArrayList<Map<String,Object>> areaList=postService.allList(start,end,keyword,post_class);
		System.out.println(postPager.toString());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("totPage",totPage);
		map.put("keyword",keyword);
		map.put("postPager",postPager);
		model.addAttribute("newspostList",postService.getPostList(1));
		model.addAttribute("newsList",areaList);
		model.addAttribute("map",map);
		
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
		PostVO ck = postService.getPost(post_code);
		postService.updatePostvisit(post_code);
		/* System.out.println(ck); */
		model.addAttribute( "newsSpecific" , ck);
		
		return "news/newsSpecific";
	}
	
	@RequestMapping(value= "/news/addNews", method= RequestMethod.GET)
	public String addNews(Model model) {
		return "news/addNews";
	}
	
	
	@RequestMapping(value= "/news/addNews", method= RequestMethod.POST)
	public String addNews(Model model, PostVO vo) {
		vo.setPost_class(0);
		postService.insertPost(vo);
		return "redirect:/news";
	}
	@RequestMapping(value = "/news/modifyNewsck", method = RequestMethod.GET)
	public String modifyNewsck(Model model,PostVO vo) {
		PostVO vo1 = postService.getSpecific(vo);
		model.addAttribute( "newsspecificcontent" , vo1);
		return "news/modifyNews";
	}
	
	@RequestMapping(value = "/news/modifyNews", method = RequestMethod.POST)
	public String modifyNews(Model model,PostVO vo) {
		vo.setPost_class(0);
		postService.updatePost(vo);
		return "redirect:/news";
	}
	
	@RequestMapping(value = "/news/delete", method = RequestMethod.POST)
	@ResponseBody//다시 js에 있는 ajax 로 돌아가는거
	public String delete(Model model , PostVO vo) {
		
		postService.deletePost(vo);
		
		return "";
	}
	
	
	
	@RequestMapping(value = "/eventOn", method = RequestMethod.GET)
	public String eventOn(Locale locale, Model model) {
		ArrayList<EventVO> eve = new ArrayList<EventVO>();
		ArrayList<EventVO> ievent = new ArrayList<>();
		ArrayList<EventVO> eevent = new ArrayList<>();
		eve = eventService.getMainevent();
			
		for(int i=0; i < eve.size(); i++) {
			SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
			int sysdate = Integer.parseInt(date.format(System.currentTimeMillis()));
			System.out.println(sysdate);
			Date enddate = eve.get(i).getEvent_end();
			String edate = date.format(enddate);
			int end_date = Integer.parseInt(edate);
			System.out.println(end_date);
		
			if(end_date > sysdate) {
				ievent.add(eve.get(i));
			}else {
				eevent.add(eve.get(i));
			}
		}		
		
		model.addAttribute("ievent",ievent);
		model.addAttribute("eevent",eevent);
		
		
		
		
		return "event/mainevent";
	}
	
//	@RequestMapping(value = "/eventOff", method = RequestMethod.GET)
//	public String eventOff(Locale locale, Model model) {
//		return "event/off";
//	}
}
