package com.lookmarket.member.service;

import java.util.Map;

import com.lookmarket.member.vo.MemberVO;

public interface MemberService {
	public String checkId(String m_id) throws Exception;
	public MemberVO login(String m_id, String m_pw) throws Exception;
	public String overlapped(String m_id) throws Exception;
	public void addMember(MemberVO memnberVO) throws Exception;
	public String findId(String m_name, String m_email) throws Exception;
	public String findPw(String m_id, String m_name) throws Exception;
	public void reSignUp(String m_id) throws Exception;
}
