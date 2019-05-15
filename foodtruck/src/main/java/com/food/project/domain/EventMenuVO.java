package com.food.project.domain;

import lombok.Data;

@Data
public class EventMenuVO {
	
	private String event_code;
	private String menu_code;
	private String menu_name;
	private int discount;
	
}
