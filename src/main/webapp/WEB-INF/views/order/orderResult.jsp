<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 결과</title>
    <style>
        body {
            font-family: Arial;
            max-width: 700px;
            margin: auto;
            padding-top: 30px;
        }
        h2 {
            color: #4CAF50;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 8px 0;
        }
    </style>
</head>
<body>

    <h2>주문이 완료되었습니다!</h2>

    <p>입력하신 주문 정보는 다음과 같습니다:</p>

    <ul>
        <li><strong>주문자 이름:</strong> ${order.oi_name}</li>
        <li><strong>수령자 이름:</strong> ${order.oi_receiver_name}</li>
        <li><strong>휴대폰 번호:</strong> ${order.oi_receiver_phone}</li>
        <li><strong>배송 주소:</strong> ${order.oi_delivery_address}</li>
        <li><strong>배송 메시지:</strong> ${order.oi_delivery_message}</li>
        <li><strong>총 상품 금액:</strong> ${order.oi_total_goods_price} 원</li>
        <li><strong>할인 금액:</strong> ${order.oi_sale_price} 원</li>
        <li><strong>배송비:</strong> ${order.oi_delivery_price} 원</li>
        <li><strong>주문일자:</strong> ${order.oi_date}</li>
    </ul>

    <p><a href="${contextPath}/orderForm.jsp">다른 주문하기</a></p>

</body>
</html>
