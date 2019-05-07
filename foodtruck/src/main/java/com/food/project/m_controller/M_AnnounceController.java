package com.food.project.m_controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.PaymentVO;
import com.food.project.domain.PostVO;
import com.food.project.paging.PostPager;
import com.food.project.service.PaymentService;
import com.food.project.service.PostService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class M_AnnounceController {
	PostService postService;
	@RequestMapping(value = "/m.announce", method = RequestMethod.GET)
	public String recruit(Model model) {
		return "announce/recruit";
	}
	
	
	//허가구역 관리 컨트롤러
	@RequestMapping(value = "/m.area")
	public String area(Model model,@RequestParam(defaultValue="2") int post_class,
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
		model.addAttribute("areapostList",postService.getPostList(2));
		model.addAttribute("areaList",areaList);
		model.addAttribute("map",map);
		return "announce/area";
	}
	@RequestMapping(value = "/m.area/specificck", method = RequestMethod.GET)
	public String specificck(Model model,@RequestParam("post_code") String post_code) {
		
		/* System.out.println(post_code); */
		PostVO ck = postService.getPost(post_code);
		postService.updatePostvisit(post_code);
		/* System.out.println(ck); */
		model.addAttribute( "areaspecific" , ck);
		return "announce/areaspecific";
	}
	
	@RequestMapping(value= "/m.area/addArea", method= RequestMethod.GET)
	public String addArea(Model model) {
		return "announce/addArea";
	}
	
	
	@RequestMapping(value= "/m.area/addArea", method= RequestMethod.POST)
	public String addArea(Model model, PostVO vo) {
		vo.setPost_class(2);
		postService.insertPost(vo);
		return "redirect:/area";
	}
	
	@RequestMapping(value = "/m.area/modifyAreack", method = RequestMethod.GET)
	public String modifyAreack(Model model,PostVO vo) {
		PostVO vo1 = postService.getSpecific(vo);
		model.addAttribute( "areaspecificcontent" , vo1);
		return "announce/modifyArea";
	}
	
	@RequestMapping(value = "/m.area/modifyArea", method = RequestMethod.POST)
	public String modifyArea(Model model,PostVO vo) {
		vo.setPost_class(2);
		postService.updatePost(vo);
		return "redirect:/area";
	}
	
	
	@RequestMapping(value = "/m.area/delete", method = RequestMethod.GET)
	@ResponseBody
	public String areaDelete(Model model,PostVO vo) {
		postService.deletePost(vo);
		return "";
	}

}
