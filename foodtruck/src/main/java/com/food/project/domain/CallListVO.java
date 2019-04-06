package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CallListVO {
	private String email;
	private String truck_code;
	private String place;
	private Date festival_date;
	private int price;
	private int progress;
	private String festival_name;
	private Date deposit_name;
	private int advance_rate;
}
