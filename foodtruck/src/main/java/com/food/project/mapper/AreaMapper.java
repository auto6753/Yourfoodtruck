package com.food.project.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.food.project.domain.CallListVO;
import com.food.project.domain.PermittedAreaVO;


public interface AreaMapper {
	public ArrayList<PermittedAreaVO> getArea(int sido);
	public ArrayList<Map<String,Object>> allList(Map<String,Object> map);
	public Map<String,Object> totalPage(int sido);
	public Map<String,Object> totalPage2(Map<String,Object> map);
}
