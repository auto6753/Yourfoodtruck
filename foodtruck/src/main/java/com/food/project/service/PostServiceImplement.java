package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.PostVO;
import com.food.project.domain.ReplyVO;
import com.food.project.mapper.PostMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class PostServiceImplement implements PostService {
	//post_class 가 0: 푸드트럭 뉴스
	//				1: 이벤트
	
	PostMapper mapper;
	//게시글 목록
	@Override
	public ArrayList<PostVO> getPostList() {	return mapper.getPostList();}
	//특정 게시글
	@Override
	public PostVO getPost(String post_code) {	return mapper.getPost(post_code);}
	//게시글 등록
	@Override
	public void insertPost(PostVO vo) {	mapper.insertPost(vo);}
	//게시글 수정
	@Override
	public int updatePost(PostVO vo) {	return mapper.updatePost(vo);}
	//게시글 삭제
	@Override
	public int deletePost(String post_code,int post_class) {	return mapper.deletePost(post_code, post_class);}
	//댓글 가져오기
	@Override
	public ArrayList<ReplyVO> getReply(String post_code) {	return mapper.getReply(post_code);}
	//댓글 등록하기
	@Override
	public int insertReply(ReplyVO vo) {	return mapper.insertReply(vo);}
	

	

}
