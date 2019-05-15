package com.food.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.EventMenuListVO;
import com.food.project.domain.EventMenuVO;
import com.food.project.domain.EventVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MenuVO;
import com.food.project.service.EventService;
import com.food.project.service.SellerService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/seller")
public class SellerController {
	private SellerService sellerservice;
	private EventService eventService;

	@RequestMapping(value="", method=RequestMethod.GET) 
	public String sellerMain(Model model) {
		return "seller/sellerMain";
	}
	
	@RequestMapping(value="/menu", method=RequestMethod.GET) 
	public String menu(Model model,HttpSession session) {
		//int menuNum = 17;
		FoodTruckVO vo =(FoodTruckVO)session.getAttribute("seller");
		model.addAttribute("menuNum", sellerservice.getmenu(vo.getTruck_code()));
		return "seller/menu/menu";
	}
	
	@RequestMapping(value="/addMenu", method=RequestMethod.GET) 
	public String addMenu(Model model) {
		return "seller/menu/addMenu";
	}
	
	@RequestMapping(value="/editMenu", method=RequestMethod.GET) 
	public String editMenu(Model model) {
		return "seller/menu/editMenu";
	}
  
	@RequestMapping(value="/location", method=RequestMethod.GET) 
	public String location(Model model) {
		return "seller/loc/location";
	}
	
	@RequestMapping(value="/jusoPopup", method=RequestMethod.POST) 
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
			System.out.println(eventMenuList);
		}
		
		model.addAttribute("eventList", eventService.getEvent(truckCode));
		model.addAttribute("menuList", sellerservice.getmenu(truckCode));
		model.addAttribute("eventMenuList", eventMenuList);
		
		return "seller/event/event";
	}
	
	@RequestMapping(value="/event", method=RequestMethod.POST)
	@ResponseBody
	public String eventPost(Model model, HttpServletRequest request) {
		FoodTruckVO foodtruckvo = (FoodTruckVO) request.getSession().getAttribute("seller");
		String truckCode = foodtruckvo.getTruck_code();
		
		EventVO evo = new EventVO();
		evo.setTruck_code(truckCode);
		evo.setEvent_name(request.getParameter("event_name"));
		String event_start=request.getParameter("event_start");
		String event_end=request.getParameter("event_end");
		System.out.println(event_start +", "+ event_end);
		Long longdata=Long.parseLong(event_start);
		evo.setEvent_start(new Date(longdata));
		longdata=Long.parseLong(event_end);
		evo.setEvent_end(new Date(longdata));
		evo.setEvent_target(request.getParameter("event_target"));
		evo.setEvent_content(request.getParameter("event_content"));
		evo.setEvent_payment(Integer.parseInt(request.getParameter("event_payment")));
		evo.setEvent_combinable(Integer.parseInt(request.getParameter("event_combinable")));
		
		ArrayList<EventMenuVO> emvos = new ArrayList<>();
		
		String[] menuCode = request.getParameterValues("menuCode[]"); // 메뉴코드
		String[] discount = request.getParameterValues("discount[]"); // 할인액
		
		for(int i=0; menuCode.length>i; i++) {
			EventMenuVO emvo = new EventMenuVO();
			emvo.setMenu_code(menuCode[i]);
			emvo.setDiscount(Integer.parseInt(discount[i]));
			emvos.add(emvo);
		}
		System.out.println(evo.getTruck_code());
		Map<String, Object> mapvo = new HashMap<>();
		mapvo.put("event", evo);
		mapvo.put("eventMenu", emvos);
		mapvo.put("truck_code",evo.getTruck_code());
		eventService.addEvent(mapvo);
		
		return "success";
	}
	
	@RequestMapping(value="/delEvent", method=RequestMethod.POST)
	@ResponseBody
	public String delEvent(Model model, HttpServletRequest request) {
		String eventCode = request.getParameter("eventCode");
		eventService.deleteEventMenu(eventCode);
		eventService.deleteEvent(eventCode);
		
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
				System.out.println("First"+defaultApp.getName());
				UserRecord userRecord=FirebaseAuth.getInstance().getUserByEmail(email);
				System.out.println(userRecord.getUid());
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
	public String call(Model model) {
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
				System.out.println("First"+defaultApp.getName());
				UserRecord userRecord=FirebaseAuth.getInstance().getUserByEmail(email);
				System.out.println(userRecord.getUid());
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
		System.out.println(truckcode);
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
	public String truckinfo(Model model) {
		return "seller/truckinfo/truckinfo";
	}
}
