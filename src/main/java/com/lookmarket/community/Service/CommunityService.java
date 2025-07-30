package com.lookmarket.community.Service;

import java.util.List;

import com.lookmarket.community.vo.BlackBoardVO;
import com.lookmarket.community.vo.ReviewVO;

public interface CommunityService {
	public List<BlackBoardVO> blackBoardList() throws Exception;
	public List<ReviewVO> communityList() throws Exception;
}
