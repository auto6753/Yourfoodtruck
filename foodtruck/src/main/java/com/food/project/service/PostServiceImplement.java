package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.food.project.domain.PostVO;
import com.food.project.domain.RecruitVO;
import com.food.project.domain.ReplyVO;
import com.food.project.domain.Request_DataDTO;
import com.food.project.domain.ReviewVO;
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
	@Override
	public String deleteAnnounce() {
		ArrayList<PostVO> hasAnnounce = mapper.getPostList(1);
		if(hasAnnounce.isEmpty()) {
			return "empty";
		}else {
			return "not_empty";
		}
	}
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
	
	@Override
	public ArrayList<ReviewVO> getReview(String email) { return mapper.getReview(email);}
	
	@Override //내가쓴 모집공고 불러오기
	public ArrayList<RecruitVO> getMyRequest(String email) {
		// TODO Auto-generated method stub
		return mapper.getMyRequest(email);
		
	}
	
	@Override //해당 글의 모집공고 참가 신청자 보기 
	public ArrayList<Request_DataDTO> getRequest_data(String request_code) {
		// TODO Auto-generated method stub
		
		return mapper.getRequest_data(request_code);
	}
	@Override
	public void addRecruit(RecruitVO vo) {
		mapper.addRecruit(vo);
		
	}
	//일반모집공고목록 불러오기
	@Override
	public ArrayList<RecruitVO> getList(RecruitVO vo) {
		
		return mapper.getList(vo);
	}
	//일반모집공고 상세보기
	@Override
	public RecruitVO getRequestspecific(String request_code) {
		// TODO Auto-generated method stub
		return mapper.getRequestspecific(request_code);
	}
	//일반모집공고 조회수
	@Override
	public void updateVisit(String request_code) {
		// TODO Auto-generated method stub
		mapper.updateVisit(request_code);
		
	}
	//일반모집공고 삭제
	@Override
	public void deleteRequest(RecruitVO vo) {
		
		mapper.deleteRequest(vo);
	}
	//일반모집공고 수정페이지 이동
	@Override
	public RecruitVO getRequestmodify(String request_code) {
		
		return mapper.getRequestmodify(request_code);
	}
	//일반모집공고 수정하기
	@Override
	public void requestmodifysuccess(RecruitVO vo) {
		
		mapper.requestmodifysuccess(vo);
		
	}


}
