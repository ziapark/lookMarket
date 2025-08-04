package com.lookmarket.goods.service;

import java.util.List;
<<<<<<< HEAD
=======

import com.lookmarket.goods.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> getAllGoods() throws Exception;
	public List<GoodsVO> getFreshGoods() throws Exception;
	public List<GoodsVO> getProcessed() throws Exception;
	public List<GoodsVO> getLiving() throws Exception;
	public List<GoodsVO> getFashion() throws Exception;
	public List<GoodsVO> getLocal() throws Exception;
	public GoodsVO getGoodsDetail(int g_id) throws Exception;
>>>>>>> e431f9d970a874e2e36cb232034efa1e6ed0e5b0

import com.lookmarket.goods.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> getAllGoods() throws Exception;
	public List<GoodsVO> getFreshGoods() throws Exception;
	public List<GoodsVO> getProcessed() throws Exception;
	public List<GoodsVO> getLiving() throws Exception;
	public List<GoodsVO> getFashion() throws Exception;
	public List<GoodsVO> getLocal() throws Exception;
	public GoodsVO getGoodsDetail(int g_id) throws Exception;

}