package com.food.project.seleniumTest;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import net.sf.json.JSONObject;

public class SeleniumTest {

	//크롤링할 파일 위치
	public static final String CLASS_PATH= SeleniumTest.class.getResource("").getPath();
	public static final String JSON_PATH="Z:\\python\\result.json";
	JSONObject test;
	//생성자
	public SeleniumTest() {
		try {
			FileReader jsonReader = new FileReader(new File(JSON_PATH));
			test = new JSONObject();
			test.fromObject(jsonReader);
			System.out.println(test);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("파일 불러오기가 실패했습니다.");
		}
	}
	
	//json객체 가져오
	public String getJSON() {
		return test.toString();
	}
}
