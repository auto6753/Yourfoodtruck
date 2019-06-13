package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.LocationVO;
import com.food.project.domain.MenuVO;
import com.food.project.mapper.SellerMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SellerServiceImplement implements SellerService {
	SellerMapper sellermapper;

	@Override
	public ArrayList<MenuVO> getmenu(String truck_code) {
		// TODO Auto-generated method stub
		
		return sellermapper.getmenu(truck_code);
	}
	
	@Override
	public void insertmenu(MenuVO vo) {
		// TODO Auto-generated method stub
		//System.out.println("?업로드?");
		sellermapper.insertmenu(vo);
		//System.out.println("?업2로2드?");
	}

	@Override
	public void updatemenu(MenuVO vo) {
		sellermapper.updatemenu(vo);
		
	}

	@Override
	public void insertlocaction(LocationVO vo) {
		// TODO Auto-generated method stub
		sellermapper.insertlocation(vo);
	}

	@Override
	public void deletemenu(String menu_code) {
		// TODO Auto-generated method stub
		sellermapper.deletemenu(menu_code);
	}

	@Override
	public CustomerVO getCustomer(String truck_code) {
		// TODO Auto-generated method stub
		
		return sellermapper.getCustomer(truck_code);
	}

//	@Override
//	public void deletemenu(String menu_code) {
//		// TODO Auto-generated method stub
//		//System.out.println(menu_code);
//		sellermapper.deletemenu(menu_code);
//	}

}
