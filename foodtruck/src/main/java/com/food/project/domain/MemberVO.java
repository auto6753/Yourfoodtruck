package com.food.project.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String m_mail;
	private String m_passwd;
	private String m_name;
	private String m_nicname;
	private int m_position;
	private int m_license;
	private String company;
	private int hp;

}
