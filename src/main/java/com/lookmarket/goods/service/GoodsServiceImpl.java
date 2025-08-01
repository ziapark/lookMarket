package com.lookmarket.goods.service;

import com.lookmarket.goods.dao.GoodsDAO;
import com.lookmarket.goods.vo.GoodsVO;
import java.util.List;

public class GoodsServiceImpl implements GoodsService {

    private GoodsDAO goodsDAO;

    public GoodsServiceImpl(GoodsDAO goodsDAO) {
        this.goodsDAO = goodsDAO;
    }

    @Override
    public List<GoodsVO> getAllGoods() throws Exception {
        return goodsDAO.selectAllGoods();
    }
}
