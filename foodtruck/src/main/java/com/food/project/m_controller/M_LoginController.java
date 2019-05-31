package com.food.project.m_controller;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.service.LoginService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.auth.UserRecord.CreateRequest;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@CrossOrigin()
@AllArgsConstructor
@Controller
@RequestMapping(value = "/m.login")
public class M_LoginController {
	private LoginService loginservice;
	
	
	@RequestMapping(value = "", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String loginCheck(@RequestBody Map<String,Object> map) {
		String email = (String)map.get("email");
		String password = (String)map.get("password");
		System.out.println(email+password);
		CustomerVO c = new CustomerVO();
		c = loginservice.getCustomer(email);
		JSONObject sessionInfo = new JSONObject();
		JSONObject userInfo = new JSONObject();
		JSONObject truckInfo = new JSONObject();
		
		//로그인 결과(아이디 불일치)
		if(c==null) {
			sessionInfo.put("result","idfail");
			return sessionInfo.toString();
			
		//로그인 결과(성공)
		}else if(password.equals(c.getPassword())){
			System.out.println(c.getEmail());
			System.out.println(c.getPassword());
			userInfo.put("email", email);
			userInfo.put("password",password);
			userInfo.put("nickname",c.getNickname());
			sessionInfo.put("user",userInfo);
			FoodTruckVO fd = new FoodTruckVO();
			fd = loginservice.getFoodTruck(email);
			
			
			//푸드트럭 정보가 없으면 그냥 사용자정보만 리턴
			if(fd == null){
				sessionInfo.put("result","success");
				return  sessionInfo.toString();
				
			//트럭정보가 있으면 트럭정보도 리턴
			}else {
				System.out.println(fd.toString());
				truckInfo.put("truck_code",fd.getTruck_code());
				sessionInfo.put("result","success");
				sessionInfo.put("foodtruck",truckInfo);
				System.out.println(truckInfo.toString());
				return sessionInfo.toString();
			}
			
		//로그인 결과(비밀번호 불일치)
		}else {
			sessionInfo.put("result","pwfail");
			return sessionInfo.toString();
		}	
	}

	@RequestMapping(value = "/idSearchck", method = RequestMethod.GET)
	@ResponseBody
	public String idSearchck(CustomerVO vo) {

		//데이터를 받아
		//받은데이터로 DB랑 검사
		//ajax -> LoginController.java ->  MemberService -> MemberServiceimplement.java - > MemberMapper.java-> MemberMapper.xml 
		//db쿼리 실행후 비교를하거나 결과값을 화면에 안뿌려준다면 여기서 끝 아니라면 다시 돌아감
		// MemberMapper.xml에서 실행한결과값을 들고 MemberMapper.java-> MemberSErviceimplement.java
		//-> MemberSErvice - > LoginController.java -> ajax 
		
		CustomerVO ck = loginservice.idSearch(vo);	
		if(ck == null) {
			return "false"; 
		}else {
			return ck.getEmail();
		}
		
	}

	/*
	 * @RequestMapping(value = "/idSearch1", method = RequestMethod.POST) public
	 * String idSearch1(Locale locale, Model model) { return "login/idSearch1"; }
	 */
	
	
	@RequestMapping(value = "/passSearchck", method = RequestMethod.POST)
	@ResponseBody
	public String passSearchck(CustomerVO vo) {
		CustomerVO ck = loginservice.passSearch(vo);
		 if (ck == null) {
			 return "false";
		 }else
			 return ck.getPassword();
				
	}

	@RequestMapping(value = "/idck", method = RequestMethod.GET)
	@ResponseBody
	public String idck(@RequestParam("email") String email,@RequestParam("nickname") String nickname,@RequestParam("telephone") String telephone) {
		System.out.println(email);
		CustomerVO mail = loginservice.getCustomer(email);
		CustomerVO name = loginservice.getName(nickname);
		CustomerVO phone=loginservice.getTelephone(telephone);
		if(mail == null) {	//이메일 같은게 없을때
			if(name == null && phone==null){ //닉네임 같은게 없을때
				return "success";
			} else if(name == null && phone!=null)
				return "telephone";
			return "nicname";
		}
			return "email";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insert(@RequestBody Map<String,Object> map) {
		FirebaseApp defaultApp = null;
		List<FirebaseApp> apps=FirebaseApp.getApps();
		FileInputStream serviceAccount;
		FirebaseOptions options=null;
		String email=(String)map.get("email");
		String password=(String)map.get("password");
		String nickname=(String)map.get("nickname");
		String telephone=(String)map.get("telephone");
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
		CreateRequest request=new CreateRequest()
				.setEmail(email)
				.setEmailVerified(false)
				.setPassword(password);
		try {
			UserRecord userRecord = FirebaseAuth.getInstance().createUser(request);
			System.out.println("Successfully created new user : " + userRecord.getUid());
		} catch (FirebaseAuthException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CustomerVO cus = new CustomerVO();
		cus.setEmail(email);
		cus.setPassword(password);
		cus.setNickname(nickname);
		cus.setTelephone(telephone);
		cus.setRegdate(new Date());
		loginservice.insertCustomer(cus);
		return "";
	}
}
