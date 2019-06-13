package com.food.project.domain;

import lombok.Data;

@Data
public class CallListDetailDTO {
	private String place;
	private String festival_name;
	private String startdate;
	private String enddate;
	private String festival_starttime;
	private String festival_endtime; 
	private int price;
	private int progress;
	private int pay_status;
	private String merchant_uid;
	private String requestdate;
	private String content;
	private String brandname;
	private String telephone;
	
}
