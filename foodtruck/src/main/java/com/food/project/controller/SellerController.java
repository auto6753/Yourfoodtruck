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
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.food.project.domain.OnboardCountDTO;
import com.food.project.domain.OnboardVO;
import com.food.project.domain.PaymentVO;
import com.food.project.domain.PeriodDTO;
import com.food.project.domain.UploadFileUtils;
import com.food.project.mapper.EventMapper;
import com.food.project.mapper.SellerMapper;
import com.food.project.paging.CallListPager;
import com.food.project.service.CallListService;
import com.food.project.service.EventService;
import com.food.project.service.FoodTruckService;
import com.food.project.service.OnboardService;
import com.food.project.service.PaymentService;
import com.food.project.service.SellerService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import lombok.AllArgsConstructor;
import net.sf.json.*;


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
	private SellerMapper sellermapper;
	//private SellerMapper sellermapper;
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	@Resource(name = "uploadPath")
	String uploadPath;
	private OnboardService onboard;
	
	@RequestMapping(value="", method=RequestMethod.GET) 
	public String sellerMain(Model model, HttpSession session) {
		return "seller/sellerMain";
	}
	
	@RequestMapping(value="/mngSales", method=RequestMethod.GET) 
	public String mngSales(Model model, HttpSession session, HttpServletRequest request) {
		
		return "seller/mngSales/mngSales";
	}
	
	@RequestMapping(value="/salesInfo", method= {RequestMethod.GET, RequestMethod.POST})
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
			
			int totalAmount = 0; // 총 판매량
			
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
					totalAmount = totalAmount + todaySales.get(i).getAmount();
				} else {
					for(int j=0; j<menuSales.size(); j++) {
						if(menuSales.get(j).getMenu_code().equals(todaySales.get(i).getMenu_code())) {
							menuSales.get(j).add(todaySales.get(i).getAmount(), todaySales.get(i).getTotal_price());
							totalAmount = totalAmount + todaySales.get(i).getAmount();
						}
					}
				}
			}

			mTotalSales = mKakaoSales + mCashSales + mCardSales;
			nTotalSales = nKakaoSales + nCashSales + nCardSales;
			totalSales = mTotalSales + nTotalSales;
			
			totalCashSales = mCashSales + nCashSales;
			totalCardSales = mCardSales + nCardSales;
			totalKakaoSales = mKakaoSales + nKakaoSales;
			
			model.addAttribute("mCashSales", mCashSales); // 회원 현금 매출액
			model.addAttribute("mCardSales", mCardSales); // 회원 카드 매출액
			model.addAttribute("mKakaoSales", mKakaoSales); // 회원 카카오페이 매출액
			model.addAttribute("mTotalSales", mTotalSales); // 회원 총 매출액
			
			model.addAttribute("nCashSales", nCashSales); // 비회원 현금 매출액
			model.addAttribute("nCardSales", nCardSales); // 비회원 카드 매출액
			model.addAttribute("nKakaoSales", nKakaoSales); // 비회원 카카오페이 매출액
			model.addAttribute("nTotalSales", nTotalSales); // 비회원 총 매출액
			
			model.addAttribute("totalCashSales", totalCashSales); // 현금 총 매출액
			model.addAttribute("totalCardSales", totalCardSales); // 카드 총 매출액
			model.addAttribute("totalKakaoSales", totalKakaoSales); // 카카오페이 총 매출액
			
			model.addAttribute("totalSales", totalSales); // 회원 + 비회원 총 매출액
			
			model.addAttribute("menuSales", menuSales); // 메뉴별 판매량
			model.addAttribute("totalAmount", totalAmount); // 총 판매량
			
			return "seller/mngSales/todaySales";
			
		case "weekSales":
			ArrayList<PaymentVO> weekSales = new ArrayList<>(); // 금일 매출 쿼리 결과를 담을 ArrayList
			weekSales = paymentService.getWeekSales(truck_code); // 금일 매출 쿼리 후 결과를 todaySales에 추가
			System.out.println(weekSales);
			int mKakaoSalesWeek = 0, nKakaoSalesWeek = 0; // 카카오페이 매출액(회원, 비회원)
			int totalKakaoSalesWeek = 0; // 카카오페이 매출총액(회원 + 비회원)
			int mCashSalesWeek = 0, nCashSalesWeek = 0; // 현금 매출액(회원, 비회원)
			int totalCashSalesWeek = 0; // 현금 매출총액(회원 + 비회원)
			int mCardSalesWeek = 0, nCardSalesWeek = 0; // 카드 매출액(회원, 비회원)
			int totalCardSalesWeek = 0; // 카드 매출총액(회원 + 비회원)
			int mTotalSalesWeek = 0, nTotalSalesWeek = 0; // 총 매출액(회원, 비회원)
			int totalSalesWeek = 0; // 총 매출액(회원 + 비회원)
			
			int totalAmountWeek = 0; // 총 판매량
			
			HashSet<String> menuCodesWeek = new HashSet<>();
			ArrayList<MenuSalesVO> menuSalesWeek = new ArrayList<>();
			
			for(int i=0; i<weekSales.size(); i++) {
				switch(weekSales.get(i).getPayment_class()) {
				case 3: // 카카오페이
					telephone = weekSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) { // 회원 조회 값이 있으면(= 회원이면)
						mKakaoSalesWeek = mKakaoSalesWeek + weekSales.get(i).getTotal_price();
					} else { // 회원 조회 값이 없으면(= 비회원이면)
						nKakaoSalesWeek = nKakaoSalesWeek + weekSales.get(i).getTotal_price();
					}
					break;
				case 4: // 현금
					telephone = weekSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCashSalesWeek = mCashSalesWeek + weekSales.get(i).getTotal_price();
					} else {
						nCashSalesWeek = nCashSalesWeek + weekSales.get(i).getTotal_price();
					}
					break;
				case 5: // 카드
					telephone = weekSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCardSalesWeek = mCardSalesWeek + weekSales.get(i).getTotal_price();
					} else {
						nCardSalesWeek = nCardSalesWeek + weekSales.get(i).getTotal_price();
					}
					break;
					default:
				}
				
				String menu_code = weekSales.get(i).getMenu_code();
				String menu_name = weekSales.get(i).getMenu_name();
				
				if(menu_code == null) { weekSales.get(i).setMenu_code("999999999"); }
				if(menu_name == null) { weekSales.get(i).setMenu_name("(삭제된 메뉴)"); }
				
				if(menuCodesWeek.add(weekSales.get(i).getMenu_code())) {
					MenuSalesVO temp = new MenuSalesVO();
					temp.setMenu_code(weekSales.get(i).getMenu_code());
					temp.setMenu_name(weekSales.get(i).getMenu_name());
					temp.setAmount(weekSales.get(i).getAmount());
					temp.setTotalPrice(weekSales.get(i).getTotal_price());
					temp.setUnitPrice(weekSales.get(i).getTotal_price() / weekSales.get(i).getAmount());
					menuSalesWeek.add(temp);
					totalAmountWeek = totalAmountWeek + weekSales.get(i).getAmount();
				} else {
					for(int j=0; j<menuSalesWeek.size(); j++) {
						if(menuSalesWeek.get(j).getMenu_code().equals(weekSales.get(i).getMenu_code())) {
							menuSalesWeek.get(j).add(weekSales.get(i).getAmount(), weekSales.get(i).getTotal_price());
							totalAmountWeek = totalAmountWeek + weekSales.get(i).getAmount();
						}
					}
				}
			}

			mTotalSalesWeek = mKakaoSalesWeek + mCashSalesWeek + mCardSalesWeek;
			nTotalSalesWeek = nKakaoSalesWeek + nCashSalesWeek + nCardSalesWeek;
			totalSalesWeek = mTotalSalesWeek + nTotalSalesWeek;
			
			totalCashSalesWeek = mCashSalesWeek + nCashSalesWeek;
			totalCardSalesWeek = mCardSalesWeek + nCardSalesWeek;
			totalKakaoSalesWeek = mKakaoSalesWeek + nKakaoSalesWeek;
			
			model.addAttribute("mCashSalesWeek", mCashSalesWeek); // 회원 현금 매출액
			model.addAttribute("mCardSalesWeek", mCardSalesWeek); // 회원 카드 매출액
			model.addAttribute("mKakaoSalesWeek", mKakaoSalesWeek); // 회원 카카오페이 매출액
			model.addAttribute("mTotalSalesWeek", mTotalSalesWeek); // 회원 총 매출액
			
			model.addAttribute("nCashSalesWeek", nCashSalesWeek); // 비회원 현금 매출액
			model.addAttribute("nCardSalesWeek", nCardSalesWeek); // 비회원 카드 매출액
			model.addAttribute("nKakaoSalesWeek", nKakaoSalesWeek); // 비회원 카카오페이 매출액
			model.addAttribute("nTotalSalesWeek", nTotalSalesWeek); // 비회원 총 매출액
			
			model.addAttribute("totalCashSalesWeek", totalCashSalesWeek); // 현금 총 매출액
			model.addAttribute("totalCardSalesWeek", totalCardSalesWeek); // 카드 총 매출액
			model.addAttribute("totalKakaoSalesWeek", totalKakaoSalesWeek); // 카카오페이 총 매출액
			
			model.addAttribute("totalSalesWeek", totalSalesWeek); // 회원 + 비회원 총 매출액
			
			model.addAttribute("menuSalesWeek", menuSalesWeek); // 메뉴별 판매량
			model.addAttribute("totalAmountWeek", totalAmountWeek); // 총 판매량
			
			return "seller/mngSales/weekSales";
			
		case "monthSales":
		case "monthSalesRe":
			ArrayList<PaymentVO> monthSales = new ArrayList<>(); // 월간 매출 쿼리 결과를 담을 ArrayList
			String[] monthVal = paymentService.getMonthValue(truck_code);
			ArrayList<String> monthValArrList = new ArrayList<>();
			String yymm = null; 
			
			for(int i=0; i<monthVal.length; i++) {
				String[] temp = {"", ""};
				temp[0] = monthVal[i].substring(0, 2);
				temp[1] = monthVal[i].substring(3);
				monthValArrList.add(i, temp[0] + "년 " + temp[1] + "월");
				
				if(i == monthVal.length-1 && pageName.equals("monthSales")) {
					yymm = temp[0] + "년 " + temp[1] + "월";
					monthSales = paymentService.getMonthSales(truck_code, temp[0], temp[1]); // 월간 매출 쿼리 후 결과를 monthSales에 추가
				}
			}

			if(pageName.equals("monthSalesRe")) {
				yymm = request.getParameter("yymm");
				String inputYear = yymm.substring(0, 2);
				String inputMonth = yymm.substring(4, 6);
				
				monthSales = paymentService.getMonthSales(truck_code, inputYear, inputMonth); // 월간 매출 쿼리 후 결과를 monthSales에 추가
			}

			int mKakaoSalesMonth = 0, nKakaoSalesMonth = 0; // 카카오페이 매출액(회원, 비회원)
			int totalKakaoSalesMonth = 0; // 카카오페이 매출총액(회원 + 비회원)
			int mCashSalesMonth = 0, nCashSalesMonth = 0; // 현금 매출액(회원, 비회원)
			int totalCashSalesMonth = 0; // 현금 매출총액(회원 + 비회원)
			int mCardSalesMonth = 0, nCardSalesMonth = 0; // 카드 매출액(회원, 비회원)
			int totalCardSalesMonth = 0; // 카드 매출총액(회원 + 비회원)
			int mTotalSalesMonth = 0, nTotalSalesMonth = 0; // 총 매출액(회원, 비회원)
			int totalSalesMonth = 0; // 총 매출액(회원 + 비회원)
			
			int totalAmountMonth = 0; // 총 판매량
			
			HashSet<String> menuCodesMonth = new HashSet<>();
			ArrayList<MenuSalesVO> menuSalesMonth = new ArrayList<>();
			
			for(int i=0; i<monthSales.size(); i++) {
				switch(monthSales.get(i).getPayment_class()) {
				case 3: // 카카오페이
					telephone = monthSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) { // 회원 조회 값이 있으면(= 회원이면)
						mKakaoSalesMonth = mKakaoSalesMonth + monthSales.get(i).getTotal_price();
					} else { // 회원 조회 값이 없으면(= 비회원이면)
						nKakaoSalesMonth = nKakaoSalesMonth + monthSales.get(i).getTotal_price();
					}
					break;
				case 4: // 현금
					telephone = monthSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCashSalesMonth = mCashSalesMonth + monthSales.get(i).getTotal_price();
					} else {
						nCashSalesMonth = nCashSalesMonth + monthSales.get(i).getTotal_price();
					}
					break;
				case 5: // 카드
					telephone = monthSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCardSalesMonth = mCardSalesMonth + monthSales.get(i).getTotal_price();
					} else {
						nCardSalesMonth = nCardSalesMonth + monthSales.get(i).getTotal_price();
					}
					break;
					default:
				}
				
				String menu_code = monthSales.get(i).getMenu_code();
				String menu_name = monthSales.get(i).getMenu_name();
				
				if(menu_code == null) { monthSales.get(i).setMenu_code("999999999"); }
				if(menu_name == null) { monthSales.get(i).setMenu_name("(삭제된 메뉴)"); }
				
				if(menuCodesMonth.add(monthSales.get(i).getMenu_code())) {
					MenuSalesVO temp = new MenuSalesVO();
					temp.setMenu_code(monthSales.get(i).getMenu_code());
					temp.setMenu_name(monthSales.get(i).getMenu_name());
					temp.setAmount(monthSales.get(i).getAmount());
					temp.setTotalPrice(monthSales.get(i).getTotal_price());
					temp.setUnitPrice(monthSales.get(i).getTotal_price() / monthSales.get(i).getAmount());
					menuSalesMonth.add(temp);
					totalAmountMonth = totalAmountMonth + monthSales.get(i).getAmount();
				} else {
					for(int j=0; j<menuSalesMonth.size(); j++) {
						if(menuSalesMonth.get(j).getMenu_code().equals(monthSales.get(i).getMenu_code())) {
							menuSalesMonth.get(j).add(monthSales.get(i).getAmount(), monthSales.get(i).getTotal_price());
							totalAmountMonth = totalAmountMonth + monthSales.get(i).getAmount();
						}
					}
				}
			}

			mTotalSalesMonth = mKakaoSalesMonth + mCashSalesMonth + mCardSalesMonth;
			nTotalSalesMonth = nKakaoSalesMonth + nCashSalesMonth + nCardSalesMonth;
			totalSalesMonth = mTotalSalesMonth + nTotalSalesMonth;
			
			totalCashSalesMonth = mCashSalesMonth + nCashSalesMonth;
			totalCardSalesMonth = mCardSalesMonth + nCardSalesMonth;
			totalKakaoSalesMonth = mKakaoSalesMonth + nKakaoSalesMonth;
			
			model.addAttribute("monthValArrList", monthValArrList); // 매출액이 집계된 연월 값(yy년 mm월)
			
			model.addAttribute("mCashSalesMonth", mCashSalesMonth); // 회원 현금 매출액
			model.addAttribute("mCardSalesMonth", mCardSalesMonth); // 회원 카드 매출액
			model.addAttribute("mKakaoSalesMonth", mKakaoSalesMonth); // 회원 카카오페이 매출액
			model.addAttribute("mTotalSalesMonth", mTotalSalesMonth); // 회원 총 매출액
			
			model.addAttribute("nCashSalesMonth", nCashSalesMonth); // 비회원 현금 매출액
			model.addAttribute("nCardSalesMonth", nCardSalesMonth); // 비회원 카드 매출액
			model.addAttribute("nKakaoSalesMonth", nKakaoSalesMonth); // 비회원 카카오페이 매출액
			model.addAttribute("nTotalSalesMonth", nTotalSalesMonth); // 비회원 총 매출액
			
			model.addAttribute("totalCashSalesMonth", totalCashSalesMonth); // 현금 총 매출액
			model.addAttribute("totalCardSalesMonth", totalCardSalesMonth); // 카드 총 매출액
			model.addAttribute("totalKakaoSalesMonth", totalKakaoSalesMonth); // 카카오페이 총 매출액
			
			model.addAttribute("totalSalesMonth", totalSalesMonth); // 회원 + 비회원 총 매출액
			
			model.addAttribute("menuSalesMonth", menuSalesMonth); // 메뉴별 판매량
			model.addAttribute("totalAmountMonth", totalAmountMonth); // 총 판매량
			
			model.addAttribute("yymm", yymm);
			
			return "seller/mngSales/monthSales";
			
		case "yearSales":
		case "yearSalesRe":
			ArrayList<PaymentVO> yearSales = new ArrayList<>(); // 연간 매출 쿼리 결과를 담을 ArrayList
			String[] yearVal = paymentService.getYearValue(truck_code);
			ArrayList<String> yearValArrList = new ArrayList<>();
			String yy = null;
			
			for(int i=0; i<yearVal.length; i++) {
				yearValArrList.add(i, yearVal[i] + "년");
				
				if(i == yearVal.length-1 && pageName.equals("yearSales")) {
					yy = yearVal[i] + "년";
					yearSales = paymentService.getYearSales(truck_code, yearVal[i]); // 연간 매출 쿼리 후 결과를 yearSales에 추가
				}
			}
			
			if(pageName.equals("yearSalesRe")) {
				yy = request.getParameter("yy");
				String inputYear = yy.substring(0, 2);
				
				yearSales = paymentService.getYearSales(truck_code, inputYear); // 연간 매출 쿼리 후 결과를 yearSales에 추가
			}
			
			int mKakaoSalesYear = 0, nKakaoSalesYear = 0; // 카카오페이 매출액(회원, 비회원)
			int totalKakaoSalesYear = 0; // 카카오페이 매출총액(회원 + 비회원)
			int mCashSalesYear = 0, nCashSalesYear = 0; // 현금 매출액(회원, 비회원)
			int totalCashSalesYear = 0; // 현금 매출총액(회원 + 비회원)
			int mCardSalesYear = 0, nCardSalesYear = 0; // 카드 매출액(회원, 비회원)
			int totalCardSalesYear = 0; // 카드 매출총액(회원 + 비회원)
			int mTotalSalesYear = 0, nTotalSalesYear = 0; // 총 매출액(회원, 비회원)
			int totalSalesYear = 0; // 총 매출액(회원 + 비회원)
			
			int totalAmountYear = 0; // 총 판매량
			
			HashSet<String> menuCodesYear = new HashSet<>();
			ArrayList<MenuSalesVO> menuSalesYear = new ArrayList<>();
			
			for(int i=0; i<yearSales.size(); i++) {
				switch(yearSales.get(i).getPayment_class()) {
				case 3: // 카카오페이
					telephone = yearSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) { // 회원 조회 값이 있으면(= 회원이면)
						mKakaoSalesYear = mKakaoSalesYear + yearSales.get(i).getTotal_price();
					} else { // 회원 조회 값이 없으면(= 비회원이면)
						nKakaoSalesYear = nKakaoSalesYear + yearSales.get(i).getTotal_price();
					}
					break;
				case 4: // 현금
					telephone = yearSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCashSalesYear = mCashSalesYear + yearSales.get(i).getTotal_price();
					} else {
						nCashSalesYear = nCashSalesYear + yearSales.get(i).getTotal_price();
					}
					break;
				case 5: // 카드
					telephone = yearSales.get(i).getPayment_telephone();
					isMember = paymentService.isMember(telephone);
					
					if(isMember != null) {
						mCardSalesYear = mCardSalesYear + yearSales.get(i).getTotal_price();
					} else {
						nCardSalesYear = nCardSalesYear + yearSales.get(i).getTotal_price();
					}
					break;
					default:
				}
				
				String menu_code = yearSales.get(i).getMenu_code();
				String menu_name = yearSales.get(i).getMenu_name();
				
				if(menu_code == null) { yearSales.get(i).setMenu_code("999999999"); }
				if(menu_name == null) { yearSales.get(i).setMenu_name("(삭제된 메뉴)"); }
				
				if(menuCodesYear.add(yearSales.get(i).getMenu_code())) {
					MenuSalesVO temp = new MenuSalesVO();
					temp.setMenu_code(yearSales.get(i).getMenu_code());
					temp.setMenu_name(yearSales.get(i).getMenu_name());
					temp.setAmount(yearSales.get(i).getAmount());
					temp.setTotalPrice(yearSales.get(i).getTotal_price());
					temp.setUnitPrice(yearSales.get(i).getTotal_price() / yearSales.get(i).getAmount());
					menuSalesYear.add(temp);
					totalAmountYear = totalAmountYear + yearSales.get(i).getAmount();
				} else {
					for(int j=0; j<menuSalesYear.size(); j++) {
						if(menuSalesYear.get(j).getMenu_code().equals(yearSales.get(i).getMenu_code())) {
							menuSalesYear.get(j).add(yearSales.get(i).getAmount(), yearSales.get(i).getTotal_price());
							totalAmountYear = totalAmountYear + yearSales.get(i).getAmount();
						}
					}
				}
			}

			mTotalSalesYear = mKakaoSalesYear + mCashSalesYear + mCardSalesYear;
			nTotalSalesYear = nKakaoSalesYear + nCashSalesYear + nCardSalesYear;
			totalSalesYear = mTotalSalesYear + nTotalSalesYear;
			
			totalCashSalesYear = mCashSalesYear + nCashSalesYear;
			totalCardSalesYear = mCardSalesYear + nCardSalesYear;
			totalKakaoSalesYear = mKakaoSalesYear + nKakaoSalesYear;
			
			model.addAttribute("yearValArrList", yearValArrList); // 매출액이 집계된 연 값(yy년)
			
			model.addAttribute("mCashSalesYear", mCashSalesYear); // 회원 현금 매출액
			model.addAttribute("mCardSalesYear", mCardSalesYear); // 회원 카드 매출액
			model.addAttribute("mKakaoSalesYear", mKakaoSalesYear); // 회원 카카오페이 매출액
			model.addAttribute("mTotalSalesYear", mTotalSalesYear); // 회원 총 매출액
			
			model.addAttribute("nCashSalesYear", nCashSalesYear); // 비회원 현금 매출액
			model.addAttribute("nCardSalesYear", nCardSalesYear); // 비회원 카드 매출액
			model.addAttribute("nKakaoSalesYear", nKakaoSalesYear); // 비회원 카카오페이 매출액
			model.addAttribute("nTotalSalesYear", nTotalSalesYear); // 비회원 총 매출액
			
			model.addAttribute("totalCashSalesYear", totalCashSalesYear); // 현금 총 매출액
			model.addAttribute("totalCardSalesYear", totalCardSalesYear); // 카드 총 매출액
			model.addAttribute("totalKakaoSalesYear", totalKakaoSalesYear); // 카카오페이 총 매출액
			
			model.addAttribute("totalSalesYear", totalSalesYear); // 회원 + 비회원 총 매출액
			
			model.addAttribute("menuSalesYear", menuSalesYear); // 메뉴별 판매량
			model.addAttribute("totalAmountYear", totalAmountYear); // 총 판매량
			
			model.addAttribute("yy", yy);
			
			return "seller/mngSales/yearSales";
			
		case "byDaySales":
		case "byDaySalesRe":
			ArrayList<PaymentVO> byDaySalesQuery = new ArrayList<>(); // 요일별 매출 쿼리 결과를 담을 ArrayList
			String[] byDayVal = paymentService.getByDayValue(truck_code);
			ArrayList<String> byDayValArrList = new ArrayList<>();
			String yyyy_db = null; // byDay Begin
			String yyyy_de = null; // byDay End
			
			for(int i=0; i<byDayVal.length; i++) {
				byDayValArrList.add(i, byDayVal[i] + "년");
				
				if(i == byDayVal.length-1 && pageName.equals("byDaySales")) {
					yyyy_db = byDayVal[i] + "년";
					yyyy_de = byDayVal[i] + "년";
					byDaySalesQuery = paymentService.getByDaySales(truck_code, byDayVal[i], byDayVal[i]); // 요일별 매출 쿼리 후 결과를 byDaySalesQuery에 추가
				}
			}
			
			if(pageName.equals("byDaySalesRe")) {
				yyyy_db = request.getParameter("yyyy_db");
				yyyy_de = request.getParameter("yyyy_de");
				String inputFirstYear = yyyy_db.substring(0, 4);
				String inputLastYear = yyyy_de.substring(0, 4);
				byDaySalesQuery = paymentService.getByDaySales(truck_code, inputFirstYear, inputLastYear);
				System.out.println(byDaySalesQuery);
			}
			
			
			Map<Integer, ArrayList<PaymentVO>> byDaySales = new HashMap<>();
			ArrayList<int[]> byDaySalesResult = new ArrayList<>();
			
			for(int i=0; i<7; i++) {
				ArrayList<PaymentVO> temp = new ArrayList<>();
				for(int j=0; j<byDaySalesQuery.size(); j++) {
					Calendar cal = Calendar.getInstance();
					cal.setTime(byDaySalesQuery.get(j).getPayment_date());			     
					int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
					
					if(dayNum == (i+1)) {
						temp.add(byDaySalesQuery.get(j));
					}
				}
				byDaySales.put(i, temp);
			}
			
			for(int i=0; i<byDaySales.size(); i++) {
				// {현금(회원), 현금(비회원), 현금(전체), 카드(회원), 카드(비회원), 카드(전체), 카카오페이(회원), 카카오페이(비회원), 카카오페이(전체), 회원 합계, 비회원 합계, 전체 합계}
				int[] sales = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
				
				for(int j=0; j<byDaySales.get(i).size(); j++) {
					switch(byDaySales.get(i).get(j).getPayment_class()) {
					case 3: // 카카오페이
						telephone = byDaySales.get(i).get(j).getPayment_telephone();
						isMember = paymentService.isMember(telephone);
						
						if(isMember != null) { // 회원 조회 값이 있으면(= 회원이면)
							int value = sales[6] + byDaySales.get(i).get(j).getTotal_price();
							sales[6] = value;
							sales[8] = sales[8] + byDaySales.get(i).get(j).getTotal_price();
						} else { // 회원 조회 값이 없으면(= 비회원이면)
							int value = sales[7] + byDaySales.get(i).get(j).getTotal_price();
							sales[7] = value;
							sales[8] = sales[8] + byDaySales.get(i).get(j).getTotal_price();
						}
						break;
					case 4: // 현금
						telephone = byDaySales.get(i).get(j).getPayment_telephone();
						isMember = paymentService.isMember(telephone);
						
						if(isMember != null) {
							int value = sales[0] + byDaySales.get(i).get(j).getTotal_price();
							sales[0] = value;
							sales[2] = sales[2] + byDaySales.get(i).get(j).getTotal_price();
						} else {
							int value = sales[1] + byDaySales.get(i).get(j).getTotal_price();
							sales[1] = value;
							sales[2] = sales[2] + byDaySales.get(i).get(j).getTotal_price();
						}
						break;
					case 5: // 카드
						telephone = byDaySales.get(i).get(j).getPayment_telephone();
						isMember = paymentService.isMember(telephone);
						
						if(isMember != null) {
							int value = sales[3] + byDaySales.get(i).get(j).getTotal_price();
							sales[3] = value;
							sales[5] = sales[5] + byDaySales.get(i).get(j).getTotal_price();
						} else {
							int value = sales[4] + byDaySales.get(i).get(j).getTotal_price();
							sales[4] = value;
							sales[5] = sales[5] + byDaySales.get(i).get(j).getTotal_price();
						}
						break;
						default:
					}
				}
				sales[9] = sales[0] + sales[3] + sales[6];
				sales[10] = sales[1] + sales[4] + sales[7];
				sales[11] = sales[2] + sales[5] + sales[8];
				
				byDaySalesResult.add(sales);
			}
			
			model.addAttribute("byDaySalesResult", byDaySalesResult);
			
			model.addAttribute("yyyy_db", yyyy_db);
			model.addAttribute("yyyy_de", yyyy_de);
			model.addAttribute("byDayValArrList", byDayValArrList);
			
			return "seller/mngSales/byDaySales";
			
		case "byTimeSales":
		case "byTimeSalesRe":
			ArrayList<PaymentVO> byTimeSalesQuery = new ArrayList<>(); // 시간별 매출 쿼리 결과를 담을 ArrayList
			String[] byTimeVal = paymentService.getByTimeValue(truck_code);
			ArrayList<String> byTimeValArrList = new ArrayList<>();
			String yyyy_tb = null; // byTime Begin
			String yyyy_te = null; // byTime End
			
			for(int i=0; i<byTimeVal.length; i++) {
				byTimeValArrList.add(i, byTimeVal[i] + "년");
				
				if(i == byTimeVal.length-1 && pageName.equals("byTimeSales")) {
					yyyy_tb = byTimeVal[i] + "년";
					yyyy_te = byTimeVal[i] + "년";
					byTimeSalesQuery = paymentService.getByTimeSales(truck_code, byTimeVal[i], byTimeVal[i]); // 시간별 매출 쿼리 후 결과를 byDaySalesQuery에 추가
				}
			}
			
			if(pageName.equals("byTimeSalesRe")) {
				yyyy_tb = request.getParameter("yyyy_tb");
				yyyy_te = request.getParameter("yyyy_te");
				String inputFirstYear = yyyy_tb.substring(0, 4);
				String inputLastYear = yyyy_te.substring(0, 4);
				byTimeSalesQuery = paymentService.getByTimeSales(truck_code, inputFirstYear, inputLastYear);
				System.out.println(byTimeSalesQuery);
			}
			
			Map<Integer, ArrayList<PaymentVO>> byTimeSales = new HashMap<>();
			ArrayList<int[]> byTimeSalesResult = new ArrayList<>();
			for(int i=0; i<24; i++) {
				ArrayList<PaymentVO> temp = new ArrayList<>();
				for(int j=0; j<byTimeSalesQuery.size(); j++) {
					Calendar cal = Calendar.getInstance();
					cal.setTime(byTimeSalesQuery.get(j).getPayment_date());			     
					int hour = cal.get(Calendar.HOUR_OF_DAY) ;
					if(hour == i) {
						temp.add(byTimeSalesQuery.get(j));
					}
				}
				byTimeSales.put(i, temp);
				
			}
			
			for(int i=0; i<byTimeSales.size(); i++) {
				// {현금(회원), 현금(비회원), 현금(전체), 카드(회원), 카드(비회원), 카드(전체), 카카오페이(회원), 카카오페이(비회원), 카카오페이(전체), 회원 합계, 비회원 합계, 전체 합계}
				int[] sales = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
				
				for(int j=0; j<byTimeSales.get(i).size(); j++) {
					switch(byTimeSales.get(i).get(j).getPayment_class()) {
					case 3: // 카카오페이
						telephone = byTimeSales.get(i).get(j).getPayment_telephone();
						isMember = paymentService.isMember(telephone);
						
						if(isMember != null) { // 회원 조회 값이 있으면(= 회원이면)
							int value = sales[6] + byTimeSales.get(i).get(j).getTotal_price();
							sales[6] = value;
							sales[8] = sales[8] + byTimeSales.get(i).get(j).getTotal_price();
						} else { // 회원 조회 값이 없으면(= 비회원이면)
							int value = sales[7] + byTimeSales.get(i).get(j).getTotal_price();
							sales[7] = value;
							sales[8] = sales[8] + byTimeSales.get(i).get(j).getTotal_price();
						}
						break;
					case 4: // 현금
						telephone = byTimeSales.get(i).get(j).getPayment_telephone();
						isMember = paymentService.isMember(telephone);
						
						if(isMember != null) {
							int value = sales[0] + byTimeSales.get(i).get(j).getTotal_price();
							sales[0] = value;
							sales[2] = sales[2] + byTimeSales.get(i).get(j).getTotal_price();
						} else {
							int value = sales[1] + byTimeSales.get(i).get(j).getTotal_price();
							sales[1] = value;
							sales[2] = sales[2] + byTimeSales.get(i).get(j).getTotal_price();
						}
						break;
					case 5: // 카드
						telephone = byTimeSales.get(i).get(j).getPayment_telephone();
						isMember = paymentService.isMember(telephone);
						
						if(isMember != null) {
							int value = sales[3] + byTimeSales.get(i).get(j).getTotal_price();
							sales[3] = value;
							sales[5] = sales[5] + byTimeSales.get(i).get(j).getTotal_price();
						} else {
							int value = sales[4] + byTimeSales.get(i).get(j).getTotal_price();
							sales[4] = value;
							sales[5] = sales[5] + byTimeSales.get(i).get(j).getTotal_price();
						}
						break;
						default:
					}
				}
				sales[9] = sales[0] + sales[3] + sales[6];
				sales[10] = sales[1] + sales[4] + sales[7];
				sales[11] = sales[2] + sales[5] + sales[8];
				
				byTimeSalesResult.add(sales);
			}
			model.addAttribute("byTimeSalesResult", byTimeSalesResult);
			
			model.addAttribute("yyyy_tb", yyyy_tb);
			model.addAttribute("yyyy_te", yyyy_te);
			model.addAttribute("byTimeValArrList", byTimeValArrList);
			
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
	public String location(Model model, HttpSession session) {
		FoodTruckVO tvo = (FoodTruckVO) session.getAttribute("seller");
		
		LocationVO lvo = new LocationVO();
		lvo =  sellermapper.getlocation(tvo.getTruck_code());	
		if(lvo ==null) {
			lvo.setLat_y("37.566826");
			lvo.setLng_x("126.9786567");
		}
		System.out.println(lvo);
		JSONObject a  = new JSONObject();
		a.put("lat_y",lvo.getLat_y());
		a.put("lng_x",lvo.getLng_x());
		
		model.addAttribute("location", a);
		return "seller/loc/location";
	}
	@RequestMapping(value="/location", method=RequestMethod.POST) 
	public String location2(Model model, LocationVO vo, HttpSession session) {
		
		sellerservice.insertlocaction(vo);
		System.out.println(vo);
		
		
		FoodTruckVO tvo = (FoodTruckVO) session.getAttribute("seller");
		
		LocationVO lvo = new LocationVO();
		lvo =  sellermapper.getlocation(tvo.getTruck_code());	
		if(lvo ==null) {
			lvo.setLat_y("37.566826");
			lvo.setLng_x("126.9786567");
		}
		System.out.println(lvo);
		JSONObject a  = new JSONObject();
		a.put("lat_y",lvo.getLat_y());
		a.put("lng_x",lvo.getLng_x());
		
		model.addAttribute("location", a);
		
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
		FoodTruckVO vo4 = new FoodTruckVO();
		String em = e.getEmail()+"/event";
		vo4.setEmail(em);
		//vo4.setEmail();
		EventVO evo = new EventVO();
		try {
			ResponseEntity<String> upload = new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), vo4),
					HttpStatus.OK);
			String str = upload.getBody();
			String[] array = str.split("\\\\");
			System.out.println(array[0]);
			System.out.println(array[1]);
			System.out.println(array[0] + "\\" + array[1].substring(2));
			evo.setEvent_url(array[0] + "\\" + array[1].substring(2));
		}catch(Exception ex) {
			evo.setEvent_url("defaultImg.png");
		}
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
			
		
		
		ArrayList<EventMenuVO> emvos = new ArrayList<>();
		
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
	@ResponseBody
	@RequestMapping(value="/CountOnboard", method=RequestMethod.POST) 
	public String countonboard(Model model, HttpServletRequest request) {

		
		
		return "seller/psg/psgpush";
	}
	
	@RequestMapping(value="/psgpush", method=RequestMethod.GET) 
	public String passenger(Model model,HttpSession session, HttpServletRequest request) {
		FoodTruckVO foodtruckvo = (FoodTruckVO) session.getAttribute("seller");
		String truck_code = foodtruckvo.getTruck_code();
		int i = 1;
		String resultString;
		try {
			String beginDate = request.getParameter("inputBeginDate");
			String endDate = request.getParameter("inputEndDate");
			System.out.println(beginDate);
			System.out.println(endDate);
			PeriodDTO period = new PeriodDTO();
			period.setTruck_code(truck_code);
			period.setOnboard_state(i);
			period.setBeginDate(beginDate);
			period.setEndDate(endDate);
			
			ArrayList<OnboardCountDTO> perioddate = onboard.countonboarddate(period);
			System.out.println("1" +perioddate.toString());
			int periodsize = perioddate.size();
			JSONArray resultlist = new JSONArray();
			ArrayList<Map<String,Object>> periodresult = new ArrayList<Map<String,Object>>();
			for(int g=0;g<periodsize;g++) {
				perioddate.get(g).getCount();
				perioddate.get(g).getOnboard_date();
				JSONObject periodcount = new JSONObject();
				
				periodcount.put("onboard_date", perioddate.get(g).getOnboard_date());
				periodcount.put("count", perioddate.get(g).getCount());
				System.out.println(periodcount.toString());
				Map<String,Object> map = new HashMap<String,Object>();
				map=net.sf.json.JSONObject.fromObject(periodcount.toString());
				resultlist.add(map);
			}
			resultlist=JSONArray.fromObject(resultlist.toString());
			System.out.println("제발 되라");
			resultString = resultlist.toString();
			System.out.println(resultlist.toString());
		}catch(Exception e) {
			OnboardVO br = new OnboardVO();
			br.setTruck_code(truck_code);
			br.setOnboard_state(i);
			ArrayList<OnboardCountDTO> on = onboard.CountOnboard(br);
			int onSize = on.size();
			JSONArray resultlist = new JSONArray();
			ArrayList<Map<String,Object>> jsonresult = new ArrayList<Map<String,Object>>();
			for(int j=0;j<onSize;j++) {
				on.get(j).getCount();
				on.get(j).getOnboard_date();
				JSONObject ridecount = new JSONObject();
				
				ridecount.put("onboard_date", on.get(j).getOnboard_date());
				ridecount.put("count", on.get(j).getCount());
				System.out.println(ridecount.toString());
				Map<String,Object> map = new HashMap<String,Object>();
				map=net.sf.json.JSONObject.fromObject(ridecount.toString());
				jsonresult.add(map);
			}
			resultlist=JSONArray.fromObject(jsonresult.toString());
			System.out.println("제발 되라");
			System.out.println(resultlist.toString());
			resultString = resultlist.toString();
		}
		
		/* ArrayList<HashMap<String,Object>> on = onboard.CountOnboard(br);
		 * ArrayList<HashMap<String,Object>> result = onboard.CountOnboard(br);
		 * for(HashMap<String,Object> temp:on) { HashMap<String,Object> data = new
		 * HashMap<>(); data.put("count_data",temp.get("COUNT")); result.add(data); }
		 */
		//차트용 탑승자 데이터 가져오기
		
		//model.addAttribute("On", on);
		model.addAttribute("resultlist", resultString);
		
		
		
		//model.addAttribute("On", on);
		//푸시알림용 파이어베이스 adminSDK설정
//		FirebaseApp defaultApp = null;
//		CustomerVO vo=new CustomerVO();
//		vo=(CustomerVO) session.getAttribute("sessionid");
//		String email=vo.getEmail();
//		FileInputStream serviceAccount;
//		try {
//			if(defaultApp==null) {
//				serviceAccount = new FileInputStream("C:\\fir-test-f3fea-firebase-adminsdk-yvo75-b7c73a6644.json");
//				FirebaseOptions options = new FirebaseOptions.Builder()
//						.setCredentials(GoogleCredentials.fromStream(serviceAccount))
//						.setDatabaseUrl("https://fir-test-f3fea.firebaseio.com/")
//						.build();
//				defaultApp = FirebaseApp.initializeApp(options);
//				UserRecord userRecord=FirebaseAuth.getInstance().getUserByEmail(email);
//				model.addAttribute("_uid",userRecord.getUid());
//				defaultApp.delete();
//			}
//			
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (FirebaseAuthException e) {
//			e.printStackTrace();
//		}
		
		return "seller/psg/psgpush";
	}

	
	@RequestMapping(value="/callmanage", method=RequestMethod.GET) 
	public String call(Model model,@RequestParam(defaultValue="1") int curPage,HttpSession session) {
		int totPage=0;
		CallListPager callListPager;
		
		FoodTruckVO vo = (FoodTruckVO)session.getAttribute("seller");
		totPage=callService.totalPage(vo.getTruck_code());
		callListPager=new CallListPager(totPage,curPage);
		int start=callListPager.getPageBegin();
		int end=callListPager.getPageEnd();
		ArrayList<Map<String,Object>> callList = callService.allList(start,end,vo.getTruck_code());
		//callService.getCallList(vo.getTruck_code())
		model.addAttribute("callList", callList);
		Map<String,Object> map = new HashMap<>();
		map.put("totPage",totPage);
		map.put("callListPager",callListPager);
		model.addAttribute("map",map);
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
		
		String a = vo2.getTruck_surl();
		if (a==null) {
			vo2.setTruck_surl("트럭사진.png");
		}
		
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
		return "redirect:/seller/truckinfo";
		
		
	
}
	@RequestMapping(value="/truckphoto", method=RequestMethod.GET) 
	public String truckphoto(Model model) {
		return "seller/truckinfo/truckphoto";
	}
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> upload(MultipartFile file, HttpSession session, FoodTruckVO mvo) throws Exception {
		System.out.println("와랏!");

		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());

		System.out.println("ㅇ");
		System.out.println(session.getAttribute("seller"));
		FoodTruckVO vo4 = (FoodTruckVO) session.getAttribute("seller");
		
		// System.out.println(vo.getEmail());
		// String email = vo.getEmail();
		ResponseEntity<String> a = new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), vo4),
				HttpStatus.OK);

		String str = a.getBody();
		System.out.println(str);
		String[] array = str.split("\\\\");
		System.out.println(array[0]);
		System.out.println(array[1]);
		System.out.println(array[0] + "\\" + array[1].substring(2));
	
		mvo.setTruck_url(array[0] + "\\" + array[1].substring(2));
		mvo.setTruck_code(vo4.getTruck_code());
		mvo.setTruck_surl(str);
		System.out.println(mvo);
		truckService.updatetruckphoto(mvo);

		// mvo.setMenu_url(menu_url);
		// System.out.println(a.getBody());

		return a;
	}
}
