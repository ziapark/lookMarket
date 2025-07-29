package com.lookmarket.sijangbajo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("sijangbajoController")
@RequestMapping(value="/sijangbajo")
public class SijangbajoControllerImpl implements SijangbajoController{
	
	@Override
	@RequestMapping(value="/sijangSearch/search.do")
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//전통시장 위치 찾기
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
	@RequestMapping(value="/area/commercialArea.do")
	public ModelAndView commercialArea(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//숙박정보
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
	@RequestMapping(value="/sijangEvent/promotion.do")
	public ModelAndView promotion(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//이벤트
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
	@RequestMapping(value="/clean/clean.do")
	public ModelAndView clean(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//클린업체
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
	@RequestMapping(value="/sijangCommunity/communityList.do")
	public ModelAndView communityList(HttpServletRequest request, HttpServletResponse response)  throws Exception{
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
