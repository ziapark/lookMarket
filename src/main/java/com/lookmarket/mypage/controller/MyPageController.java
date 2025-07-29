package com.lookmarket.mypage.controller;

import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface MyPageController {
	public ModelAndView myPageInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myCartList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView listMyOrderHistory(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myOrderDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myWishList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myCommunity(HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
