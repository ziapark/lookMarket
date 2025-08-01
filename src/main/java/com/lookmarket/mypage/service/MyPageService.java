package com.lookmarket.mypage.service;

import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface MyPageService {
	public MemberVO getMyPageInfo(String current_id) throws Exception;
	
	public boolean updateMyInfo(MemberVO memberVO) throws Exception;
}
