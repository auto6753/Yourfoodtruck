package com.food.project.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class EventVO {
	private String event_name;
	private Date event_start;
	private Date event_end;
	private String target;
	// 메뉴, 할인액
	private String event_content;
	// 결제수단
	private int combinable;
	private String brandname;
}
