package com.lookmarket.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.goods.service.GoodsService;
import com.lookmarket.goods.vo.GoodsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller("goodsController")

public class GoodsControllerImpl implements GoodsController{
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private GoodsVO goodsVO;
	
	@Override
	@RequestMapping(value="/goodsList.do", method=RequestMethod.GET)
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//장보고 상품화면(사용자)
		List<GoodsVO> goodsList = goodsService.getAllGoods();
		ModelAndView mav = new ModelAndView("/goodsList");
		mav.addObject("goodsList", goodsList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/goodsDetail.do", method=RequestMethod.GET)
	public ModelAndView goodsDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    int g_id = Integer.parseInt(request.getParameter("g_id"));
	    GoodsVO goods = goodsService.getGoodsDetail(g_id);
	    ModelAndView mav = new ModelAndView("goodsDetail");
	    mav.addObject("goods", goods);
	    return mav;
	}
	
	@Override
	@RequestMapping(value="/goodsAddForm.do", method=RequestMethod.GET)
	public ModelAndView goodsAddForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    ModelAndView mav = new ModelAndView("goodsAddForm");
	    return mav;
	}
	
	@Override
	@RequestMapping(value="/goodsUpdateForm.do", method=RequestMethod.GET)
	public ModelAndView goodsUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    int g_id = Integer.parseInt(request.getParameter("g_id"));
	    GoodsVO goods = goodsService.getGoodsDetail(g_id);
	    ModelAndView mav = new ModelAndView("goodsUpdateForm");
	    mav.addObject("goods", goods);
	    return mav;
	}

}
