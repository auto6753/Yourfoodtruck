package com.food.project.domain;

import lombok.Data;

@Data
public class MenuVO {

	private String menu_code;
	private String menu_name;
	private String menu_url;
	private int menu_category;
	private int unit_price;
	private String menu_desc;
	private String truck_code;
	
}
