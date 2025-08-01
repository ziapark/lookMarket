package com.lookmarket.mypage.dao;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.member.vo.MemberVO;

public interface MyPageDAO {
	public MemberVO getMyPageInfo(String current_id) throws DataAccessException;
	
	public boolean updateMyInfo(MemberVO memberVO) throws Exception;
}
