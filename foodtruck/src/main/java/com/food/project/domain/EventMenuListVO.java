package com.food.project.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class EventMenuListVO {
	String event_code;
	ArrayList<String> menu_name;
	ArrayList<Integer> discount;
	
	public EventMenuListVO() {
		menu_name = new ArrayList();
		discount = new ArrayList();
	}
	
	public void addMenu(String menuName, int discount) {
		menu_name.add(menuName);
		this.discount.add(discount);
	}
}
