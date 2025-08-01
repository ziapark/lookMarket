package com.lookmarket.goods.service;

import com.lookmarket.goods.vo.GoodsVO;
import java.util.List;

public interface GoodsService {
    List<GoodsVO> getAllGoods() throws Exception;
    // 다른 서비스 메소드들 추가 가능 (등록, 수정, 삭제 등)
}
