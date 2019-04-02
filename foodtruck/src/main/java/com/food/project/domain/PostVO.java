package com.food.project.domain;

import java.util.Date;
import lombok.Data;

@Data
public class PostVO {
	private String post_code;
	private Date post_regdate;
	private Date post_moddate;
	private String post_content;
	private String post_title;
	private int post_visit;
	private String post_url;
	private int post_class;
}
