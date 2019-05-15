
package com.food.project.domain;

import java.sql.Date;
import lombok.Data;

@Data
public class OnboardVO {
	private Date onboard_date;
	private String brandname;
	private String email;
	private String truck_code;
	private String hours;
}
