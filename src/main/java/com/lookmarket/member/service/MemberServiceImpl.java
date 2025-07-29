package com.lookmarket.member.service;

import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;

import com.lookmarket.member.dao.MemberDAO;
import com.lookmarket.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public String checkId(String m_id) throws Exception{
		return memberDAO.checkId(m_id);
	}
	@Override
	public String login(String m_id, String m_pw) throws Exception{
		return memberDAO.login(m_id, m_pw);
	}
	@Override
	public String overlapped(String m_id) throws Exception{
		return memberDAO.selectOverlappedID(m_id);
	}	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
}
