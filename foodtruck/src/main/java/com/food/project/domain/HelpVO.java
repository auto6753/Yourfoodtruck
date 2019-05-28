package com.food.project.domain;

import lombok.Data;

@Data
public class HelpVO {
	private String email;
	private String question_code;
	private String question_title;
	private String question_content;
	private String question_regdate;
	private int qu_category;
	private String answer_email;
	private String qu_replay_content;
	private String qu_replay_date;
}
