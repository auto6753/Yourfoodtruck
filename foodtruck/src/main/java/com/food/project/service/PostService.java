package com.food.project.service;

import java.util.ArrayList;

import com.food.project.domain.PostVO;
import com.food.project.domain.ReplyVO;

public interface PostService {
	//post_class 가 0: 푸드트럭 뉴스
	//				1: 이벤트
	
	//게시글 리스트 불러오기
	public ArrayList<PostVO> getPostList();
	//게시글 리스트 불러오기
	public PostVO getPost(String post_code);
	//게시글 등록하기
	public int insertPost(PostVO vo);
	//게시글 수정하기
	public int updatePost(PostVO vo);
	//게시글 삭제하기
	public int deletePost(String post_code,int post_class);
	
	
	//댓글 가져오기
	public ArrayList<ReplyVO> getReply(String post_code);
	//댓글 등록하기
	public int insertReply(ReplyVO vo);
}
