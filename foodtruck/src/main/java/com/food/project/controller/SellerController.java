package com.food.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import java.io.File;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.EventMenuListVO;
import com.food.project.domain.EventMenuVO;
import com.food.project.domain.EventVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.LocationVO;
import com.food.project.domain.MenuSalesVO;
import com.food.project.domain.MenuVO;
import com.food.project.domain.PaymentVO;
import com.food.project.domain.UploadFileUtils;
import com.food.project.mapper.EventMapper;
import com.food.project.mapper.SellerMapper;
import com.food.project.service.CallListService;
import com.food.project.service.EventService;
import com.food.project.service.FoodTruckService;
import com.food.project.service.PaymentService;
import com.food.project.service.SellerService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import lombok.AllArgsConstructor;
import oracle.sql.DATE;
import net.sf.json.JSONArray;


@Controller
@AllArgsConstructor
@RequestMapping(value = "/seller")
public class SellerController {
	private SellerService sellerservice;
	private EventService eventService;
	private CallListService callService;
	private FoodTruckService truckService;
	private PaymentService paymentService;
	private EventMapper eventmapper;
	//private SellerMapper sellermapper;
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	@Resource(name = "uploadPath")
	String uploadPath;
	
	@RequestMapping(value="", method=RequestMethod.GET) 
	public String sellerMain(Model model, HttpSession session) {
		return "seller/sellerMain";
	}
	
