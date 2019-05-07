package com.food.project.domain;

public class Pagination {
	//페이지당 게시물 수
	public static final int post = 10;
	//화면당 페이지 수 
	public static final int block = 10;
	//현재 페이지
	private int curPage;
	//이전 페이지
	private int prevPage;
	//다음 페이지
	private int nextPage;
	//전체 페이지 갯수
	private int totalPage;
	//전체 페이지 블록 갯수
	private int totalBlock;
	//현재 페이지 블록
	private int curBlock;
	//이전페이지 블록
	private int prevBlock;
	//다음 페이지 블록
	private int nextBlock;
	//시작
	private int pageBegin;
	//끝
	private int pageEnd;
	//현재페이지 블록의 시작번호
	private int blockBegin;
	//현재페이지 블록의 끝번호
	private int blockEnd;
}
