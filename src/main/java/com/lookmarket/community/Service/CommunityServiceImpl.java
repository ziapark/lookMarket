package com.lookmarket.community.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lookmarket.community.dao.CommunityDAO;
import com.lookmarket.community.vo.BlackBoardVO;
import com.lookmarket.community.vo.ReviewVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityDAO communityDAO;
	
	@Override
	public List<BlackBoardVO> blackBoardList() throws Exception{
		return communityDAO.blackBoardList();
	}
	
	@Override
	public List<ReviewVO> communityList() throws Exception{
		return communityDAO.communityList();
	}
<<<<<<< HEAD
	@Override
	public void insertReview(ReviewVO reviewVO) throws Exception{
		communityDAO.insertReview(reviewVO);
=======
	
	@Override
	public ReviewVO communityDetail(int r_id) throws Exception{
		return communityDAO.communityDetail(r_id);
	}
	
	@Override
	public void upHit(int r_id, int hit) throws Exception{
		communityDAO.upHit(r_id, hit);
>>>>>>> 569a9bca5c2f1b7b8f626c735025bb50314ab963
	}
}
