package com.lookmarket.goods.controller;

import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface GoodsController {
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsAddForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
