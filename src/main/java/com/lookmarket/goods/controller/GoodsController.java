package com.lookmarket.goods.controller;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public interface GoodsController {
    void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception;
    void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
