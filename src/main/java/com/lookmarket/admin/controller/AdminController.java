package com.lookmarket.admin.controller;

import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface AdminController {
	public ModelAndView accountList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView accountDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