	@RequestMapping(value="/mngSales", method=RequestMethod.GET) 
	public String mngSales(Model model, HttpSession session, HttpServletRequest request) {
		// 매출 쿼리를 위해 매개변수로 사용할 truck_code 값
		FoodTruckVO vo = (FoodTruckVO) session.getAttribute("seller");
		String truck_code = vo.getTruck_code();
		
//		String inputYear = request.getParameter("inputYear"); // 연도 값
//		String inputMonth = request.getParameter("inputMonth"); // 월 값
//		String inputFirstDate = request.getParameter("inputFirstDate"); // 사용자 지정 시작 날짜
//		String inputLastDate = request.getParameter("inputLastDate"); //  사용자 지정 마지막 날짜
//		String inputFirstYear = request.getParameter("inputFirstYear"); // 사용자 지정 시작 연도
//		String inputLastYear = request.getParameter("inputLastYear"); //  사용자 지정 마지막 연도
		String inputYear = "19";
		String inputMonth = "05";
		String inputFirstDate = "16-05-17";
		String inputLastDate = "20-05-20";
		String inputFirstYear = "2017";
		String inputLastYear = "2019";
		
		String curYear2; // 현재 연도(2자리)
		String curYear4; // 현재 연도(4자리)
		String curMonth; // 현재 월
		
		ArrayList<PaymentVO> todaySales = new ArrayList<>(); // 금일 매출 쿼리 결과를 담을 ArrayList
		ArrayList<PaymentVO> monthSales = new ArrayList<>(); // 월간 매출 쿼리 결과를 담을 ArrayList
		ArrayList<PaymentVO> yearSales = new ArrayList<>(); // 연간 매출 쿼리 결과를 담을 ArrayList
		ArrayList<PaymentVO> weekSales = new ArrayList<>(); // 주간 매출 쿼리 결과를 담을 ArrayList
		ArrayList<PaymentVO> selPeriodSales = new ArrayList<>(); // 선택된 기간 내 매출 쿼리 결과를 담을 ArrayList
		Map<String, ArrayList<PaymentVO>> byDaySalesMap = new HashMap<>(); // 요일별 매출 쿼리 결과가 담긴 각 ArrayList를 담을 Map
		Map<Integer, ArrayList<PaymentVO>> byTimeSalesMap = new HashMap<>(); // 선택된 기간 내 시간별 매출 쿼리 결과가 담긴 각 ArrayList를 담을 Map
		
		curYear2 = paymentService.getCurYear2(); // 현재 연도 쿼리 후 결과를 curYear2에 추가
		curYear4 = paymentService.getCurYear4(); // 현재 연도 쿼리 후 결과를 curYear4에 추가
		curMonth = paymentService.getCurMonth(); // 현재 월 쿼리 후 결과를 curMonth에 추가
		
		todaySales = paymentService.getTodaySales(truck_code); // 금일 매출 쿼리 후 결과를 todaySales에 추가
		weekSales = paymentService.getWeekSales(truck_code); // 주간 매출 쿼리 후 결과를 weekSales에 추가
		monthSales = paymentService.getMonthSales(truck_code, inputYear, inputMonth); // 월간 매출 쿼리 후 결과를 monthSales에 추가
		yearSales = paymentService.getYearSales(truck_code, inputYear); // 연간 매출 쿼리 후 결과를 yearSales에 추가
		selPeriodSales = paymentService.getSelPeriodSales(truck_code, inputFirstDate, inputLastDate); // 선택된 기간 내 매출 쿼리 후 결과를 selPeriodSales에 추가
		
		String[] days = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"}; // Map의 Key
		for(int day=1; day<=7; day++) {
			ArrayList<PaymentVO> byDaySales = new ArrayList<>(); // 요일별 매출 쿼리 결과를 담을 ArrayList
			byDaySales = paymentService.getByDaySales(truck_code, inputFirstYear, inputLastYear, day); // 요일별 매출 쿼리 후 결과를 byDaySales에 추가
			byDaySalesMap.put(days[day-1], byDaySales); // 요일별 매출 쿼리 결과가 담긴 각 ArrayList를 Map에 추가
		}
		
		for(int hour=0; hour<24; hour++) {
			ArrayList<PaymentVO> byTimeSales = new ArrayList<>(); // 선택된 기간 내 시간별 매출 쿼리 결과를 담을 ArrayList
			byTimeSales = paymentService.getByTimeSales(truck_code, inputFirstDate, inputLastDate, hour); // 선택된 기간 내 시간별 매출 쿼리 후 결과를 byTimeSales에 추가
			byTimeSalesMap.put(hour, byTimeSales); // 선택된 기간 내 시간별 매출 쿼리 결과가 담긴 각 ArrayList를 Map에 추가
		}
		
		model.addAttribute("curYear2", curYear2);
		model.addAttribute("curYear4", curYear4);
		model.addAttribute("curMonth", curMonth);
		
		model.addAttribute("todaySales", todaySales);
		model.addAttribute("weekSales", weekSales);
		model.addAttribute("monthSales", monthSales);
		model.addAttribute("yearSales", yearSales);
		model.addAttribute("selPeriodSales", selPeriodSales);
		
//		System.out.println(todaySales);
//		System.out.println(weekSales);
//		System.out.println(monthSales);
//		System.out.println(yearSales.get(0));
//		System.out.println(selPeriodSales);
//		System.out.println("아래부터는 요일별 매출 쿼리 결과");
//		System.out.println(byDaySalesMap.get("Sun"));
//		System.out.println(byDaySalesMap.get("Mon"));
//		System.out.println(byDaySalesMap.get("Tue"));
//		System.out.println(byDaySalesMap.get("Wed"));
//		System.out.println(byDaySalesMap.get("Thu"));
//		System.out.println(byDaySalesMap.get("Fri"));
//		System.out.println(byDaySalesMap.get("Sat"));
//		for(int i=0; i<24; i++) {
//			System.out.println(i + "시: " + byTimeSalesMap.get(i));
//		}
		
		return "seller/mngSales/mngSales";
	}
	
