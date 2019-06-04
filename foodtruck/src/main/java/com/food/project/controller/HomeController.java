package com.food.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.food.project.domain.MainPageRankDTO;
import com.food.project.service.FoodTruckService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;

import lombok.AllArgsConstructor;
import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.SelfInjection.Split;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@AllArgsConstructor
@Controller
@CrossOrigin
public class HomeController {

	private FoodTruckService foodtruckService;
	static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
// rehome 
	@RequestMapping(value = "/rehome", method = RequestMethod.GET)
	public String rehome(Locale locale, Model model) {
//		model.addAttribute("content",main(model));
		return "redirect:/";
	}

// 硫붿씤
	@Autowired private ServletContext servletContext;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		FileInputStream serviceAccount;
//		try {
//			if(defaultApp==null) {
//				serviceAccount = new FileInputStream("Z:\\fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json");
//				FirebaseOptions options = new FirebaseOptions.Builder()
//						.setCredentials(GoogleCredentials.fromStream(serviceAccount))
//						.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/")
//						.build();
//				defaultApp = FirebaseApp.initializeApp(options);
//				logger.info("First"+defaultApp.getName());
//			}
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} catch (IllegalStateException e) {
//		}
//		
//
//		
		System.out.println(servletContext.getRealPath(""));
		System.out.println(servletContext.getContextPath());
		System.out.println(servletContext.getResourcePaths("/"));
		System.out.println("홈?");
		ArrayList<MainPageRankDTO> yj = new ArrayList<>();
		
		
		System.out.println("?");
		yj = foodtruckService.getRank();
		for(int i=0;i<yj.size();i++) {
			String a = yj.get(i).getTruck_url();
			String url[] = a.split("\\\\");
			
			String b = url[0];
			String c = url[1];
			String d = url[0]+"/"+url[1];
//			System.out.println(d);
			yj.get(i).setTruck_url(d);
			
		}
		
		System.out.println(yj);
		
		
		model.addAttribute("mainimage", yj);
		
		
		return "main/main";
	}
	@SuppressWarnings({ "null", "unused" })
	@ResponseBody
	@RequestMapping(value="/pushTest")
	public void pushTest(@RequestBody String param) throws IOException {
		URL url = new URL("https://fcm.googleapis.com/fcm/send");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setRequestProperty("Authorization", "key=AIzaSyCrjQEWIpLSI87l8bojvDGyPdI6nw2QoFw");
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        // 서버에서 날려서 한글 깨지는 사람은 아래처럼  UTF-8로 인코딩해서 날려주자
        os.write(param.getBytes("UTF-8"));
        os.flush();
        os.close();
        
        int responseCode = conn.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + param);
        System.out.println("Response Code : " + responseCode);
        conn.disconnect();
        
//		FirebaseApp defaultApp = null;
//		List<FirebaseApp> apps=FirebaseApp.getApps();
//		FileInputStream serviceAccount;
//		FirebaseOptions options=null;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
//		String path = request.getSession().getServletContext().getRealPath("/");
//		// 서버 올릴 때 경로
//		System.out.println(path);
//		String firebasePath = path.substring(0,47)+"src" + File.separator +"main"
//				+ File.separator +"webapp"+ File.separator + "resources" + File.separator + "json" + File.separator
//				+ "fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json";
//		//파이어베이스 옵션 설정
//		try {
//			serviceAccount = new FileInputStream(firebasePath);
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
//		String registrationToken="AIzaSyCrjQEWIpLSI87l8bojvDGyPdI6nw2QoFw";
//		Message message = Message.builder().putData("text",pushTxt).setToken(registrationToken).build();
//		try {
//			String response=FirebaseMessaging.getInstance().send(message);
//			System.out.println("Success : " + response);
//		} catch (FirebaseMessagingException e) {
//			System.out.println("Failed and the reason is behind");
//			e.printStackTrace();
//		}
//		defaultApp.delete();
	}
	
	@SuppressWarnings({ "null", "unused" })
	@ResponseBody
	@RequestMapping(value="/pushTest2")
	public void pushTest2(@RequestBody String param) throws IOException {
		URL url = new URL("https://fcm.googleapis.com/fcm/send");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setRequestProperty("Authorization", "key=AIzaSyCrjQEWIpLSI87l8bojvDGyPdI6nw2QoFw");
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        // 서버에서 날려서 한글 깨지는 사람은 아래처럼  UTF-8로 인코딩해서 날려주자
        os.write(param.getBytes("UTF-8"));
        os.flush();
        os.close();
        
        int responseCode = conn.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + param);
        System.out.println("Response Code : " + responseCode);
        conn.disconnect();
	}
}
