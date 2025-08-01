package com.lookmarket.mypage.dao;

import org.springframework.dao.DataAccessException;

import com.lookmarket.mypage.vo.MyPageVO;

public interface MyPageDAO {
	public MyPageVO getMyPageInfo(String current_id) throws DataAccessException;
	public int updateMyInfo(MyPageVO myPageVO) throws DataAccessException;
	int deleteMember(String m_id) throws Exception;
}
