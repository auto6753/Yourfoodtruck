package com.food.project.domain;

import lombok.Data;

@Data
public class BoardSearchVO extends ListPagingVO{
	private String title;
	private String usr_id;
	private String usr_name;

}
