package com.food.project.domain;



import java.util.Date;

import lombok.Data;

@Data
public class MaineventDTO {

		private String brandname;
		private String event_code;
		private Date event_start;
		private Date event_end;
		private String truck_code;
		private String event_url;
		private String event_name;
}
