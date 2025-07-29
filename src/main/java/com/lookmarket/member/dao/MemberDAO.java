package com.lookmarket.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.lookmarket.member.vo.MemberVO;

public interface MemberDAO {
	public String checkId(String m_id) throws DataAccessException;
	public String login(String m_id, String m_pw) throws DataAccessException;
	public MemberVO selectMemberByEmail(String email) throws DataAccessException;
	public String selectOverlappedID(String m_id) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
}
