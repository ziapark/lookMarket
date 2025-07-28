package com.lookmarket.mypage.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public interface MyPageController {
    public ModelAndView myPageMain(@RequestParam(required = false, value = "message") String message,
                                   HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView myOrderDetail(@RequestParam("o_id") String orderId,
                                      HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView cancelMyOrder(@RequestParam("o_id") String orderId,
                                      HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap,
                                           HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView myDetailInfo(HttpServletRequest request,
                                     HttpServletResponse response) throws Exception;

    public ResponseEntity<?> modifyMyInfo(@RequestParam("attribute") String attribute,
                                          @RequestParam("value") String value,
                                          HttpServletRequest request, HttpServletResponse response) throws Exception;
}
