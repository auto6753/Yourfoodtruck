package com.food.project.m_controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.MaineventDTO;
import com.food.project.domain.PostVO;
import com.food.project.paging.PostPager;
import com.food.project.service.PostService;
import com.food.project.service.EventService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@CrossOrigin(origins = "*")
@Controller
@AllArgsConstructor
public class M_NewsController {
	PostService postService;
	EventService eventService;

	@ResponseBody
	@RequestMapping(value = "/m.news", produces = "application/text; charset=utf8")
	public String news(@RequestParam(defaultValue = "0") int post_class, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "") String keyword) {
		int totPage = 0;
		PostPager postPager;
		if (keyword.isEmpty()) {
			totPage = postService.totalPage(post_class);
			System.out.println("인자 1개" + totPage);
			postPager = new PostPager(totPage, curPage);
		} else {
			totPage = postService.totalPage2(post_class, keyword);
			System.out.println("인자 2개" + totPage);
			postPager = new PostPager(totPage, curPage);
		}
		int start = postPager.getPageBegin();
		int end = postPager.getPageEnd();
		List<Map<String, Object>> areaList = postService.allList(start, end, keyword, post_class);
		System.out.println(postPager.toString());
		System.out.println(areaList.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totPage", totPage);
		map.put("keyword", keyword);
		JSONObject postPagerObj = new JSONObject();
		postPagerObj = JSONObject.fromObject(postPager);
		map.put("postPager", postPagerObj);
		JSONArray areaArr = new JSONArray();
		areaArr = JSONArray.fromObject(areaList);
		map.put("newsList", areaArr);
		JSONObject resultObj = new JSONObject();
//		resultObj=JSONObject.fromObject(map);
		resultObj.put("totPage", totPage);
		resultObj.put("keyword", keyword);
		resultObj.put("postPager", postPagerObj);
		resultObj.put("newsList", areaArr);
		System.out.println(resultObj);
		return resultObj.toString();
	}

//	@RequestMapping(value = "/news/specific", method = RequestMethod.GET)
//	public String specific(Model model,PostVO vo) {
////		String post_code2="190401001";
////		model.addAttribute("post",service.getPost(post_code2));
////		model.addAttribute("replyList",service.getReply(post_code2));
//		System.out.println("ㅇ");
//		return "news/specific";
//	}

	@RequestMapping(value = "/m.news/specificck", method = RequestMethod.GET)
	public String specificck(Model model, @RequestParam("post_code") String post_code) {

		/* System.out.println(post_code); */
		PostVO ck = postService.getPost(post_code);
		postService.updatePostvisit(post_code);
		/* System.out.println(ck); */
		model.addAttribute("specific", ck);

		return "news/specific";
	}

	@RequestMapping(value = "/m.news/addNews", method = RequestMethod.GET)
	public String addNews(Model model) {

		/*
		 * vo.setPost_class(0); service.insertPost(vo);
		 * model.addAttribute("postList",service.getPostList());
		 */
		return "news/addNews";
	}

	@RequestMapping(value = "/m.news/addNews", method = RequestMethod.POST)
	public String addNews(Model model, PostVO vo) {

		postService.insertPost(vo);

		vo.setPost_class(0);// 뉴스와 이벤트 구분해주는것 ex)뉴스는 0 , 이벤트는 1
		// model.addAttribute("postList",service.getPostList());

		return "redirect:/m.news";
	}

	@RequestMapping(value = "/m.news/delete", method = RequestMethod.POST)
	@ResponseBody // 다시 js에 있는 ajax 로 돌아가는거
	public String delete(Model model, PostVO vo) {

		postService.deletePost(vo);

		// String post_code2="190401001";
//		model.addAttribute("post",service.getPost(post_code2));
//		model.addAttribute("replyList",service.getReply(post_code2));

		return "";
	}

	@RequestMapping(value = "/m.news/modifyNewsck", method = RequestMethod.GET)
	public String modifyNewsck(Model model, PostVO vo) {

		PostVO vo1 = postService.getSpecific(vo);
		/* System.out.println(vo.getPost_code()); */
		model.addAttribute("specificcontent", vo1);

		return "news/modifyNews";
	}

	@RequestMapping(value = "/m.news/modifyNews", method = RequestMethod.POST)
	public String modifyNews(Model model, PostVO vo) {
//		String post_code2="190401001"; 
//		model.addAttribute("post",service.getPost(post_code2));
//		model.addAttribute("replyList",service.getReply(post_code2));
		/*
		 * System.out.println(vo); System.out.println(vo.getPost_code()+"옴");
		 */
		postService.updatePost(vo);
		vo.setPost_class(0);

		return "redirect:/news";
	}

	@ResponseBody
	@RequestMapping(value = "/m.eventOn", method = RequestMethod.POST)
	public JSONObject eventOn(Locale locale, Model model, MaineventDTO vo) {
		ArrayList<MaineventDTO> eve = eventService.getMainevent(vo);

		JSONArray jEvent1 = new JSONArray();
		JSONArray jEvent2 = new JSONArray();

		Map<String, Object> map1 = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();

		/* eve = eventService.getMainevent(); */

		for (int i = 0; i < eve.size(); i++) {
			SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
			int sysdate = Integer.parseInt(date.format(System.currentTimeMillis()));
			System.out.println(sysdate);
			Date enddate = eve.get(i).getEvent_end();
			String edate = date.format(enddate);
			int end_date = Integer.parseInt(edate);
			System.out.println(end_date);

			if (end_date > sysdate) {
				map1.put("i_brandname", eve.get(i).getBrandname());
				map1.put("i_truckcode", eve.get(i).getTruck_code());
				map1.put("i_start", eve.get(i).getEvent_start());
				map1.put("i_end", eve.get(i).getEvent_end());
				map1.put("i_eventname", eve.get(i).getEvent_name());
				map1.put("i_eventurl", eve.get(i).getEvent_url());

			} else {
				map2.put("e_brandname", eve.get(i).getBrandname());
				map2.put("e_truckcode", eve.get(i).getTruck_code());
				map2.put("e_start", eve.get(i).getEvent_start());
				map2.put("e_end", eve.get(i).getEvent_end());
				map2.put("e_eventname", eve.get(i).getEvent_name());
				map2.put("e_eventurl", eve.get(i).getEvent_url());
			}
		}

		JSONObject jObj1 = JSONObject.fromObject(map1);
		JSONObject jObj2 = JSONObject.fromObject(map2);
		JSONObject resultobj = new JSONObject();
		jEvent1.add(jObj1);
		jEvent2.add(jObj2);

		resultobj.put("ing", jEvent1);
		resultobj.put("end", jEvent2);

		System.out.println(resultobj);

		return resultobj;
	}

//	@RequestMapping(value = "/eventOff", method = RequestMethod.GET)
//	public String eventOff(Locale locale, Model model) {
//		return "event/off";
//	}
}
