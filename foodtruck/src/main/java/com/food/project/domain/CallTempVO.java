package com.food.project.domain;

//import java.util.Date;
import lombok.Data;

@Data
public class CallTempVO {
	private String merchant_uid;
	private int paid_amount;
	private int apply_num;
	private String imp_uid;
			
}
