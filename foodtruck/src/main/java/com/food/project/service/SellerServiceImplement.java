package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.MenuVO;
import com.food.project.mapper.SellerMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class SellerServiceImplement implements SellerService {
	private SellerMapper sellermapper;

	@Override
	public ArrayList<MenuVO> getmenu(String truckcode) {
		// TODO Auto-generated method stub
		System.out.println("D");
		
		return sellermapper.getmenu(truckcode);
	}

}
