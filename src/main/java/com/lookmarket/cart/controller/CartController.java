package com.lookmarket.cart.controller;

import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface CartController {
	public ModelAndView myCartList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
