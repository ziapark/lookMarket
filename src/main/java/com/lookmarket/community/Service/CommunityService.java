package com.lookmarket.community.Service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.community.vo.BlackBoardVO;
import com.lookmarket.community.vo.ReviewVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface CommunityService {
	public List<BlackBoardVO> blackBoardList() throws Exception;
	public List<ReviewVO> communityList() throws Exception;
<<<<<<< HEAD
	public void insertReview(ReviewVO reviewVO) throws Exception;
=======
	public ReviewVO communityDetail(int r_id) throws Exception;
	public void upHit(int r_id, int hit) throws Exception;
>>>>>>> 569a9bca5c2f1b7b8f626c735025bb50314ab963
}
