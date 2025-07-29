package com.lookmarket.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lookmarket.cart.service.CartService;
import com.lookmarket.cart.vo.CartVO;
import com.lookmarket.common.base.BaseController;
import com.lookmarket.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/myCartList.do", method=RequestMethod.GET)
	public ModelAndView myCartList(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		String layout = "common/layout";
		mav.setViewName(layout);
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("viewName", viewName);
		
		HttpSession session = request.getSession();
		String current_id = (String)session.getAttribute("current_id");
		List<CartVO> cartList = cartService.myCartList(current_id);
		session.setAttribute("cartList", cartList);
		
		session.setAttribute("sideMenu", "reveal");
		session.setAttribute("sideMenu_option", "myPage");
		
		return mav;
	}
}
