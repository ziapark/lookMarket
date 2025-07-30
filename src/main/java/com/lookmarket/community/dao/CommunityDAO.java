package com.lookmarket.community.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.lookmarket.community.vo.BlackBoardVO;
import com.lookmarket.community.vo.ReviewVO;

public interface CommunityDAO {
	public List<BlackBoardVO> blackBoardList() throws DataAccessException;
	public List<ReviewVO> communityList() throws DataAccessException;
}
