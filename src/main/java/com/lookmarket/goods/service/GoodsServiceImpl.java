package com.lookmarket.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lookmarket.goods.dao.GoodsDAO;
import com.lookmarket.goods.vo.GoodsVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	@Override
	public List<GoodsVO> getAllGoods() throws Exception{
		return goodsDAO.selectAllGoodsList();
	}
	
	@Override
	public List<GoodsVO> getFreshGoods() throws Exception{
		return goodsDAO.selectAllGoodsList();
	}
	
	@Override
	public List<GoodsVO> getProcessed() throws Exception{
		return goodsDAO.selectAllGoodsList();
	}
	
	@Override
	public List<GoodsVO> getLiving() throws Exception{
		return goodsDAO.selectAllGoodsList();
	}
	
	@Override
	public List<GoodsVO> getFashion() throws Exception{
		return goodsDAO.selectAllGoodsList();
	}
	
	@Override
	public List<GoodsVO> getLocal() throws Exception{
		return goodsDAO.selectAllGoodsList();
	}
	
	@Override
	public GoodsVO getGoodsDetail(int g_id) throws Exception{
		return goodsDAO.selectGoodsDetail(g_id);
	}
<<<<<<< HEAD
}
=======
}
>>>>>>> e431f9d970a874e2e36cb232034efa1e6ed0e5b0
