package com.food.project.domain;

import java.util.Date;
import lombok.Data;

@Data
public class PostVO{
	private String post_code;
	private String post_regdate;
	private String post_moddate;
	private String post_content;
	private String post_title;
	private int post_visit;
	private String post_url;
	private int post_class;
}
