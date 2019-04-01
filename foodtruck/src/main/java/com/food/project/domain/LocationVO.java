package com.food.project.domain;


import java.sql.Timestamp;

import lombok.Data;
@Data
public class LocationVO {
	private String truck_code;
	private Timestamp loc_time;
	private String lat_y;
	private String lng_x;
}
