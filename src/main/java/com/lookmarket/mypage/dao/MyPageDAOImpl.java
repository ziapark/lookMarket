package com.lookmarket.mypage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.lookmarket.member.vo.MemberVO;
import com.lookmarket.mypage.vo.MyPageVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MyPageVO myPageVO;
	
	@Override
	public MyPageVO getMyPageInfo(String current_id) throws DataAccessException{
		myPageVO = (MyPageVO)sqlSession.selectOne("mapper.mypage.getMyPageInfo", current_id);
		return myPageVO;
	}
	
	@Override
	public int updateMyInfo(MyPageVO myPageVO) throws DataAccessException{
		return sqlSession.update("mapper.mypage.updateMyInfo", myPageVO);
	}
	
	@Override
	public int deleteMember(String m_id) throws DataAccessException {
		return sqlSession.update("mapper.mypage.deleteMyInfo", m_id);
	}
}
