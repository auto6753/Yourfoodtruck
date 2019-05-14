package com.food.project.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.ReviewVO;
import com.food.project.mapper.FoodtruckMapper;
import com.food.project.service.FoodTruckService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/truck")
public class TruckController {
	private FoodTruckService service;
	private FoodtruckMapper mapper;
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String info(Model model ,@RequestParam("truck_code") String truck_code ) { //검색된페이지에서 클릭한 푸드트럭의 코드를 들고옴

		FoodTruckVO ss= service.getFoodTruck(truck_code); //클릭한 푸드트럭으로 해당 푸드트럭의 정보를 select 
		
		model.addAttribute("tlist", ss); //푸드트럭 정보를 tlist 에 담아서 truck/truckInfo 페이지로 넘김 
		model.addAttribute("reviewList",service.getReviewList(truck_code)); //클릭한 푸드트럭의 코드로 해당 푸드트럭의 댓글을 조회해서 reviewList에 담고 truck/truckInfo 로 넘겨줌
		
		return "truck/truckInfo";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		return "truck/register/registerForm";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String register(Model model,FoodTruckVO fd,HttpServletRequest request,HttpSession session) {
	
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		fd.setEmail(vo.getEmail());
		fd.setLayout(0);
		//System.out.println(fd);
		FoodTruckVO vo2= service.insertFoodTruck(fd);
		System.out.println(vo2);
		//System.out.println(session);
		session.setAttribute("seller", vo2);
		return "redirect:/seller";
	}

	//리뷰작성
	@RequestMapping(value = "/reviewwrite", method = RequestMethod.POST)
	@ResponseBody
	public String reviewwrite(Model model , ReviewVO vo , HttpSession session) {
	
	
		CustomerVO cvo = (CustomerVO) session.getAttribute("sessionid");
		
		vo.setEmail(cvo.getEmail());
		/* vo.setReview_code("22"); */
		
		service.insertReview(vo);
		
		
		return "truck/truckInfo";
	}
	@RequestMapping(value = "/reviewdelete", method = RequestMethod.POST)
	@ResponseBody
	public String reviewdelte(Model model , ReviewVO vo ) {
	
	
		
		mapper.reviewdelete(vo);
		
		
		return "";
	}
	/*
	 * @RequestMapping(value = "/reviewSearch", method = RequestMethod.POST) public
	 * String reviewSearch(Model model) {
	 * 
	 * System.out.println("sfsdfsdfsdf");
	 * //model.addAttribute("reviewList",service.getReviewList());
	 * 
	 * 
	 * return "truck/truckInfo"; }
	 */
	
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String register2(Model model, FoodTruckVO fd) {
//		System.out.println("fd");
//		return "";
//	}

	@RequestMapping(value = "/callForm", method = RequestMethod.GET)
	public String callForm(Locale locale) {
		
		
		/* callList.insertCallList(vo); */
		 
		return "truck/callForm";
	}
	@ResponseBody
	@RequestMapping(value = "/callList", method = RequestMethod.POST)
	public String callList(Locale locale, CallListVO vo) {
		
		System.out.print(vo);
		/* callList.insertCallList(vo); */
	
		
		return "success";
	}
}