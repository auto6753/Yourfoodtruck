package com.food.project.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.food.project.domain.PermittedAreaVO;

public interface AreaService {
	public ArrayList<PermittedAreaVO> getArea(int sido);
	public ArrayList<Map<String,Object>> allList(@Param("start") int start,@Param("end") int end,
			@Param("keyword")String keyword,@Param("sido") int sido);
	public int totalPage(int sido);
	public int totalPage2(@Param("sido")int sido, @Param("keyword") String keyword);
	
}
