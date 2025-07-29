package com.lookmarket.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lookmarket.member.vo.MemberVO;
import com.lookmarket.mypage.dao.MyPageDAO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Override
	public MemberVO getMyPageInfo(String current_id) throws Exception{
		return myPageDAO.getMyPageInfo(current_id);
	}
	
	
}
