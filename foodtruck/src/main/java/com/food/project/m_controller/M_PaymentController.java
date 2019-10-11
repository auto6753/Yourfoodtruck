package com.food.project.m_controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import net.sf.json.*;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.food.project.domain.CallListVO;
import com.food.project.domain.PaymentVO;
import com.food.project.mapper.CallListMapper;
import com.food.project.service.PaymentService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import lombok.AllArgsConstructor;

@CrossOrigin
@Controller
@AllArgsConstructor
@RequestMapping(value="/m.pay")
public class M_PaymentController {
	private CallListMapper mapper;
	private PaymentService payService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insertPayment", produces = "application/text; charset=utf8")
	@ResponseBody
	public void payment(@RequestBody String param) {
		List<Map<String,Object>> paymentMap = new ArrayList<Map<String,Object>>();
		paymentMap = JSONArray.fromObject(param);
		System.out.println(paymentMap);
		int a=payService.insertPaymentList(paymentMap);
		if(a==0) System.out.println("Error");
		else System.out.println("Success");
	}
	@RequestMapping(value="/insertOrder",method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertOrder(@RequestBody String param) throws FileNotFoundException {
		List<Map<String,Object>> paymentMap = new ArrayList<Map<String,Object>>();
		paymentMap = JSONArray.fromObject(param);
		System.out.println(paymentMap.toString());
		int a=payService.insertPaymentList(paymentMap);
		if(a==0) {
			System.out.println("Error");
		}else {
			System.out.println("Success");
		}
		String email=(String)paymentMap.get(0).get("seller_email");
		String telephone=(String)paymentMap.get(0).get("payment_telephone");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		String inputDate = format1.format(new Date());
		inputDate=inputDate.substring(2);
		JSONObject jsonObj = new JSONObject();
		FirebaseApp defaultApp = null;
		List<FirebaseApp> apps=FirebaseApp.getApps();
		FileInputStream serviceAccount;
		FirebaseOptions options=null;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		String path = request.getSession().getServletContext().getRealPath("/");
		// 서버 올릴 때 경로
		System.out.println(path);
		String firebasePath = path + "resources"+ File.separator +"firebase" + File.separator + "fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json";
//		String firebasePath2 = path.substring(0, 47) + "src" + File.separator + "main" + File.separator + "webapp"
//				+ File.separator + "resources" + File.separator + "json" + File.separator
//				+ "fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json";
		serviceAccount = new FileInputStream(firebasePath);
		try {
			
			//serviceAccount = new FileInputStream(firebasePath2);
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
		UserRecord userRecord;
		Map<String,Object> rstmap = new HashMap<>();
		try {
			userRecord = FirebaseAuth.getInstance().getUserByEmail(email);
			// See the UserRecord reference doc for the contents of userRecord.
			System.out.println("Successfully fetched user data in cuorder: " + userRecord.getEmail());
			DatabaseReference ref=FirebaseDatabase.getInstance().
					getReference("/PaymentTest2/"+userRecord.getUid()+"/"+telephone+"/");
			for(int i=0; i<paymentMap.size();i++) {
				ref.child((String)paymentMap.get(0).get("payment_regdate")+"/"+i).setValueAsync(paymentMap.get(i));
			}
			
			rstmap.put("result", "success");
			
		} catch (FirebaseAuthException e) {
			e.printStackTrace();
			rstmap.put("result", "fail");
		}
//		defaultApp.delete();
		jsonObj=JSONObject.fromObject(rstmap);
		
		return jsonObj.toString();
		
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/updatePayment")
	@ResponseBody
	public void updatePayment(@RequestBody String param,PaymentVO vo) {
		Map<String,Object> paymentMap = new HashMap<String,Object>();
		paymentMap = JSONObject.fromObject(param);
		vo.setTruck_code((String)paymentMap.get("truck_code"));
		vo.setPayment_telephone((String)paymentMap.get("payment_telephone"));
		vo.setPayment_code((String)paymentMap.get("payment_code"));
		vo.setPayment_class((int)paymentMap.get("payment_class"));
		
		System.out.println(paymentMap);
		int a=payService.updatePaymentList(vo);
		if(a==0) System.out.println("Error");
		else System.out.println("Success");
	}
	@ResponseBody
	@RequestMapping(value = "/GetPayment", method=RequestMethod.POST)
	public CallListVO GetPayment(Model model,CallListVO vo) {
		System.out.println(vo.getMerchant_uid());
		return mapper.getCall(vo.getMerchant_uid());
	}	
	
	
}