	@RequestMapping(value="/salesInfo", method=RequestMethod.GET)
	public String salesInfo(Model model, HttpSession session, HttpServletRequest request) {
		String pageName = request.getParameter("pageName");
		
		// 매출 쿼리를 위해 매개변수로 사용할 truck_code 값
		FoodTruckVO vo = (FoodTruckVO) session.getAttribute("seller");
		String truck_code = vo.getTruck_code();
		
		switch(pageName) {
		case "todaySales":
			ArrayList<PaymentVO> todaySales = new ArrayList<>(); // 금일 매출 쿼리 결과를 담을 ArrayList
			todaySales = paymentService.getTodaySales(truck_code); // 금일 매출 쿼리 후 결과를 todaySales에 추가
			int mKakaoSales = 0, nKakaoSales = 0; // 카카오페이 매출액(회원, 비회원)
			int totalKakaoSales = 0; // 카카오페이 매출총액(회원 + 비회원)
			int mCashSales = 0, nCashSales = 0; // 현금 매출액(회원, 비회원)
			int totalCashSales = 0; // 현금 매출총액(회원 + 비회원)
			int mCardSales = 0, nCardSales = 0; // 카드 매출액(회원, 비회원)
			int totalCardSales = 0; // 카드 매출총액(회원 + 비회원)
			int mTotalSales = 0, nTotalSales = 0; // 총 매출액(회원, 비회원)
			int totalSales = 0; // 총 매출액(회원 + 비회원)
			
			String telephone = null; // payment 테이블의 payment_telephone 컬럼 값
			String isMember = null; // 회원 조회 값
			
			HashSet<String> menuCodes = new HashSet<>();
			ArrayList<MenuSalesVO> menuSales = new ArrayList<>();
			
			for(int i=0; i<todaySales.size(); i++) {
				switch(todaySales.get(i).getPayment_class()) {
				case 3: // 카카오페이
					telephone = todaySales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) { // 회원 조회 값이 있으면(= 회원이면)
						mKakaoSales = mKakaoSales + todaySales.get(i).getTotal_price();
					} else { // 회원 조회 값이 없으면(= 비회원이면)
						nKakaoSales = nKakaoSales + todaySales.get(i).getTotal_price();
					}
					break;
				case 4: // 현금
					telephone = todaySales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCashSales = mCashSales + todaySales.get(i).getTotal_price();
					} else {
						nCashSales = nCashSales + todaySales.get(i).getTotal_price();
					}
					break;
				case 5: // 카드
					telephone = todaySales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCardSales = mCardSales + todaySales.get(i).getTotal_price();
					} else {
						nCardSales = nCardSales + todaySales.get(i).getTotal_price();
					}
					break;
					default:
				}
				
				String menu_code = todaySales.get(i).getMenu_code();
				String menu_name = todaySales.get(i).getMenu_name();
				
				if(menu_code == null) { todaySales.get(i).setMenu_code("999999999"); }
				if(menu_name == null) { todaySales.get(i).setMenu_name("(삭제된 메뉴)"); }
				
