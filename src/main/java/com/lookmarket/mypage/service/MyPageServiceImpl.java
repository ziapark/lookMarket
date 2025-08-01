package com.lookmarket.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lookmarket.member.vo.MemberVO;
import com.lookmarket.mypage.dao.MyPageDAO;
import com.lookmarket.mypage.vo.MyPageVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Override
	public MyPageVO getMyPageInfo(String current_id) throws Exception{
		return myPageDAO.getMyPageInfo(current_id);
	}
	
	@Override
	public int updateMyInfo(MyPageVO myPageVO) throws Exception{
		return myPageDAO.updateMyInfo(myPageVO);
	}
	
	
}
