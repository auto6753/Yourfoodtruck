package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.food.project.domain.PermittedAreaVO;
import com.food.project.mapper.AreaMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AreaServiceImplement implements AreaService {
	
	AreaMapper mapper;
	@Override
	public ArrayList<PermittedAreaVO> getArea(int sido) {
		return mapper.getArea(sido);
	}
	@Override
	public ArrayList<Map<String, Object>> allList(int start, int end, String keyword, int sido) {
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		map.put("keyword", keyword);
		map.put("sido", sido);
		return mapper.allList(map);
	}
	@Override
	public int totalPage(int sido) {
		Map<String,Object> result=mapper.totalPage(sido);
		int tot_page=Integer.parseInt(String.valueOf(result.get("TOT_PAGE")));
		return tot_page;
	}
	@Override
	public int totalPage2(int sido, String keyword) {
		Map<String,Object> map=new HashMap<>();
		map.put("sido",sido);
		map.put("keyword", keyword);
		Map<String,Object> result=mapper.totalPage2(map);
		int tot_page=Integer.parseInt(String.valueOf(result.get("TOT_PAGE")));
		return tot_page;
	}
	

}
