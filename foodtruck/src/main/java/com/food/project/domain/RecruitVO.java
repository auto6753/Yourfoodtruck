package com.food.project.domain;

import java.util.Date;
import lombok.Data;
@Data
public class RecruitVO {
	public String request_code;
	public String request_title;
	public String request_content;
	public int request_truck_count;
	public int request_view;
	public String request_email;
	public Date request_regdate;
	public String request_start;
	public String request_end;
	public int request_status;
}
