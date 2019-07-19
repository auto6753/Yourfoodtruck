package com.food.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class RequestdataVO {

	public String request_data_code;
	public int request_status;
	public String request_truck_code;
	public String request_code;
	public Date request_data_regdate;
}

