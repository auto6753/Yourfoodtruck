package com.food.project.domain;

import lombok.Data;

@Data
public class PermittedAreaVO {
	private String sido_name;
	private String addr;
	private String area_name;
	private double latitude;
	private double longitude;
	private String govern_name;
	private String govern_phone;
}
