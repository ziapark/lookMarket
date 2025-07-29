package com.lookmarket.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lookmarket.mail.service.MailService;
import com.lookmarket.member.service.MemberService;
import com.lookmarket.member.service.NaverLoginService;
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
	@Autowired
	private MailService mailService;
	@Autowired
	private NaverLoginService naverLoginService;
	
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam("m_id") String m_id, @RequestParam("m_pw") String m_pw, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception{
		//로그인
		ModelAndView mav = new ModelAndView();
		String check_id = memberService.checkId(m_id);
		
		if(check_id.equals("true")) {
			String check_login = memberService.login(m_id, m_pw);
			
			if(check_login.equals("true")) {
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
	            redirectAttributes.addFlashAttribute("message", "비밀번호가 틀렸습니다. 다시 로그인해주세요.");
				mav.setViewName("redirect:/member/loginForm.do");
			}
	
		}else {
	        redirectAttributes.addFlashAttribute("message", "아이디가 틀렸습니다. 다시 로그인해주세요.");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/naverCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session, Model model) throws Exception {
		System.out.println("Naver Callback 들어옴!");

		MemberVO naverMember = naverLoginService.getNaverUserInfo(code, state);
		
        if (naverMember != null) {
            // 6단계: 로그인 성공 처리 (세션에 회원 정보 저장)
            session.setAttribute("isLogOn", true);
            session.setAttribute("memberInfo", naverMember);
            
            // 메인 페이지로 리다이렉트
            return "redirect:/main/main.do";
        } else {
            // 실패 시 에러 페이지나 로그인 페이지로 이동
            model.addAttribute("message", "네이버 로그인에 실패했습니다.");
            return "forward:/member/loginForm.do";
        }
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
		session.invalidate();
		
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
	@RequestMapping(value="/mailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) throws Exception{
		//이메일 인증
		String authCode = mailService.joinEmail(email);
		return authCode;
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
		
		//회원등급
		_memberVO.setM_role(1);
		
		//가입일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String m_joindate = sdf.format(now);
		
		_memberVO.setM_joindate(m_joindate);
		
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
