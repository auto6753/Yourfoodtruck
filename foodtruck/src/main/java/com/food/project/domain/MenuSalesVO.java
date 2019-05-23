package com.food.project.domain;

import lombok.Data;
@Data
public class MenuSalesVO {
	String menu_code;
	String menu_name;
	int amount;
	int totalPrice;
	int unitPrice;
	
	public void add(int amount,int totalPrice) {
		this.totalPrice = this.totalPrice + totalPrice;
		this.amount = this.amount + amount;
	}

}
