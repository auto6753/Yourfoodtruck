package com.food.project.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.food.project.domain.PostVO;
import com.food.project.domain.ReplyVO;
import com.food.project.paging.PostPager;
public interface PostMapper {
	
	//post_class 가 0: 푸드트럭 뉴스
	//				1: 이벤트
	
	//게시글 리스트 불러오기
	public ArrayList<PostVO> getPostList(int post_class);
	public ArrayList<Map<String,Object>> allList(Map<String,Object> map);
	//게시글 불러오기
	public PostVO getPost(String post_code);
	//게시글 등록하기
	public void insertPost(PostVO vo);
	//상세보기정보 수정페이지로 넘기기
	public PostVO getSpecific(PostVO vo);
	//게시글 수정하기
	public void updatePost(PostVO vo);
	//게시글 삭제하기
	public int deletePost(PostVO vo);
	
	
	//댓글 가져오기
	public ArrayList<ReplyVO> getReply(String post_code);
	//댓글 등록하기
	public int insertReply(ReplyVO vo);
	//조회수
	public void updatePostvisit(String post_code);
	//총 게시글 개수 구하기
	public Map<String,Object> totalPage(int post_class);
	public Map<String,Object> totalPage2(Map<String,Object> map);
	
	

}
