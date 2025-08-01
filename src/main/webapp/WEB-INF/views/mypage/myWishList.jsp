<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 위시리스트</title>
</head>
<body>
    <h1>내 위시리스트</h1>
    <p>나중에 구매하려고 저장한 상품들입니다:</p>

    <c:choose>
        <c:when test="${empty wishlist}">
            <p>위시리스트에 저장된 상품이 없습니다.</p>
        </c:when>
        <c:otherwise>
            <ul>
                <c:forEach var="item" items="${wishlist}">
                    <li>
                        ${item.name} - ${item.price}원
                        <a href="${contextPath}/removeFromWishlist?id=${item.id}">삭제</a>
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>
</body>
</html>