package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private String post_code;
	private Date reply_regdate;
	private Date reply_moddate;
	private String reply_content;
	private String reply_num;
}
