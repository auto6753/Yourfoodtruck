package com.food.project.m_controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MenuVO;
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
@RequestMapping(value = "/m.seller")
public class M_SellerController {
	private SellerService sellerservice;
	
	@RequestMapping(value="/menu", method=RequestMethod.GET) 
	public String menu(Model model) {
		int menuNum = 17;
		
		model.addAttribute("menuNum", menuNum);
		return "seller/menu/menu";
	}
	
	@RequestMapping(value="/event", method=RequestMethod.GET) 
	public String event(Model model) {
		int onGoingEventNum = 5;
		int endEventNum = 13;
		
		model.addAttribute("onGoingEventNum", onGoingEventNum);
		model.addAttribute("endEventNum", endEventNum);
		return "seller/event/event";
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
}
