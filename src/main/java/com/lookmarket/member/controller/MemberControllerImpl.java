package com.lookmarket.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.member.service.MemberService;
import com.lookmarket.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		//로그인
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		if(memberVO != null && memberVO.getM_id() != null) {
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);
			
			String action = (String)session.getAttribute("action");
			if(action != null && action.equals("/order/orderEachGoods.do")) {
				//추가 필요
				mav.setViewName("forward:" + action);
			}else {
				mav.setViewName("redirect:/main/main.do");
			}
		}else {
			String message = "아이디 또는 비밀번호가 틀렸습니다. 다시 로그인해주세요.";
			mav.addObject("message", message);
			mav.setViewName("member/loginForm");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value="/logout.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//로그아웃
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do", method=RequestMethod.POST)
	@ResponseBody
	public String overlapped(@RequestParam("m_id") String m_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		//아이디 중복검사
		//AJAX 사용
		String result = memberService.overlapped(m_id);
		return result;
	}
	
	@Override
	@RequestMapping(value="/addMember.do", method=RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		//회원가입
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		//성별
		int gender = _memberVO.getM_gender();
		if(gender == 1 || gender == 3) {
			_memberVO.setM_gender(1);
		}else {
			_memberVO.setM_gender(2);
		}
		
		//회원등급 넣기
		_memberVO.setM_role(1);
		
		//가입일 넣기
		
		try {
			memberService.addMember(_memberVO);
			message = "<script>";
			message += " alert('회원 정보를 로드중입니다. 로그인창으로 이동합니다.');";
			message += " location.href='" + request.getContextPath() + "/member/loginForm.do';";
			message = " <script>";
		}catch(Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해주세요.');";
			message += " location.href='" + request.getContextPath() + "/member/memberForm.do';";
			message = " <script>";
			e.printStackTrace();
		}
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value={"/memberForm.do", "/loginForm.do"}, method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//로그인창, 회원가입창 출력
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		return mav;
		
	}
}
