package com.food.project.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.MainPageRankDTO;
import com.food.project.service.FoodTruckService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;

import lombok.AllArgsConstructor;
import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.SelfInjection.Split;

/**
 * Handles requests for the application home page.
 */
@AllArgsConstructor
@Controller
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
	@ResponseBody
	@RequestMapping(value = "/pushToken", method = RequestMethod.POST)
	public String token(HttpServletRequest request) {
//		model.addAttribute("content",main(model));
		String token=request.getParameter("token");
		System.out.println(token);
		request.getSession().setAttribute("userToken",token);
		return "ok";
	}
	@SuppressWarnings({ "null", "unused" })
	@ResponseBody
	@RequestMapping(value="/pushTest")
	public String pushTest(HttpSession session,@RequestParam("text") String text) {
		FirebaseApp defaultApp = null;
		List<FirebaseApp> apps=FirebaseApp.getApps();
		FileInputStream serviceAccount;
		FirebaseOptions options=null;
		//파이어베이스 옵션 설정
		try {
			serviceAccount = new FileInputStream("C:\\fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json");
			options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/")
					.build();
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//이미 관리자 defaultApp이 있는지 검사
		if(apps!=null && !apps.isEmpty()) {
			for(FirebaseApp app:apps) {
				if(app.getName().equals(FirebaseApp.DEFAULT_APP_NAME))
					defaultApp = app;
			}
		}else {
			defaultApp = FirebaseApp.initializeApp(options);
		}
		
		//푸쉬 보내기
		String registrationToken=(String)session.getAttribute("userToken");
		Message message = Message.builder().putData("score","850").putData("text",text).setToken(registrationToken).build();
		try {
			String response=FirebaseMessaging.getInstance().send(message);
			System.out.println("Success : " + response);
		} catch (FirebaseMessagingException e) {
			System.out.println("Failed and the reason is behind");
			e.printStackTrace();
		}
		return "ok";
	}
}
