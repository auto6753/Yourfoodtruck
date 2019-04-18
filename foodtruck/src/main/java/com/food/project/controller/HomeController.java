package com.food.project.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {


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
		return "main/main";
	}
}
