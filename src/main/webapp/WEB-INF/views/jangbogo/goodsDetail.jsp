<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 상세정보</title>
    <style>
        .goods-detail-container {
            width: 800px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 12px;
            background-color: #f9f9f9;
        }
        .goods-detail-container h2 {
            margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        .goods-info {
            margin-bottom: 10px;
        }
        .goods-info label {
            display: inline-block;
            width: 160px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="goods-detail-container">
    <h2>상품 상세정보</h2>

    <div class="goods-info"><label>상품명:</label> ${goods.g_name}</div>
    <div class="goods-info"><label>브랜드:</label> ${goods.g_brand}</div>
    <div class="goods-info"><label>카테고리:</label>
        <c:choose>
            <c:when test="${goods.g_category == 1}">신선식품</c:when>
            <c:when test="${goods.g_category == 2}">가공식품</c:when>
            <c:when test="${goods.g_category == 3}">생활용품</c:when>
            <c:when test="${goods.g_category == 4}">패션잡화</c:when>
            <c:when test="${goods.g_category == 5}">지역특산물</c:when>
            <c:otherwise>기타</c:otherwise>
        </c:choose>
    </div>
    <div class="goods-info"><label>가격:</label> <del>${goods.g_price}</del> → <strong>${goods.g_sale_price}원</strong></div>
    <div class="goods-info"><label>수량:</label> ${goods.g_qty} 개</div>
    <div class="goods-info"><label>입고일:</label> ${goods.g_credate}</div>
    <div class="goods-info"><label>제조일자:</label> ${goods.g_manufactured_date}</div>
    <div class="goods-info"><label>유통기한:</label> ${goods.g_expiration_date}</div>
    <div class="goods-info"><label>배송비:</label>
        <c:if test="${goods.g_delivery_price == 0}">무료배송</c:if>
        <c:if test="${goods.g_delivery_price > 0}">${goods.g_delivery_price}원</c:if>
    </div>
    <div class="goods-info"><label>도착 예정일:</label> ${goods.g_delivery_date}</div>
    <div class="goods-info"><label>상태:</label>
        <c:choose>
            <c:when test="${goods.g_status == 1}">판매중</c:when>
            <c:when test="${goods.g_status == 2}">품절</c:when>
            <c:when test="${goods.g_status == 3}">판매종료</c:when>
            <c:otherwise>미정</c:otherwise>
        </c:choose>
    </div>
    <div class="goods-info"><label>재고:</label> ${goods.g_stock} 개</div>
    <div class="goods-info"><label>상세설명:</label><br/> <pre style="white-space: pre-wrap;">${goods.g_discription}</pre></div>

    <div style="margin-top: 20px;">
        <form action="${contextPath}/cart/addCart.do" method="post">
            <input type="hidden" name="g_id" value="${goods.g_id}" />
            <label>수량:
                <input type="number" name="qty" value="1" min="1" max="${goods.g_stock}" />
            </label>
            <button type="submit">장바구니 담기</button>
        </form>
    </div>
</div>

</body>
</html>
