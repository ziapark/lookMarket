package com.lookmarket.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.lookmarket.cart.vo.CartVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private CartVO cartVO;
	
	@Override
	public List myCartList(String current_id) throws DataAccessException{
		return sqlSession.selectList("mapper.cart.myCartList", current_id);
	}
}
