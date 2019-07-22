package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Request_DataVO {
	private String request_data_code;
	private int request_status;
	private String request_truck_code;
	private String request_code;
	private Date request_data_regdate;
	
}
