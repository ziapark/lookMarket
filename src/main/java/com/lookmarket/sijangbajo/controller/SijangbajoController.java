package com.lookmarket.sijangbajo.controller;

import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface SijangbajoController {
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView commercialArea(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView promotion(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView clean(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView communityList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