				if(menuCodes.add(todaySales.get(i).getMenu_code())) {
					MenuSalesVO temp = new MenuSalesVO();
					temp.setMenu_code(todaySales.get(i).getMenu_code());
					temp.setMenu_name(todaySales.get(i).getMenu_name());
					temp.setAmount(todaySales.get(i).getAmount());
					temp.setTotalPrice(todaySales.get(i).getTotal_price());
					temp.setUnitPrice(todaySales.get(i).getTotal_price() / todaySales.get(i).getAmount());
					menuSales.add(temp);
				} else {
					for(int j=0; j<menuSales.size(); j++) {
						if(menuSales.get(j).getMenu_code().equals(todaySales.get(i).getMenu_code())) {
							menuSales.get(j).add(todaySales.get(i).getAmount(),todaySales.get(i).getTotal_price());
						}
					}
				}
			}
			System.out.println("menuSales: " + menuSales);

			mTotalSales = mKakaoSales + mCashSales + mCardSales;
			nTotalSales = nKakaoSales + nCashSales + nCardSales;
			totalSales = mTotalSales + nTotalSales;
			
			totalCashSales = mCashSales + nCashSales;
			totalCardSales = mCardSales + nCardSales;
			totalKakaoSales = mKakaoSales + nKakaoSales;
			
			model.addAttribute("mKakaoSales", mKakaoSales);
			model.addAttribute("mCashSales", mCashSales);
			model.addAttribute("mCardSales", mCardSales);
			model.addAttribute("mTotalSales", mTotalSales);
			
			model.addAttribute("nKakaoSales", nKakaoSales);
			model.addAttribute("nCashSales", nCashSales);
			model.addAttribute("nCardSales", nCardSales);
			model.addAttribute("nTotalSales", nTotalSales);
			
			model.addAttribute("totalCashSales", totalCashSales);
			model.addAttribute("totalCardSales", totalCardSales);
			model.addAttribute("totalKakaoSales", totalKakaoSales);
			
			model.addAttribute("totalSales", totalSales);
			
			return "seller/mngSales/todaySales";
		case "weekSales":
			return "seller/mngSales/weekSales";
		case "monthSales":
			return "seller/mngSales/monthSales";
		case "yearSales":
			return "seller/mngSales/yearSales";
		case "byDaySales":
			return "seller/mngSales/byDaySales";
		case "byTimeSales":
			return "seller/mngSales/byTimeSales";
			default:
				return "seller/mngSales/mngSales";
		}
	}
	
	@RequestMapping(value="/menu", method=RequestMethod.GET) 
	public String menu(Model model, HttpSession session) {
		//int menuNum = 17;
		FoodTruckVO vo =(FoodTruckVO)session.getAttribute("seller");
		model.addAttribute("menuNum", sellerservice.getmenu(vo.getTruck_code()));
		return "seller/menu/menu";
	}
	
	@RequestMapping(value="/addMenu", method=RequestMethod.GET) 
	public String addMenu(Model model) {
		return "seller/menu/addMenu";
	}
	@RequestMapping(value="/infoModify", method=RequestMethod.GET) 
	public String infoModify(Model model) {
		return "seller/truckinfo/truckinfo";
	}
	
	@RequestMapping(value="/editMenu", method=RequestMethod.GET) 
	public String editMenu(Model model) {
		return "seller/menu/editMenu";
	}
	
	@ResponseBody
	@RequestMapping(value="/delMenuMenu", method=RequestMethod.POST) 
	public String delMenu(Model model,@RequestBody String param) {
		//System.out.println(menu_codes);
		List<Map<String,Object>> paymentMap = new ArrayList<Map<String,Object>>();
	    paymentMap = JSONArray.fromObject(param);
		System.out.println(paymentMap.size());
		for(int i =0;i<paymentMap.size();i++) {
			String menu_code = (String) paymentMap.get(i).get("menu_code");
			String url = uploadPath +(String) paymentMap.get(i).get("url");
			String surl = uploadPath + (String) paymentMap.get(i).get("surl");
			System.out.println(menu_code);
			System.out.println(url);
			System.out.println(surl);
			sellerservice.deletemenu(menu_code);
			File file = new File(url);
			if (file.exists()) { // 파일존재여부확인
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				} else {
					System.out.println("파일삭제 실패");
				}

			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			
			File sfile = new File(surl);
			if (sfile.exists()) { // 파일존재여부확인
				if (sfile.delete()) {
					System.out.println("success");
				} else {
					System.out.println("fail");
				}

			} else {
				System.out.println("undefine");
			}
			
		}
//		System.out.println("z");
		return "z";
	}
  
	@RequestMapping(value="/location", method=RequestMethod.GET) 
	public String location(Model model) {
		return "seller/loc/location";
	}
	@RequestMapping(value="/location", method=RequestMethod.POST) 
	public String location2(Model model, LocationVO vo) {
		
		sellerservice.insertlocaction(vo);
		System.out.println(vo);
		
		//vo.setLoc_time(Timestamp.valueOf(DATE.getCurrentDate()));
		return "seller/loc/location";
	}
	
	@RequestMapping(value="/jusoPopup", method= {RequestMethod.GET, RequestMethod.POST}) 
	public String jusoPopup(Model model) {
		return "seller/loc/jusoPopup";
	}
	
	@RequestMapping(value="/event", method=RequestMethod.GET) 
	public String eventGet(Model model, HttpSession session, HttpServletRequest request) {
		FoodTruckVO foodtruckvo = (FoodTruckVO) session.getAttribute("seller");
		String truckCode = foodtruckvo.getTruck_code();
		
		ArrayList<EventMenuVO> test = new ArrayList<>();
		test = eventService.getEventMenu(truckCode);
		ArrayList<EventMenuListVO> eventMenuList = new ArrayList<>();
		HashSet<String> eventCode = new HashSet<>();
		
		
		for(int i=0; i<test.size(); i++) {
			
			if(eventCode.add(test.get(i).getEvent_code())) {
				EventMenuListVO vo = new EventMenuListVO();
				vo.setEvent_code(test.get(i).getEvent_code());
				vo.addMenu(test.get(i).getMenu_name(), test.get(i).getDiscount());
				eventMenuList.add(vo);
		
			} else {
				for(int j=0; j<eventMenuList.size(); j++) {
					if(eventMenuList.get(j).getEvent_code().equals(test.get(i).getEvent_code())) {
						eventMenuList.get(j).addMenu(test.get(i).getMenu_name(), test.get(i).getDiscount());
					}
				}
			}
		}
		
		ArrayList<EventVO> eventList = eventService.getEvent(truckCode);
		
		long curTime = System.currentTimeMillis();
		
		ArrayList<Long> eventEndLong = new ArrayList<>();
		
		for(int i=0; i<eventList.size(); i++) {
			eventEndLong.add(eventList.get(i).getEvent_end().getTime());	
		}
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("menuList", sellerservice.getmenu(truckCode));
		model.addAttribute("eventMenuList", eventMenuList);
		model.addAttribute("eventEndLong", eventEndLong);
		model.addAttribute("curTime", curTime);
		
		return "seller/event/event";
	}
	
	@RequestMapping(value="/event", method=RequestMethod.POST)
	@ResponseBody
	public String eventPost(Model model, HttpServletRequest request,MultipartFile file) throws IOException, Exception {
		FoodTruckVO foodtruckvo = (FoodTruckVO) request.getSession().getAttribute("seller");
		String truckCode = foodtruckvo.getTruck_code();
		
		CustomerVO e = (CustomerVO) request.getSession().getAttribute("sessionid");
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		FoodTruckVO vo4 = new FoodTruckVO();
		String em = e.getEmail()+"/event";
		vo4.setEmail(em);
		//vo4.setEmail();
		
		ResponseEntity<String> upload = new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), vo4),
				HttpStatus.OK);
		String str = upload.getBody();
		String[] array = str.split("\\\\");
		System.out.println(array[0]);
		System.out.println(array[1]);
		System.out.println(array[0] + "\\" + array[1].substring(2));
		
		EventVO evo = new EventVO();
		evo.setTruck_code(truckCode);
		evo.setEvent_name(request.getParameter("event_name"));
		String event_start=request.getParameter("event_start");
		String event_end=request.getParameter("event_end");
		Long longdata=Long.parseLong(event_start);
		evo.setEvent_start(new Date(longdata));
		longdata=Long.parseLong(event_end);
		evo.setEvent_end(new Date(longdata));
		evo.setEvent_target(request.getParameter("event_target"));
		evo.setEvent_content(request.getParameter("event_content"));
		evo.setEvent_payment(Integer.parseInt(request.getParameter("event_payment")));
		evo.setEvent_combinable(Integer.parseInt(request.getParameter("event_combinable")));
		evo.setEvent_url(array[0] + "\\" + array[1].substring(2));
		ArrayList<EventMenuVO> emvos = new ArrayList<>();
		System.out.println(event_start);
		System.out.println(event_end);
		
		String[] menuCode1 = request.getParameterValues("menuCode[]"); // 메뉴코드
		String[] discount1 = request.getParameterValues("discount[]"); // 할인액
		
		String menuCode2 = menuCode1[0];
		String discount2 = discount1[0];
		String[] menuCode = menuCode2.split(",");
		String[] discount = discount2.split(",");
