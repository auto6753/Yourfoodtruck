package com.food.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FoodTruckVO {
	private String truck_code;
	private String crn;
	private String trucknum;
	private String account;
	private int layout;
	private String hours;
	private String weekend_hours;
	private String brandname;
	private Date truck_regdate;
	private String email;
	
}
