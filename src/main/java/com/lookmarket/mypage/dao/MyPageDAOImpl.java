package com.lookmarket.mypage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.lookmarket.member.vo.MemberVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	public MemberVO getMyPageInfo(String current_id) throws DataAccessException{
		memberVO = (MemberVO)sqlSession.selectOne("mapper.mypage.getMyPageInfo", current_id);
		return memberVO;
	}
}
