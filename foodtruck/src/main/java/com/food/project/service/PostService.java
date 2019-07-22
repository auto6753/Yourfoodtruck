package com.food.project.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.food.project.domain.PostVO;
import com.food.project.domain.RecruitVO;
import com.food.project.domain.ReplyVO;
import com.food.project.domain.Request_DataDTO;
import com.food.project.domain.Request_DataVO;
import com.food.project.domain.ReviewVO;

public interface PostService {

	//post_class 가 0: 푸드트럭 뉴스
	//				1: 이벤트
	//				2: 허가구역
	//				3: 모집공고
	
	//게시글 리스트 불러오기
	public ArrayList<PostVO> getPostList(int post_class);
	public ArrayList<Map<String,Object>> allList(@Param("start") int start,@Param("end") int end,
			@Param("keyword")String keyword,@Param("post_class") int post_class);
	//게시글 불러오기
	public PostVO getPost(String post_code);
	//게시글 상세보기 시 조회수 증가
	public void updatePostvisit(String post_code);
	//게시글 등록하기
	public void insertPost(PostVO vo);
	//상세보기정보 수정페이지로 넘기기
	public PostVO getSpecific(PostVO vo);
	//게시글 수정하기
	public void updatePost(PostVO vo);
	//게시글 삭제하기
	public void deletePost(PostVO vo);
	public String deleteAnnounce();
	
	//댓글 가져오기
	public ArrayList<ReplyVO> getReply(String post_code);
	//댓글 등록하기
	public int insertReply(ReplyVO vo);
	
	// 총 페이지 갯수 가져오기
	public int totalPage(int post_class);
	public int totalPage2(@Param("post_class")int post_class, @Param("keyword") String keyword);
	
	public ArrayList<ReviewVO> getReview(String email);
	//일반모집공고 등록하기
	public void addRecruit(RecruitVO vo);
	//일반모집공고 목록불러오기
	public ArrayList<RecruitVO> getList(RecruitVO vo);
	//일반모집공고 상세보기
	public RecruitVO getRequestspecific(String request_code);
	//일반모집공고 조회수
	public void updateVisit(String request_code);
	//일반모집공고 삭제
	public void deleteRequest(RecruitVO vo);
	//일반모집공고 수정페이지 이동
	public RecruitVO getRequestmodify(String request_code);
	//일반모집공고 수정하기
	public void requestmodifysuccess(RecruitVO vo);
	//일반모집공고 참가신청하기
	public void requestsuccess(Request_DataVO vo);
	
	//일반모집공고 참여현황 올리기
	public void updaterequestsuccess(RecruitVO vo1);
	//내가쓴 모집공고 불러오기
	public ArrayList<RecruitVO> getMyRequest(String email);

	//해당 글의 모집공고 참가 신청자 보기 
	public ArrayList<Request_DataDTO> getRequest_data(String request_code);
	public Request_DataVO requestck(Request_DataVO vo);
	
	
	
	
	
	

	
}
