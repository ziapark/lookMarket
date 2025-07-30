package com.lookmarket.community.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.lookmarket.community.vo.BlackBoardVO;

@Repository("community")
public class CommunityDAOImpl implements CommunityDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<BlackBoardVO> blackBoardList() throws DataAccessException{
		return (ArrayList)sqlSession.selectList("mapper.community.blackBoardList");
	}
}
