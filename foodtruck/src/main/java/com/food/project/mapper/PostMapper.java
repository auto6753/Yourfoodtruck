package com.food.project.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.PostVO;
import com.food.project.domain.RecruitVO;
import com.food.project.domain.ReplyVO;
import com.food.project.domain.Request_DataDTO;
import com.food.project.domain.Request_DataVO;
import com.food.project.domain.ReviewVO;
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
	public void deleteAnnounce();
	
	//댓글 가져오기
	public ArrayList<ReplyVO> getReply(String post_code);
	//댓글 등록하기
	public int insertReply(ReplyVO vo);
	//조회수
	public void updatePostvisit(String post_code);
	//총 게시글 개수 구하기
	public Map<String,Object> totalPage(int post_class);
	public Map<String,Object> totalPage2(Map<String,Object> map);
	
	public ArrayList<ReviewVO> getReview(String email);
	public void addRecruit(RecruitVO vo);
	public ArrayList<RecruitVO> getList(RecruitVO vo);
	public RecruitVO getRequestspecific(String request_code);

	public void updateVisit(String request_code);
	public void deleteRequest(RecruitVO vo);
	public RecruitVO getRequestmodify(String request_code);
	public void requestmodifysuccess(RecruitVO vo);

	//내가 쓴 모집공고불러오기
	public ArrayList<RecruitVO> getMyRequest(String email);
	
	//해당 글의 모집공고 참가 신청자 보기 
	public ArrayList<Request_DataDTO> getRequest_data(String request_code);
	public void requestsuccess(Request_DataVO vo);
	public void updaterequestsuccess(RecruitVO vo1);
	public Request_DataVO requestck(Request_DataVO vo);
	public void requestupdate(String request_code);
	public void requestdataup(Request_DataVO vo);
	public ArrayList<FoodTruckVO> requestselecttruck(String request_code);


}
