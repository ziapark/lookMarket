package com.lookmarket.goods.service;

import java.util.List;

import com.lookmarket.goods.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> getAllGoods() throws Exception;
	public GoodsVO getGoodsDetail(int g_id) throws Exception;

}
