package com.lookmarket.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.common.base.BaseController;
import com.lookmarket.mypage.service.MyPageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController implements MyPageController{
	@Autowired
	private MyPageService myPageService;
	
	//사용자	
	@Override
	@RequestMapping(value="/mypageInfo.do", method=RequestMethod.GET)
	public ModelAndView myPageInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//마이페이지 첫화면(사용자정보)
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myCartList.do", method=RequestMethod.GET)
	public ModelAndView myCartList(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//장바구니
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/listMyOrderHistory.do", method=RequestMethod.GET)
	public ModelAndView listMyOrderHistory(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//주문내역
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myOrderDetail.do", method=RequestMethod.GET)
	public ModelAndView myOrderDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//주문상세내역
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		
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
		//찜
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myCommunity.do", method=RequestMethod.GET)
	public ModelAndView myCommunity(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//커뮤니티
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		
		return mav;
	}
	
}
