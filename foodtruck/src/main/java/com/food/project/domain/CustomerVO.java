package com.food.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerVO {
	private String email;
	private Date regdate;
	private String password;
	private String telephone;
	private int position;
	private String nickname;

}
