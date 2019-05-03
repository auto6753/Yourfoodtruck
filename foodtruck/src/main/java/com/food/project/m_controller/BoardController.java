package com.food.project.m_controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.food.project.domain.BoardSearchVO;

@Controller
public class BoardController{

	@RequestMapping(value = "/board/**/boardList")
    public String boardList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") BoardSearchVO boardSearchVO) {
		String jspPath =req.getRequestURI();
		 
		///////paging : S//////////////////////////////
		int pageSize = boardSearchVO.getPageSize();// 한페이지에 나오는 게시물 개수
		int pageIndex = boardSearchVO.getPageIndex(); //현재 선택한 페이지 number
		int pageGroupSize = boardSearchVO.getPageGroupSize(); // 페이지 번호가 몇개 나오느냐 개수
		int startRow = (pageIndex - 1) * pageSize + 1;// 한 페이지의 시작글 번호
		int endRow = pageIndex * pageSize;// 한 페이지의 마지막 글번호

		boardSearchVO.setStartRow(startRow);
		boardSearchVO.setEndRow(endRow);
		int count = 1;//boardService.boardCount(boardSearchVO); //게시물 총 개수

		int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
		int nowPageGroup = (int) Math.ceil((double) pageIndex / pageGroupSize);

		//List<PostVO> boardList = boardService.boardList(boardSearchVO);
		
		modelMap.put("pageIndex", pageIndex);
		modelMap.put("pageSize", pageSize);
		modelMap.put("count", count);
		modelMap.put("pageGroupSize", pageGroupSize);
		modelMap.put("nowPageGroup", nowPageGroup);
		modelMap.put("pageGroupCount", pageGroupCount);
	//	modelMap.put("articleList", //boardList);
		modelMap.put("boardSearchVO", boardSearchVO);
		
        return "news/news";
    }
}
