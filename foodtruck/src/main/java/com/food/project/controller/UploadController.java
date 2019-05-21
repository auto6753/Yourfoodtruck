package com.food.project.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MenuVO;
import com.food.project.domain.UploadFileUtils;
import com.food.project.service.SellerService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class UploadController {
	private SellerService service;
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Resource(name = "uploadPath")
	String uploadPath;
	
	// String uploadPath = "/resources/image/upload/";
//	@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.GET)
//	public void uploadAjax() {
//		// uploadAjax.jsp로 포워딩
//	}

	// produces="text/plain;charset=utf-8" : 파일 한글처리
	@ResponseBody
	@RequestMapping(value = "/upload/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> upload(MultipartFile file, HttpSession session, MenuVO mvo) throws Exception {
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
		mvo.setMenu_surl(str);
		mvo.setMenu_url(array[0] + "\\" + array[1].substring(2));
		mvo.setTruck_code(vo4.getTruck_code());
		System.out.println(mvo);
		service.insertmenu(mvo);

		// mvo.setMenu_url(menu_url);
		// System.out.println(a.getBody());

		return a;
	}

	@ResponseBody
	@RequestMapping(value = "/upload/delete", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String delete(HttpSession session, MenuVO mvo) throws Exception {
		System.out.println("와랏!");
		String surl = mvo.getMenu_surl();
		String url = mvo.getMenu_url();
		System.out.println(surl);
		System.out.println(url);
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

		return "d";

	}

	@ResponseBody
	@RequestMapping(value = "/upload/modify", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String modify(MultipartFile file, HttpSession session, MenuVO mvo /*@RequestParam("status") String status*/) throws Exception {
		//System.out.println("와랏!");
		System.out.println(mvo);
		//System.out.println(uploadPath);
		//String path = "/project/resources/image/upload/";
		
		String surl = mvo.getMenu_surl();
		String url = mvo.getMenu_url();
		//String surl ="";
		//String url ="";
		if (file!=null) {
			//System.out.println(surl);
			//System.out.println(url);
			url = uploadPath + url;
			surl = uploadPath + surl;
			System.out.println(url);
			System.out.println(surl);
			File file1 = new File(url);
			if (file1.exists()) { // 파일존재여부확인
				if (file1.delete()) {
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
					System.out.println("파일삭제 성공");
					
					logger.info("originalName : " + file.getOriginalFilename());
					logger.info("size : " + file.getSize());
					logger.info("contentType : " + file.getContentType());

					System.out.println("ㅇ");
					System.out.println(session.getAttribute("seller"));
					FoodTruckVO vo4 = (FoodTruckVO) session.getAttribute("seller");
					 //System.out.println(vo4.getEmail());
					 //String email = vo4.getEmail();
					ResponseEntity<String> a = new ResponseEntity<String>(
							UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), vo4),
							HttpStatus.OK);
					String str = a.getBody();
					System.out.println(str);
					String[] array = str.split("\\\\");
					System.out.println(array[0]);
					System.out.println(array[1]);
					System.out.println(array[0] + "\\" + array[1].substring(2));
					mvo.setMenu_surl(str);
					mvo.setMenu_url(array[0] + "\\" + array[1].substring(2));
				   //mvo.setTruck_code(vo4.getTruck_code());
					System.out.println(mvo);
					service.updatemenu(mvo);
					System.out.println("-ㄴㅁㅇ-");
				} else {
					System.out.println("파일삭제 실패");
				}

			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
		}
		else {
			System.out.println("파일안보냄");
			service.updatemenu(mvo);
		}
		return "zz";
	}
}
