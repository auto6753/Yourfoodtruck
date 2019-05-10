package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EventVO {
	private String truck_code;
	private String event_name;
	private Date event_start;
	private Date event_end;
	private String event_target; 
	private String event_content;
	private int event_payment;
	private int event_combinable;
}
