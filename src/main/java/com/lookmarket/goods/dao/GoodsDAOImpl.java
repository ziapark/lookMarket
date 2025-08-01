package com.lookmarket.goods.dao;

import com.lookmarket.goods.vo.GoodsVO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GoodsDAOImpl implements GoodsDAO {

    private Connection conn;

    public GoodsDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<GoodsVO> selectAllGoods() throws Exception {
        List<GoodsVO> list = new ArrayList<>();
        String sql = "SELECT * FROM goods WHERE g_status = 1 ORDER BY g_id DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                GoodsVO goods = new GoodsVO();
                goods.setG_id(rs.getInt("g_id"));
                goods.setG_category(rs.getInt("g_category"));
                goods.setG_name(rs.getString("g_name"));
                goods.setG_brand(rs.getString("g_brand"));
                goods.setG_discription(rs.getString("g_discription"));
                goods.setG_qty(rs.getInt("g_qty"));
                goods.setG_price(rs.getInt("g_price"));
                goods.setG_sale_price(rs.getInt("g_sale_price"));
                goods.setG_credate(rs.getString("g_credate"));
                goods.setG_manufactured_date(rs.getString("g_manufactured_date"));
                goods.setG_expiration_date(rs.getString("g_expiration_date"));
                goods.setG_delivery_price(rs.getInt("g_delivery_price"));
                goods.setG_delivery_date(rs.getString("g_delivery_duration")); // 필드명 확인 필요
                goods.setG_status(rs.getInt("g_status"));
                goods.setG_stock(rs.getInt("g_stock"));
                list.add(goods);
            }
        }
        return list;
    }
}
