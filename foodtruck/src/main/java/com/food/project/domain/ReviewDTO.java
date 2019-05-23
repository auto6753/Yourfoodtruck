package com.food.project.domain;

import java.sql.Date;

import lombok.Data;
@Data
public class ReviewDTO {

	private String truck_code;
	private String email;
	private Date review_regdate;
	private int review_score;
	private String review_content;
	private String review_reply_content;
	private Date review_reply_regdate;
	private String review_code;
	private String nickname;
}
