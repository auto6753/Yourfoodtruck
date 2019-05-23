package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private String payment_code;
	private String truck_code;
	private String menu_code;
	private int amount;
	private int total_price;
	private int payment_class;
	private String payment_telephone;
	private Date payment_date;
	
	private String menu_name;
	int menu_category;
	int unit_price;
}
