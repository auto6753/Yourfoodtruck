package com.food.project.service;

import java.util.List;

import com.food.project.domain.BoardSearchVO;
import com.food.project.domain.PostVO;

public interface BoardService {
	
	int boardCount(BoardSearchVO boardSearchVO);
	List<PostVO> boardList(BoardSearchVO boardSearchVO); 
}