//		System.out.println(menuCode[0]);
//		System.out.println(discount[0]);
		System.out.println("?");
		
		for(int i=0; i<menuCode.length; i++) {
			System.out.println("??");
			EventMenuVO emvo = new EventMenuVO();
			emvo.setMenu_code(menuCode[i]);
			emvo.setDiscount(Integer.parseInt(discount[i]));
			emvos.add(emvo);
		}
		System.out.println("???");
		Map<String, Object> mapvo = new HashMap<>();
		
		mapvo.put("event", evo);
		mapvo.put("eventMenu", emvos);
		mapvo.put("truck_code",evo.getTruck_code());
		//mapvo.put("event_url",)
		System.out.println("????");
		eventService.addEvent(mapvo);
		
		return "success";
	}
	
	@RequestMapping(value="/delEvent", method=RequestMethod.POST)
	@ResponseBody
	public String delEvent(Model model, HttpServletRequest request) {
		String eventCode = request.getParameter("eventCode");
		
		
		EventVO ev = eventmapper.getEvent1_code(eventCode);
		String url = uploadPath+ev.getEvent_url();
		String surl = url.replace("/event\\", "/event\\s_");
		System.out.println(url);
		System.out.println(surl);
		File file = new File(url);
		if (file.exists()) { // 파일존재여부확인
			if (file.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}

		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		
		File sfile = new File(surl);
		if (sfile.exists()) { // 파일존재여부확인
			if (sfile.delete()) {
				System.out.println("success");
			} else {
				System.out.println("fail");
			}

		} else {
			System.out.println("undefine");
		}
		
		eventService.deleteEventMenu(eventCode);
		eventService.deleteEvent(eventCode);
		
		return "success";
	}
	
	@RequestMapping(value="/editEvent", method=RequestMethod.POST)
	@ResponseBody
	public String editEvent(Model model, HttpServletRequest request) {
		String eventCode = request.getParameter("eventCode");

//		eventService.getEventForEdit(eventCode);
		return "success";
	}
	
	
	@RequestMapping(value="/addEvent", method=RequestMethod.GET) 
	public String addEvent(Model model) {
		return "seller/event/addEvent";
	}
	
	@RequestMapping(value="/addEvent2", method=RequestMethod.GET) 
	public String addEvent2(Model model) {
		return "seller/event/addEvent2";
	}
	
	@RequestMapping(value="/psgpush", method=RequestMethod.GET) 
	public String passenger(Model model,HttpSession session) {
		FirebaseApp defaultApp = null;
		CustomerVO vo=new CustomerVO();
		vo=(CustomerVO) session.getAttribute("sessionid");
		String email=vo.getEmail();
		FileInputStream serviceAccount;
		try {
			if(defaultApp==null) {
				serviceAccount = new FileInputStream("C:\\fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json");
				FirebaseOptions options = new FirebaseOptions.Builder()
						.setCredentials(GoogleCredentials.fromStream(serviceAccount))
						.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/")
						.build();
				defaultApp = FirebaseApp.initializeApp(options);
				UserRecord userRecord=FirebaseAuth.getInstance().getUserByEmail(email);
				model.addAttribute("_uid",userRecord.getUid());
				defaultApp.delete();
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (FirebaseAuthException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "seller/psg/psgpush";
	}
	
	@RequestMapping(value="/callmanage", method=RequestMethod.GET) 
	public String call(Model model,HttpSession session) {
		FoodTruckVO vo = (FoodTruckVO)session.getAttribute("seller");
		model.addAttribute("callList", callService.getCallList(vo.getTruck_code()));
		return "seller/call/callmanage";
	}
	
	@RequestMapping(value="/order", method=RequestMethod.GET) 
	public String order(Model model) {
		return "seller/order/orderMain";
	}
	
	@RequestMapping(value="/layout", method=RequestMethod.GET) 
	public String layout(Model model) {
		return "seller/layout/layout";
	}
	
	@RequestMapping(value="/side", method=RequestMethod.GET) 
	public String side(Model model) {
		return "seller/sideMenuBar/sideMenuBar";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/seorder", method=RequestMethod.GET) 
	public String seorder(Model model, HttpSession session) {
		FirebaseApp defaultApp = null;
		CustomerVO vo=new CustomerVO();
		vo=(CustomerVO) session.getAttribute("sessionid");
		String email=vo.getEmail();
		FileInputStream serviceAccount;
		try {
			if(defaultApp==null) {
				serviceAccount = new FileInputStream("C:\\fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json");
				FirebaseOptions options = new FirebaseOptions.Builder()
						.setCredentials(GoogleCredentials.fromStream(serviceAccount))
						.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/")
						.build();
				defaultApp = FirebaseApp.initializeApp(options);
				UserRecord userRecord=FirebaseAuth.getInstance().getUserByEmail(email);
				model.addAttribute("_uid",userRecord.getUid());
				defaultApp.delete();
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (FirebaseAuthException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "seller/order/seorder";
	}
	
	@RequestMapping(value="/cuorder", method=RequestMethod.GET) 
	public String cuorder(Model model,HttpServletRequest request,HttpSession session) {
		FoodTruckVO vo = new FoodTruckVO();
		vo = (FoodTruckVO) request.getSession().getAttribute("seller");
		String truckcode = vo.getTruck_code();
		ArrayList<MenuVO> menulist = new ArrayList<>();
		menulist = sellerservice.getmenu(truckcode);
		model.addAttribute("menulist", menulist);
		model.addAttribute("orderTarget","customer");
//		CustomerVO cvo=(CustomerVO)request.getSession().getAttribute("sessionid");
//		String email=cvo.getEmail();
//		UserRecord userRecord;
//		try {
//			userRecord = FirebaseAuth.getInstance().getUserByEmail(email);
//			// See the UserRecord reference doc for the contents of userRecord.
//			System.out.println("Successfully fetched user data in cuorder: " + userRecord.getEmail());
//			DatabaseReference ref=FirebaseDatabase.getInstance().getReference("/PaymentTest2/"+userRecord.getUid());
//			ref.addChildEventListener(new ChildEventListener() {
//				@Override
//				public void onChildAdded(DataSnapshot snapshot, String previousChildName) {
//					JSONObject test = (JSONObject) snapshot.getValue();
//					model.addAttribute("test",test);
//				}
//				@Override
//				public void onChildChanged(DataSnapshot snapshot, String previousChildName) {}
//				@Override
//				public void onChildRemoved(DataSnapshot snapshot) {}
//				@Override
//				public void onChildMoved(DataSnapshot snapshot, String previousChildName) {}
//				@Override
//				public void onCancelled(DatabaseError error) {}
//			});
//		} catch (FirebaseAuthException e) {
//			e.printStackTrace();
//		}
		return "seller/order/cuorder";
	}
	
	@RequestMapping(value="/truckinfo", method=RequestMethod.GET) 
	public String truckinfo(Model model , HttpSession session) {
		
		FoodTruckVO vo = (FoodTruckVO)session.getAttribute("seller");
		
		String kk = vo.getTruck_code();
		
		FoodTruckVO vo2 = truckService.getFoodTruck(kk);//=앞에 변수 담는거
		
		
		model.addAttribute("truckinfo" ,vo2);
		
		return "seller/truckinfo/truckinfo";
	}
	@RequestMapping(value="/truckinfomodify", method=RequestMethod.POST) 
	public String truckinfomodify(Model model ,HttpServletRequest request, FoodTruckVO vo ) {
		

		String[] pay = request.getParameterValues("paytype");//truckinfo.jsp에 있는 체크박스 value가 paytype인걸을 배열로 묶는것
		int sum = 0;
		
		for(int i=0; i<pay.length; i++) {
			
			sum += Integer.parseInt(pay[i]);
		}
		vo.setPaytype(sum);
		
		truckService.updateTruckinfo(vo);
		return "redirect:/seller";
		
		
	
}
}
