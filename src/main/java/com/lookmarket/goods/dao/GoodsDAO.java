package com.lookmarket.goods.dao;

import java.util.List;
<<<<<<< HEAD
=======

import com.lookmarket.goods.vo.GoodsVO;

public interface GoodsDAO {
	public List<GoodsVO> selectAllGoodsList() throws Exception;
	public GoodsVO selectGoodsDetail(int g_id) throws Exception;
>>>>>>> e431f9d970a874e2e36cb232034efa1e6ed0e5b0

import com.lookmarket.goods.vo.GoodsVO;

public interface GoodsDAO {
	public List<GoodsVO> selectAllGoodsList() throws Exception;
	public GoodsVO selectGoodsDetail(int g_id) throws Exception;

}