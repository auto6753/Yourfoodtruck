package com.food.project.domain;

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
}
