package com.lookmarket.goods.controller;

import java.util.List;

import com.lookmarket.goods.service.GoodsService;
import com.lookmarket.goods.vo.GoodsVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GoodsControllerImpl implements GoodsController {

    private GoodsService goodsService;

    public GoodsControllerImpl(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 예: 상품 목록 조회
        List<GoodsVO> goodsList = goodsService.getAllGoods();
        request.setAttribute("goodsList", goodsList);

        Boolean isAdmin = (Boolean) request.getSession().getAttribute("isAdmin");
        if(isAdmin == null) isAdmin = false;
        request.setAttribute("isAdmin", isAdmin);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/goodsList.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 필요시 POST 처리 (예: 상품 등록/수정)
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    }
}
