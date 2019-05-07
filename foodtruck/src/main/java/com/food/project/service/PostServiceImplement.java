package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public ArrayList<PostVO> getPostList(int post_class) {	return mapper.getPostList(post_class);}
	//페이징 게시글 목록
	@Override
	public ArrayList<Map<String,Object>> allList(int start, int end, String keyword, int post_class) {	
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		map.put("post_class", post_class);
		
		return mapper.allList(map);	}
	//특정 게시글
	@Override
	public PostVO getPost(String post_code) {	return mapper.getPost(post_code);}
	//조회수
	@Override
	public void updatePostvisit(String post_code) { mapper.updatePostvisit(post_code);}
	//상세보기정보 수정페이지로이동
	@Override
	public PostVO getSpecific(PostVO vo) { return mapper.getSpecific(vo);}
	//게시글 등록
	@Override
	public void insertPost(PostVO vo) {	mapper.insertPost(vo);}
	//게시글 수정
	@Override
	public void updatePost(PostVO vo) {	 mapper.updatePost(vo);}
	//게시글 삭제
	@Override
	public void deletePost(PostVO vo) { mapper.deletePost(vo);}
	//댓글 가져오기
	@Override
	public ArrayList<ReplyVO> getReply(String post_code) {	return mapper.getReply(post_code);}
	//댓글 등록하기
	@Override
	public int insertReply(ReplyVO vo) {	return mapper.insertReply(vo);}
	//게시글 총 갯수 불러오기
	@Override
	public int totalPage(int post_class) {
		Map<String,Object> map=mapper.totalPage(post_class);
		System.out.println(map.toString());
		int tot_page=Integer.parseInt(String.valueOf(map.get("TOT_PAGE")));
		return tot_page;	
	}
	@Override
	public int totalPage2(int post_class, String keyword) {
		Map<String,Object> map=new HashMap<>();
		map.put("post_class",post_class);
		map.put("keyword", keyword);
		System.out.println(map.toString());
		Map<String,Object> result=mapper.totalPage2(map);
		System.out.println(result.toString());
		int tot_page=Integer.parseInt(String.valueOf(result.get("TOT_PAGE")));
		return tot_page;
	}
	
	

	

}
