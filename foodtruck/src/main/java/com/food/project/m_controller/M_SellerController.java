package com.food.project.m_controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.food.project.domain.MenuVO;
import com.food.project.service.FoodTruckService;
import com.food.project.service.SellerService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import lombok.AllArgsConstructor;

@CrossOrigin
@Controller
@AllArgsConstructor
@RequestMapping(value = "/m.seller")
public class M_SellerController {
	private SellerService sellerservice;
	private FoodTruckService truckservice;
	
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

	@SuppressWarnings({ "unchecked", "null" })
	@ResponseBody
	@RequestMapping(value="/seorder", produces = "application/text; charset=utf8") 
	public String seorder(@RequestBody String param) throws InterruptedException, IOException, FirebaseAuthException {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map = net.sf.json.JSONObject.fromObject(param);
		String email=(String)map.get("email");
		String uid;
		JSONObject resultObj = new JSONObject();
		FirebaseApp defaultApp = null;
		List<FirebaseApp> apps=FirebaseApp.getApps();
		FileInputStream serviceAccount;
		FirebaseOptions options=null;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		String path = request.getSession().getServletContext().getRealPath("/");
		// 서버 올릴 때 경로
		System.out.println(path);
		String firebasePath = path.substring(0,47)+"src" + File.separator +"main"
				+ File.separator +"webapp"+ File.separator + "resources" + File.separator + "json" + File.separator
				+ "fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json";
		serviceAccount = new FileInputStream(firebasePath);
		
		//이미 관리자 defaultApp이 있는지 검사
		if(apps!=null && !apps.isEmpty()) {
			for(FirebaseApp app:apps) {
				if(app.getName().equals(FirebaseApp.DEFAULT_APP_NAME))
					defaultApp = app;
			}
		}else {
			defaultApp=null;
			options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/")
					.build();
			defaultApp = FirebaseApp.initializeApp(options);
		}
		UserRecord userRecord;
		if(defaultApp!=null) {
			userRecord = FirebaseAuth.getInstance().getUserByEmail(email);
			uid=userRecord.getUid();
			DatabaseReference ref=FirebaseDatabase.getInstance().
				getReference("/PaymentTest2/"+userRecord.getUid());
			ref.limitToFirst(15).addListenerForSingleValueEvent(new ValueEventListener() {
				@Override
				public void onDataChange(DataSnapshot dataSnapshot) {
					List<Object> list = (List<Object>) dataSnapshot.getValue();
					System.out.println(list.toString());
				}
				@Override
				public void onCancelled(DatabaseError databaseError) {
					// ...
				}
			});
		}
		defaultApp.getApps().clear();
		defaultApp.delete();
		return resultObj.toString();
	}
	
	@RequestMapping(value="/cuorder", produces = "application/text; charset=utf8")
	@ResponseBody
	public String cuorder(@RequestBody String param) {
		Map<String,Object> paymentMap = new HashMap<String,Object>();
		paymentMap = net.sf.json.JSONObject.fromObject(param);
		String email = (String)paymentMap.get("email");
		String truck_code= truckservice.getFoodTruckE(email).getTruck_code();
		System.out.println(truck_code +"///" + email);
		ArrayList<MenuVO> menulist = new ArrayList<>();
		menulist = sellerservice.getmenu(truck_code);
		JSONArray a = new JSONArray();
		for(MenuVO vo : menulist) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("menu_code",vo.getMenu_code());
			jsonObj.put("menu_url",vo.getMenu_url());
			jsonObj.put("menu_surl",vo.getMenu_surl());
			jsonObj.put("menu_name",vo.getMenu_name());
			jsonObj.put("menu_category",vo.getMenu_category());
			jsonObj.put("unit_price",vo.getUnit_price());
			jsonObj.put("menu_desc",vo.getMenu_desc());
			jsonObj.put("truck_code",vo.getTruck_code());
			a.add(jsonObj);
		}
		System.out.println(a.toString()+"jsonArray잘나오나?");
		
		return a.toString();
	}
}
