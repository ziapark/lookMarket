package com.lookmarket.community.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lookmarket.community.dao.CommunityDAO;
import com.lookmarket.community.vo.BlackBoardVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityDAO communityDAO;
	
	public List<BlackBoardVO> blackBoardList() throws Exception{
		return communityDAO.blackBoardList();
	}
}
