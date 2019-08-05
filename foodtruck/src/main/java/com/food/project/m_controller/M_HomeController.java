package com.food.project.m_controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.food.project.domain.MainPageRankDTO;
import com.food.project.service.FoodTruckService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@AllArgsConstructor
@Controller
@RequestMapping(value = "/m")
public class M_HomeController {
	private FoodTruckService foodtruckService;
	static final Logger logger = LoggerFactory.getLogger(M_HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "", produces = "application/text; charset=utf8" )
	public String appHome() {
		ArrayList<MainPageRankDTO> yj = new ArrayList<>();
		System.out.println("?");
		yj = foodtruckService.getRank();
		JSONArray jsarr = new JSONArray();
		for(int i=0;i<yj.size();i++) {
			String a = yj.get(i).getTruck_url();
			String url[] = a.split("\\\\");
			String b = url[0];
			String c = url[1];
			String d = url[0]+"/"+url[1];
			yj.get(i).setTruck_url(d);
			JSONObject jObj = new JSONObject();
			jObj.put("truck_code",yj.get(i).getTruck_code());
			jObj.put("rank",yj.get(i).getRank());
			jObj.put("truck_url",yj.get(i).getTruck_url());
			jObj.put("brandname",yj.get(i).getBrandname());
			jObj.put("score",yj.get(i).getScore());
			jsarr.add(jObj);
		}
		System.out.println("?");
		System.out.println(">>>" + jsarr.toString());
		return jsarr.toString();
	}

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/pushToken")
	public void token(@RequestBody String param) {
//		model.addAttribute("content",main(model));
		Map<String, Object> map = new HashMap<String, Object>();
		map = JSONObject.fromObject(param);
		String token = (String) map.get("token");
		System.out.println(">>>>>>>>>>" + map.toString());
		FirebaseApp defaultApp = null;
		List<FirebaseApp> apps = FirebaseApp.getApps();
		FileInputStream serviceAccount;
		FirebaseOptions options = null;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		String path = request.getSession().getServletContext().getRealPath("/");
		// 서버 올릴 때 경로
		String firebasePath = path + "resources" + File.separator + "firebase" + File.separator
				+ "fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json";
		String firebasePath2 = path.substring(0, 47) + "src" + File.separator + "main" + File.separator + "webapp"
				+ File.separator + "resources" + File.separator + "json" + File.separator
				+ "fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json";


		// 파이어베이스 옵션 설정
		try {
			serviceAccount = new FileInputStream(firebasePath);
			//serviceAccount = new FileInputStream(firebasePath2);
			options = new FirebaseOptions.Builder().setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/").build();
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 이미 관리자 defaultApp이 있는지 검사
		if (apps != null && !apps.isEmpty()) {
			for (FirebaseApp app : apps) {
				if (app.getName().equals(FirebaseApp.DEFAULT_APP_NAME))
					defaultApp = app;
			}
		} else {
			defaultApp = FirebaseApp.initializeApp(options);
		}
		DatabaseReference ref = FirebaseDatabase.getInstance().getReference("/FCMToken");
		ref.push().setValueAsync(token);
		defaultApp.delete();
	}
//	@SuppressWarnings({ "null", "unused" })
//	@ResponseBody
//	@RequestMapping(value="/pushTest")
//	public String pushTest(HttpSession session,@RequestParam("text") String text) {
//		FirebaseApp defaultApp = null;
//		List<FirebaseApp> apps=FirebaseApp.getApps();
//		FileInputStream serviceAccount;
//		FirebaseOptions options=null;
//		//파이어베이스 옵션 설정
//		try {
//			serviceAccount = new FileInputStream("C:\\fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json");
//			options = new FirebaseOptions.Builder()
//					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
//					.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/")
//					.build();
//		} catch (FileNotFoundException e1) {
//			e1.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		//이미 관리자 defaultApp이 있는지 검사
//		if(apps!=null && !apps.isEmpty()) {
//			for(FirebaseApp app:apps) {
//				if(app.getName().equals(FirebaseApp.DEFAULT_APP_NAME))
//					defaultApp = app;
//			}
//		}else {
//			defaultApp = FirebaseApp.initializeApp(options);
//		}
//		
//		//푸쉬 보내기
//		String registrationToken=(String)session.getAttribute("userToken");
//		Message message = Message.builder().putData("score","850").putData("text",text).setToken(registrationToken).build();
//		try {
//			String response=FirebaseMessaging.getInstance().send(message);
//			System.out.println("Success : " + response);
//		} catch (FirebaseMessagingException e) {
//			System.out.println("Failed and the reason is behind");
//			e.printStackTrace();
//		}
//		return "ok";
//	}
}
