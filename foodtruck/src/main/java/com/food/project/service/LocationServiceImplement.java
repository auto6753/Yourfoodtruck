package com.food.project.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.LocationVO;
import com.food.project.mapper.LocationMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LocationServiceImplement implements LocationService {
	
	LocationMapper mapper;
	
//	@Override
//	public void insertLoc(LocationVO vo) {
//		mapper.insertLoc(vo);
//	}

//	@Override
//	public ArrayList<LocationVO> getLocation(LocationVO vo,String email) {
//		return mapper.getLocation(vo, email);
//	}

	@Override
	public ArrayList<LocationVO> getLoc() {
		return mapper.getLoc();
	}

}
