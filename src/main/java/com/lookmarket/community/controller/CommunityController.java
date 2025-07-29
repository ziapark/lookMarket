package com.lookmarket.community.controller;

import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface CommunityController {
	public ModelAndView communityList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView communityDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView communityUpdateForm(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView blackBoardList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView blackBoardDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView blackBoardUpdateForm(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView communityForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView blackBoardForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
