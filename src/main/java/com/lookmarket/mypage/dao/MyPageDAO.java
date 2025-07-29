package com.lookmarket.mypage.dao;

import org.springframework.dao.DataAccessException;

import com.lookmarket.member.vo.MemberVO;

public interface MyPageDAO {
	public MemberVO getMyPageInfo(String current_id) throws DataAccessException;
}
