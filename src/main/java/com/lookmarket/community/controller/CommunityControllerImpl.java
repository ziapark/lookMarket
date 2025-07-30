package com.lookmarket.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.community.Service.CommunityService;
import com.lookmarket.community.vo.BlackBoardVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("communityController")
@RequestMapping(value="/community")
public class CommunityControllerImpl implements CommunityController{
	@Autowired
	private CommunityService communityService;
	@Autowired
	private BlackBoardVO blackBoardVO;
	
	@Override
	@RequestMapping(value="/communityList.do", method=RequestMethod.GET)
	public ModelAndView communityList(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//커뮤니티리스트
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "community");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/communityDetail.do", method=RequestMethod.GET)
	public ModelAndView communityDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//커뮤니티 상세정보
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "community");
		
		return mav;
	}

	@Override
	@RequestMapping(value="/communityUpdateForm.do", method=RequestMethod.GET)
	public ModelAndView communityUpdateForm(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//커뮤니티 수정
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "community");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/blackBoardList.do", method=RequestMethod.GET)
	public ModelAndView blackBoardList(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//고충방 리스트
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		List<BlackBoardVO> blackBoardList = communityService.blackBoardList();
		
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "community_admin");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/blackBoardDetail.do", method=RequestMethod.GET)
	public ModelAndView blackBoardDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		//고충방 상세
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
	@RequestMapping(value="/blackBoardUpdateForm.do", method=RequestMethod.GET)
	public ModelAndView blackBoardUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//고충방 수정
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
	@RequestMapping(value="/communityAddForm.do", method=RequestMethod.GET)
	public ModelAndView communityAddForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		session = request.getSession();
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "community");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/blackBoardAddForm.do", method=RequestMethod.GET)
	public ModelAndView blackBoardAddForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
