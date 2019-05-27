package com.food.project.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MainPageRankDTO {
	private String truck_code;
	private int rank;
	private String truck_url;
	private String brandname;
	private int score;
	
}
