package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CallListVO {
	private String merchant_uid;
	private String name;
	private String email;
	private String truck_code;
	private String calltel;
	private String place;
	private String festival_starttime;
	private String festival_endtime;
	private String reporting_date;
	private String festival_startdate;
	private String festival_enddate;
//	private Date festival_starttime;
//	private Date festival_endtime;
//	private Date reporting_date;
//	private Date festival_startdate;
//	private Date festival_enddate;
	private int price;
	private int progress;
	private int pay_status;
	private Date request_date;
	private String festival_name;
	private Date deposit_name;
	private int advance_rate;
	private String content;
	private String zip_code;
}
