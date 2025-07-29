package com.lookmarket.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CartDAO {
	public List myCartList(String current_id) throws DataAccessException;
}
