package com.lookmarket.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.common.base.BaseController;
import com.lookmarket.member.vo.MemberVO;
import com.lookmarket.mypage.service.MyPageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController implements MyPageController{
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MemberVO memberVO;
	
	//사용자	
	@Override
	@RequestMapping(value="/mypageInfo.do", method=RequestMethod.GET)
	public ModelAndView myPageInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//마이페이지 첫화면(사용자)
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		String current_id = (String)session.getAttribute("current_id");
		
		memberVO = myPageService.getMyPageInfo(current_id);
		
		mav.addObject("myPageInfo", memberVO);
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "myPage");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/listMyOrderHistory.do", method=RequestMethod.GET)
	public ModelAndView listMyOrderHistory(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//주문내역(사용자)
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "myPage");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myOrderDetail.do", method=RequestMethod.GET)
	public ModelAndView myOrderDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//주문상세내역(사용자)
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "myPage");
		
		return mav;
	}
	
//	@Override
//	@RequestMapping(value="/.do", method=RequestMethod.GET)
//	public ModelAndView myPageInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception{
//		//배송조회(일단 보류)
//		
//	}
	
	@Override
	@RequestMapping(value="/myWishList.do", method=RequestMethod.GET)
	public ModelAndView myWishList(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//찜(사용자)
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "myPage");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myCommunity.do", method=RequestMethod.GET)
	public ModelAndView myCommunity(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//커뮤니티(사용자)
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "myPage");
		
		return mav;
	}
	
	@RequestMapping(value="/updateMyInfo.do", method=RequestMethod.POST)
	public void updateMyInfo(@ModelAttribute MemberVO memberVO, HttpSession session, HttpServletResponse response) throws Exception {
	    //세션에서 아이디 가져오기
		String current_id = (String) session.getAttribute("current_id");
		//수정할 memberVO에 세션아이디 세팅(보안)
	    memberVO.setM_id(current_id);
	    
	    System.out.println("성별: " + memberVO.getM_gender());
	    System.out.println("이메일: " + memberVO.getM_email());
	    
	    //수정 처리
	    boolean status = myPageService.updateMyInfo(memberVO);

	    String json = "";
	    if (status) {
	        json = "{\"result\": \"success\"}";
	    } else {
	        json = "{\"result\": \"fail\", \"message\": \"DB 업데이트 실패\"}";
	    }

	    response.setContentType("application/json; charset=UTF-8");
	    response.getWriter().write(json);
	}

}
