package com.food.project.m_controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.MyreviewlistDTO;
import com.food.project.domain.OnboardVO;
import com.food.project.service.CallListService;
import com.food.project.service.FoodTruckService;
import com.food.project.service.LoginService;
import com.food.project.service.OnboardService;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
@AllArgsConstructor
@Controller
@CrossOrigin()
@RequestMapping(value = "/m.customer")
public class M_CustomerController {

	private LoginService service;
	CallListService callList;
	OnboardService onboard;
	private FoodTruckService truckservice;
	
//	@RequestMapping(value = "", method = RequestMethod.GET)
//	public String mypage(Locale locale, Model model) {
//		return "customer/mypage";
//	}
	
	@ResponseBody
	@RequestMapping(value = "/onboard", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String onboard(@RequestBody Map<String,Object> map) {
		System.out.println("?");
		//String truck_code = (String)map.get("truck_code");
		String email = (String)map.get("email");
		System.out.println(email);
		System.out.println("d");
		//CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		//System.out.println(vo.getEmail());
		ArrayList<OnboardVO> result = new ArrayList<>();
		JSONArray data = new JSONArray();
		ArrayList<OnboardVO> ob = onboard.getOnboard(email);
		if (ob.size() != 0) {
			for (int i = 0; i < ob.size(); i++) {
				int e = ob.get(i).getOnboard_state();
				System.out.println(ob);
				System.out.println(e);
				if (e == 1) {
					result.add(ob.get(i));
				}
			}
			for(int i =0;i<result.size();i++) {
				System.out.println("?");
				JSONObject obj = new JSONObject();
				obj.put("brandname",result.get(i).getBrandname());
				obj.put("truck_url",result.get(i).getTruck_url());
				obj.put("onboard_date",result.get(i).getOnboard_date());
				obj.put("truck_code",result.get(i).getTruck_code());
				data.add(obj);
			}
		
		}
		//model.addAttribute("onboard", ob);
		/*
		 * ArrayList<OnboardVO> ob = onboard.getOnboard(vo.getEmail()); for(int i
		 * =0;i<ob.size();i++) { System.out.println(ob); }
		 * model.addAttribute("Onboard",ob);
		 * 
		 */
		System.out.println(data.toString());
		return data.toString();
		
	}
	@ResponseBody
	@RequestMapping(value = "/onSale", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String onSale(@RequestBody Map<String,Object> map) {
		//CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		
		String email = (String)map.get("email");
//		System.out.println(vo.getEmail());

		ArrayList<OnboardVO> sale = new ArrayList<OnboardVO>();
		ArrayList<OnboardVO> result = new ArrayList<>();
		sale = onboard.getOnboard(email);
		int length = sale.size();
		System.out.println(length);
//
		if (length != 0) {
			System.out.println("ㅇ");
			for (int i = 0; i < length; i++) {
				//String hours = sale.get(i).getHours();
				String start2 = sale.get(i).getTruck_starttime();
				String end2 = sale.get(i).getTruck_endtime();
				start2 = start2.replace(":", "");
				end2 = end2.replace(":", "");
				int start =  Integer.parseInt(start2);
				int end =  Integer.parseInt(end2);
				System.out.println(start);
				System.out.println("===");
				System.out.println(end);
				System.out.println("===");
				// int start_hour = Integer.parseInt(hours.substring(0, 2));
				// int end_hour = Integer.parseInt(hours.substring(3));
				// System.out.println(start_hour + " : " + end_hour);
				SimpleDateFormat date = new SimpleDateFormat("HHmm");
				// System.out.println(date);
				int sysdate = Integer.parseInt(date.format(System.currentTimeMillis()));
				System.out.println(sysdate);
				System.out.println("d");
				if (start <= sysdate && end >= sysdate && sale.get(i).getOnboard_state() == 1) {
					result.add(sale.get(i));
					System.out.println(sale.get(i).getBrandname());
					System.out.println("해당되나?");
				}
			}
			System.out.println(result.size());
			
		}
		
		
		JSONArray test = new JSONArray();
		if (result.size() != 0) {
			for(OnboardVO a : result) {
				JSONObject temp  = new JSONObject();
				temp.put("truck_code", a.getTruck_code());
				temp.put("brandname",a.getBrandname());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
				temp.put("onboard_date",a.getOnboard_date());
				temp.put("truck_url",a.getTruck_url());
				test.add(temp);
			}
			return test.toString();
			
		}else {
			//return email;
			return "fail";
		}

	}
	@ResponseBody
	@RequestMapping(value = "/review", produces = "application/text; charset=utf8")
	public String review(@RequestBody Map<String,Object> map) {
		String email=(String)map.get("email");
		ArrayList<MyreviewlistDTO> vo2 = truckservice.selectReview(email);
		JSONArray result = new JSONArray();
		result = JSONArray.fromObject(vo2);
		return result.toString();
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/callList", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String callList(@RequestBody Map<String,Object> map) {
		
		//CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
//		System.out.println(vo.getEmail());
		String email = (String)map.get("email");

		// System.out.println("z"+callList.getCallList2(vo.getEmail()));

		List<Map<String, Object>> list = callList.getCallList2(email);
		JSONArray arry = new JSONArray();
		for (Map<String, Object> a : list) {
			JSONObject data = new JSONObject();
			data.put("festival_name", a.get("FESTIVAL_NAME"));
			data.put("merchant_uid", a.get("MERCHANT_UID"));
			data.put("brandname", a.get("BRANDNAME"));
			data.put("festival_startdate", a.get("FESTIVAL_STARTDATE"));
			data.put("festival_enddate", a.get("FESTIVAL_ENDDATE"));
			data.put("progress", a.get("PROGRESS"));
			data.put("place", a.get("PLACE"));
			data.put("festival_endtime", a.get("FESTIVAL_ENDTIME"));
			data.put("festival_starttime", a.get("FESTIVAL_STARTTIME"));
			data.put("name", a.get("NAME"));
			data.put("pay_status", a.get("PAY_STATUS"));
			String request_date;
			try {
				request_date = new SimpleDateFormat("yyyy/MM/dd").format((Date)a.get("REQUEST_DATE"));
			}catch(Exception e) {
				e.printStackTrace();
				request_date="널값";
			}
			System.out.println(request_date);
			data.put("request_date", request_date);
			arry.add(data);
		}

		// System.out.println(list);
		System.out.println(arry);
		// ArrayList<CallListVO> cl = callList.getMyCallList(vo.getEmail());

//		for(int i = 0;i<cl.size();i++) {
//			System.out.println(cl);
//		}
//		
		//model.addAttribute("CallList2", arry);
		// model.addAttribute("CallList", cl);
		return arry.toString();
		 
	}
	
	@RequestMapping(value = "/cusInfo", method = RequestMethod.GET)
	public String cusInfo(Locale locale, Model model) {
		return "customer/cusInfo";
	}
	
	@RequestMapping(value = "/goodbyeForm", method = RequestMethod.GET)
	public String goodbyeForm(Locale locale, Model model) {
		return "customer/goodbyeForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertOnboard", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String insertOnboard(@RequestBody Map<String,Object> map) {
		String truckc = (String)map.get("truck_code");
		String email = (String)map.get("email");
		
		//CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		OnboardVO br = new OnboardVO();
		String ee = email;
		int i = 1;
		
		//String truckc = request.getParameter("truck_code");
		String sysd = (String)map.get("onboard_date");
		System.out.println(ee);
		System.out.println(truckc);
		System.out.println(sysd);
		br.setEmail(ee);
		br.setTruck_code(truckc);
		ArrayList<OnboardVO> dd = new ArrayList<OnboardVO>();
		System.out.println("1");
		dd = onboard.rideck(br);
		System.out.println("2");
		System.out.println(dd);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-mm-dd");
		//System.out.println(dd.size());
		
		if (dd.size()>=1) {
			System.out.println("3");
			if (dd.get(0).getOnboard_state() == 0) {
				System.out.println("4");
				try {
					transFormat.parse(sysd);
					System.out.println(transFormat.format(transFormat.parse(sysd)));

					Date test = Date.valueOf(transFormat.format(transFormat.parse(sysd)));
					br.setOnboard_date(transFormat.format(transFormat.parse(sysd)));
					System.out.println("넘어오나여?");
					System.out.println("넣어나여?");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int eee = 1;
				br.setEmail(ee);
				br.setTruck_code(truckc);
				br.setOnboard_state(eee);
				onboard.updateOnboarddate(br);
			}
		}else {
			System.out.println("5");
			try {
				transFormat.parse(sysd);
				System.out.println();
				System.out.println(transFormat.format(transFormat.parse(sysd)));

				Date test = Date.valueOf(transFormat.format(transFormat.parse(sysd)));
				br.setOnboard_date(transFormat.format(transFormat.parse(sysd)));
				System.out.println("넘어오나여?");
				System.out.println("넣어나여?");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("6");
			br.setOnboard_state(i);
			System.out.println("넣어나여?");
			onboard.insertOnboard(br);
			System.out.println("7");
			System.out.println("되라");
		}
		JSONObject ob = new JSONObject();
		return  ob.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/Deleteride", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String Deleteride(@RequestBody Map<String,Object> map) {
		System.out.println("Dddd");
		String truckcode = (String)map.get("truck_code");
		String email = (String)map.get("email");
		String sysd = (String)map.get("out_date");
		System.out.println(sysd);
		int i = 0;
		OnboardVO on = new OnboardVO();
		on.setEmail(email);
		on.setTruck_code(truckcode);
		on.setOnboard_state(i);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-mm-dd");

		try {
			transFormat.parse(sysd);
			Date test = Date.valueOf(transFormat.format(transFormat.parse(sysd)));
			on.setOut_date(test);
			System.out.println(test);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("DDDDDDDD");
		onboard.updateOutdate(on);
		JSONObject ob = new JSONObject();
		System.out.println("?D");
		return ob.toString();
	}	
	
	//회원탈퇴
	@RequestMapping(value = "/goodbye", method = RequestMethod.GET)
	public String goodbye(Locale locale, Model model,HttpServletRequest request) {
		CustomerVO c = new CustomerVO();
		c=(CustomerVO) request.getSession().getAttribute("sessionid");
		request.getSession().removeAttribute("sessionid");
		service.delete(c.getEmail());	
		return "customer/goodbye";
	}
}
