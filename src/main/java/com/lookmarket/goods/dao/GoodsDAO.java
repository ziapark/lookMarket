package com.lookmarket.goods.dao;

import com.lookmarket.goods.vo.GoodsVO;
import java.util.List;

public interface GoodsDAO {
    List<GoodsVO> selectAllGoods() throws Exception;
    // 다른 DAO 메소드 추가 가능
}
