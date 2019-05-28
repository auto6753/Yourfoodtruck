
package com.food.project.domain;

import java.util.Date;
import lombok.Data;

@Data
public class OnboardVO {
	private Date onboard_date;
	private String brandname;
	private String email;
	private String truck_code;
	private String hours;
	private int onboard_state;
	private Date out_date;
	
}
