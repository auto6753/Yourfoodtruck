package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.food.project.domain.OnboardCountDTO;
import com.food.project.domain.OnboardVO;
import com.food.project.domain.PaymentVO;
import com.food.project.domain.PeriodDTO;
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
	@Override
	public void DeleteOnboard(String truck_code) {
		mapper.DeleteOnboard(truck_code);
	}
	@Override
	public ArrayList<OnboardVO> getOnSale(String email) {
		return mapper.getOnSale(email);
	}
	@Override
	public void insertOnboard(OnboardVO br) {
		mapper.insertOnboard(br);
	}
	@Override
	public ArrayList<OnboardVO> rideck(OnboardVO on) {
		return mapper.rideck(on);
	}
	@Override
	public void Deleteride(OnboardVO on) {
		mapper.Deleteride(on);
	}
	@Override
	public void updateOutdate(OnboardVO on) {
		mapper.updateOutdate(on);
	}
	@Override
	public void updateOnboarddate(OnboardVO on) {
		mapper.updateOnboarddate(on);
	}
	@Override
	public ArrayList<OnboardCountDTO> CountOnboard(OnboardVO br) {
		/* ArrayList<HashMap<String,Object>> mdf=mapper.CountOnboard(br); */
		return mapper.CountOnboard(br);
	}
	@Override
	public ArrayList<OnboardCountDTO> countonboarddate(PeriodDTO period) {
		return mapper.countonboarddate(period);
	}
}
