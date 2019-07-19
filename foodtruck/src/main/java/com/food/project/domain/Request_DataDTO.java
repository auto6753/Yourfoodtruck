package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Request_DataDTO {
	//private String request_data_code;
	private String brandname;
	private String telephone;
	private String request_truck_code;
	private Date request_data_regdate;
	private String request_code;
	
}
