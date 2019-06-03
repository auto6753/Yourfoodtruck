package com.food.project.domain;

import lombok.Data;

@Data
public class PeriodDTO {
	private String truck_code;
	private int onboard_state;
	private String beginDate;
	private String endDate;
}
