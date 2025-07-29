package com.lookmarket.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("adminController")
@RequestMapping("/admin")
public class AdminControllerImpl implements AdminController{
	
	@Override
	@RequestMapping(value="/accountList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView accountList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//회계리스트
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "community_admin");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/accountDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView accountDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//회계상세정보
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "community_admin");
		
		return mav;
	}
}
