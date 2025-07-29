package com.lookmarket.mypage.service;

import com.lookmarket.member.vo.MemberVO;

public interface MyPageService {
	public MemberVO getMyPageInfo(String current_id) throws Exception;
}
