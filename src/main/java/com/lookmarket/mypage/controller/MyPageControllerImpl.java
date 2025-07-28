package com.lookmarket.mypage.controller;

import com.lookmarket.mypage.service.MyPageService;
import com.lookmarket.mypage.vo.MyPageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller("myPageController")
public class MyPageControllerImpl implements MyPageController {

    @Autowired
    private MyPageService myPageService;

    @Override
    @RequestMapping("/mypage/myPageMain.do")
    public ModelAndView myPageMain(@RequestParam(value = "message", required = false) String message,
                                   HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = "mypage/myPageMain";
        ModelAndView mav = new ModelAndView(viewName);

        String m_id = (String) request.getSession().getAttribute("m_id");
        if (m_id != null) {
            MyPageVO myPageInfo = myPageService.getMyPageInfo(m_id);
            mav.addObject("myInfo", myPageInfo);
        }
        mav.addObject("message", message);
        return mav;
    }

    @Override
    @RequestMapping("/mypage/myOrderDetail.do")
    public ModelAndView myOrderDetail(@RequestParam("order_id") String orderId,
                                      HttpServletRequest request, HttpServletResponse response) throws Exception {
        String viewName = "mypage/myOrderDetail";
        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("orderDetail", myPageService.findOrderDetail(orderId));
        return mav;
    }

    @Override
    @RequestMapping("/mypage/cancelMyOrder.do")
    public ModelAndView cancelMyOrder(@RequestParam("order_id") String orderId,
                                      HttpServletRequest request, HttpServletResponse response) throws Exception {
        myPageService.cancelOrder(orderId);
        return new ModelAndView("redirect:/mypage/myPageMain.do?message=cancelled");
    }

    @Override
    @RequestMapping("/mypage/listMyOrderHistory.do")
    public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap,
                                           HttpServletRequest request, HttpServletResponse response) throws Exception {
        String m_id = (String) request.getSession().getAttribute("m_id");
        List<?> orderHistory = myPageService.getOrderHistory(dateMap, m_id);
        ModelAndView mav = new ModelAndView("mypage/listMyOrderHistory");
        mav.addObject("orderHistory", orderHistory);
        return mav;
    }

    @Override
    @RequestMapping("/mypage/myDetailInfo.do")
    public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String m_id = (String) request.getSession().getAttribute("m_id");
        MyPageVO myInfo = myPageService.getMyPageInfo(m_id);
        ModelAndView mav = new ModelAndView("mypage/myDetailInfo");
        mav.addObject("myInfo", myInfo);
        return mav;
    }

    @Override
    @RequestMapping("/mypage/modifyMyInfo.do")
    public ResponseEntity<?> modifyMyInfo(@RequestParam("attribute") String attribute,
                                          @RequestParam("value") String value,
                                          HttpServletRequest request, HttpServletResponse response) throws Exception {
        String m_id = (String) request.getSession().getAttribute("m_id");
        myPageService.modifyMyInfo(m_id, attribute, value);
        return ResponseEntity.ok("변경 완료");
    }
}
