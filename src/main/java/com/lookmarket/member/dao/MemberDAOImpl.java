package com.lookmarket.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.lookmarket.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	public String checkId(String m_id) throws DataAccessException{
		return sqlSession.selectOne("mapper.member.checkId", m_id);
	}
	
	@Override
	public String login(String m_id, String m_pw) throws DataAccessException{
		memberVO.setM_id(m_id);
		memberVO.setM_pw(m_pw);
		
		return sqlSession.selectOne("mapper.member.login", memberVO);
	}
	
	@Override
	public MemberVO selectMemberByEmail(String email) throws DataAccessException{
		memberVO = (MemberVO)sqlSession.selectOne("mapper.member.selectMemberByEmail", email);
		return memberVO;
	}
	
	@Override
	public String selectOverlappedID(String m_id) throws DataAccessException{
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", m_id);
		return result;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}
}
