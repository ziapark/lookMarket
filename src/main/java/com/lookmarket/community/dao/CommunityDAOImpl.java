package com.lookmarket.community.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.lookmarket.community.vo.BlackBoardVO;
import com.lookmarket.community.vo.ReviewVO;

@Repository("community")
public class CommunityDAOImpl implements CommunityDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BlackBoardVO> blackBoardList() throws DataAccessException{
		return (ArrayList)sqlSession.selectList("mapper.community.blackBoardList");
	}
	
	@Override
	public List<ReviewVO> communityList() throws DataAccessException{
		return (ArrayList)sqlSession.selectList("mapper.community.communityList");
	}
	@Override
	public void insertReview(ReviewVO reviewVO) throws DataAccessException{
		sqlSession.insert("mapper.community.insertReview", reviewVO);
	}
}
