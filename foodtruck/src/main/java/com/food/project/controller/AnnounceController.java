package com.food.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.PostVO;
import com.food.project.domain.RecruitVO;
import com.food.project.domain.RequestdataVO;
import com.food.project.paging.PostPager;
import com.food.project.service.AreaService;
import com.food.project.service.PostService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@AllArgsConstructor
@Controller
public class AnnounceController {
	PostService postService;
	AreaService areaService;
	
	//모집공고 컨트롤러
	@RequestMapping(value = "/announce")
	public String recruit(Model model,@RequestParam(defaultValue="1") int post_class,
			@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="") String keyword) {
		//========================================페이징 하기=======================================
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
		System.out.println(areaList.toString());
		System.out.println(postPager.toString());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("totPage",totPage);
		map.put("keyword",keyword);
		map.put("postPager",postPager);
		model.addAttribute("announcepostList",postService.getPostList(1));
		model.addAttribute("announceList",areaList);
		model.addAttribute("map",map);
		return "announce/localrecruit";
	}
	@RequestMapping(value = "/recruit" , method= RequestMethod.GET)
	public String recruits(Model model/*@RequestParam(defaultValue="1") int post_class, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="") String keyword*/, RecruitVO vo) {
		System.out.println("ann/recruit");
		ArrayList<RecruitVO> vo1 = postService.getList(vo);
		System.out.println(vo1);
		model.addAttribute("recruit" , vo1);
		
		//========================================페이징 하기=======================================
		/*
		 * int totPage=0; PostPager postPager; if(keyword.isEmpty()) {
		 * totPage=postService.totalPage(post_class);
		 * System.out.println("인자 1개"+totPage); postPager=new
		 * PostPager(totPage,curPage); }else {
		 * totPage=postService.totalPage2(post_class,keyword);
		 * System.out.println("인자 2개"+totPage); postPager=new
		 * PostPager(totPage,curPage); } int start=postPager.getPageBegin(); int
		 * end=postPager.getPageEnd(); ArrayList<Map<String,Object>>
		 * areaList=postService.allList(start,end,keyword,post_class);
		 * System.out.println(areaList.toString());
		 * System.out.println(postPager.toString()); Map<String,Object> map=new
		 * HashMap<String,Object>(); map.put("totPage",totPage);
		 * map.put("keyword",keyword); map.put("postPager",postPager);
		 * model.addAttribute("announcepostList",postService.getPostList(1));
		 * model.addAttribute("announceList",areaList); model.addAttribute("map",map);
		 */
		return "announce/recruit";
	}
	@RequestMapping(value= "/recruit/addRecruit", method= RequestMethod.GET)
	public String addRecruit(Model model) {
		return "announce/addRecruit";
	}
	@RequestMapping(value= "/recruit/addRecruit", method= RequestMethod.POST)
	public String addRecruit(Model model , RecruitVO vo , HttpSession session ) {
		
		CustomerVO cvo = (CustomerVO) session.getAttribute("sessionid");
		
		vo.setRequest_email(cvo.getEmail());
		
		postService.addRecruit(vo);
		
		
		return "redirect:/recruit";
	}
	@RequestMapping(value= "/recruit/specific", method= RequestMethod.GET)
	public String recruitSpecific(Model model ,@RequestParam("request_code") String request_code) {
		
		RecruitVO ck = postService.getRequestspecific(request_code);
		model.addAttribute("specific", ck);
		//System.out.println(ck);
		//System.out.println("1");
		
		postService.updateVisit(request_code);
		
		return "announce/recruitSpecific";
	}
	
	@RequestMapping(value= "/recruit/modify", method= RequestMethod.GET)
	public String recruitModify(Model model ,@RequestParam("request_code") String request_code) {
		
		RecruitVO ck = postService.getRequestmodify(request_code);
		System.out.println(ck);
		model.addAttribute("requestmodify", ck);
		
	
		
		return "announce/recruitModify";
	}
	@RequestMapping(value= "/recruit/successmodify", method= RequestMethod.POST)
	@ResponseBody
	public String successmodify(Model model , RecruitVO vo) {
		
		postService.requestmodifysuccess(vo);
		
	
		
	
		
		return "";
	}
	
	@RequestMapping(value= "/recruit/delete", method= RequestMethod.POST)
	@ResponseBody
	public String recruitDelete(Model model ,RecruitVO vo ) {
		
		postService.deleteRequest(vo);
		
		
	
		
		return "";
	}
	
	
	
	@RequestMapping(value = "/announce/specificck", method = RequestMethod.GET)
	public String announceSpecificck(Model model,@RequestParam("post_code") String post_code) {
		
		/* System.out.println(post_code); */
		PostVO ck = postService.getPost(post_code);
		postService.updatePostvisit(post_code);
		/* System.out.println(ck); */
		model.addAttribute( "announceSpecific" , ck);
		return "announce/announceSpecific";
	}
	@RequestMapping(value= "/announce/addAnnounce", method= RequestMethod.GET)
	public String addAnnounce(Model model) {
		return "announce/addAnnounce";
	}
	
	
	@RequestMapping(value= "/announce/addAnnounce", method= RequestMethod.POST)
	public String addAnnounce(Model model, PostVO vo) {
		vo.setPost_class(1);
		postService.insertPost(vo);
		return "redirect:/announce";
	}
	@RequestMapping(value = "/announce/modifyAnnounceck", method = RequestMethod.GET)
	public String modifyAnnounceck(Model model,PostVO vo) {
		PostVO vo1 = postService.getSpecific(vo);
		model.addAttribute( "announcespecificcontent" , vo1);
		return "announce/modifyAnnounce";
	}
	
	@RequestMapping(value = "/announce/modifyAnnounce", method = RequestMethod.POST)
	public String modifyAnnounce(Model model,PostVO vo) {
		vo.setPost_class(1);
		postService.updatePost(vo);
		return "redirect:/announce";
	}
	
	
	@RequestMapping(value = "/announce/delete", method = RequestMethod.GET)
	@ResponseBody
	public String announceDelete(Model model,PostVO vo) {
		postService.deletePost(vo);
		return "";
	}
	
	@RequestMapping(value = "/announce/jsonToDB", method = RequestMethod.POST)
	@ResponseBody
	public String jsonToDB(@RequestBody String param) {
		String result=postService.deleteAnnounce();
		if(result.equals("empty")) {
			Map<String,Object> jsonData = new HashMap<>();
			jsonData=JSONObject.fromObject(param);
			Object gonggo_list = new ArrayList<Map<String,Object>>();
			gonggo_list= (jsonData.get("list"));
			List<Map<String,Object>> test = new ArrayList<Map<String,Object>>();
			test=JSONArray.fromObject(gonggo_list.toString());
			//System.out.println(test);
			for(Map<String,Object> s : test) {
				//System.out.println(s);
				Object lists = new ArrayList<Map<String,Object>>();
				lists= s.get("gonggo_list");
				List<Map<String,Object>> listsArrayList = new ArrayList<Map<String,Object>>(); 
				listsArrayList = JSONArray.fromObject(lists.toString());
				if (listsArrayList.size()!=0) {
					for(Map<String,Object> post : listsArrayList) {
						PostVO vo = new PostVO();
						vo.setPost_title((String)post.get("post_title"));
						vo.setPost_url((String)post.get("post_url"));
						vo.setPost_content((String)s.get("region"));
						vo.setPost_class(1);
						postService.insertPost(vo);
					}
				}
			}
			return "Yes";
		}else if(result.equals("not_empty")) {
			
			return "No";
		}else {
			return "No";
		}
	}
	
	//허가구역 관리 컨트롤러
	@RequestMapping(value = "/area")
	public String area(Model model,@RequestParam(defaultValue="1") int sido,
			@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="") String keyword) {
		int totPage=0;
		PostPager postPager;
		if(keyword.isEmpty()) {
			totPage=areaService.totalPage(sido);
			System.out.println("인자 1개"+totPage);
			postPager=new PostPager(totPage,curPage);
		}else {
			totPage=areaService.totalPage2(sido,keyword);
			System.out.println("인자 2개"+totPage);
			postPager=new PostPager(totPage,curPage);
		}
		int start=postPager.getPageBegin();
		int end=postPager.getPageEnd();
		ArrayList<Map<String,Object>> areaList=areaService.allList(start,end,keyword,sido);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("totPage",totPage);
		map.put("keyword",keyword);
		map.put("postPager",postPager);
		model.addAttribute("areaList",areaList);
		model.addAttribute("map",map);
		model.addAttribute("sido",sido);
		return "announce/area";
	}

}
