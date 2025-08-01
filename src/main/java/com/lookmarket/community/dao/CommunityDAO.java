package com.lookmarket.community.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.community.vo.BlackBoardVO;
import com.lookmarket.community.vo.ReviewVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface CommunityDAO {
	public List<BlackBoardVO> blackBoardList() throws DataAccessException;
	public List<ReviewVO> communityList() throws DataAccessException;
	public void insertReview(ReviewVO reviewVO) throws Exception;
}
