package com.lookmarket.member.service;

import java.util.Map;

import com.lookmarket.member.vo.MemberVO;

public interface MemberService {
	public String checkId(String m_id) throws Exception;
	public String login(String m_id, String m_pw) throws Exception;
	public String overlapped(String m_id) throws Exception;
	public void addMember(MemberVO memnberVO) throws Exception;
}
