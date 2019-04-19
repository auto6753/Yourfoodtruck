package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.OnboardVO;
import com.food.project.domain.PaymentVO;
import com.food.project.mapper.OnboardMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OnboardServiceimplement implements OnboardService{
	OnboardMapper mapper;

	@Override
	public ArrayList<OnboardVO> getOnboard(String email) {
		return mapper.getOnboard(email);
	}
	
}
