package com.lookmarket.community.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.lookmarket.community.vo.BlackBoardVO;

public interface CommunityDAO {
	public List<BlackBoardVO> blackBoardList() throws DataAccessException;
}
