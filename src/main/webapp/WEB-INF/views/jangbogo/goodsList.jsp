<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
<style>
    .card-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-top: 20px;
    }
    .card {
        flex: 1 1 calc(25% - 20px); /* 4개씩 한 줄 */
        box-sizing: border-box;
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 15px;
        box-shadow: 2px 2px 6px #ccc;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        min-width: 250px;
    }
    .card-title {
        font-size: 1.2rem;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .card-text {
        margin: 5px 0;
    }
    .btn-group {
        margin-top: 15px;
        text-align: center;
    }
    .btn {
        display: inline-block;
        padding: 6px 12px;
        margin: 0 5px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
        font-size: 0.9rem;
    }
    .btn:hover {
        background-color: #0056b3;
    }
    .top-right {
        text-align: right;
        margin-bottom: 10px;
    }
    @media(max-width: 768px) {
        .card {
            flex: 1 1 calc(50% - 20px);
        }
    }
    @media(max-width: 480px) {
        .card {
            flex: 1 1 100%;
        }
    }
</style>
</head>

<body>
<div id="content" style="padding: 20px;">
    <h2>상품 목록</h2>
    
    <div class="top-right">
        <a href="${contextPath}/goodsAddForm.do" class="btn">상품 등록</a>
    </div>

    <c:choose>
        <c:when test="${not empty goodsList}">
            <div class="card-container">
                <c:forEach var="goods" items="${goodsList}">
                    <div class="card">
                        <div>
                            <div class="card-title">${goods.g_name}</div>
                            <div class="card-text"><strong>가격:</strong> <fmt:formatNumber value="${goods.g_price}" type="currency" currencySymbol="₩"/></div>
                            <div class="card-text">
                                <strong>카테고리:</strong>
                                <c:choose>
                                    <c:when test="${goods.g_category == 1}">신선식품</c:when>
                                    <c:when test="${goods.g_category == 2}">가공식품</c:when>
                                    <c:when test="${goods.g_category == 3}">생활용품</c:when>
                                    <c:when test="${goods.g_category == 4}">패션잡화</c:when>
                                    <c:when test="${goods.g_category == 5}">지역특산물</c:when>
                                    <c:otherwise>기타</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="card-text"><strong>등록일:</strong> <fmt:formatDate value="${goods.g_credate}" pattern="yyyy-MM-dd" /></div>
                            <div class="card-text"><strong>재고:</strong> ${goods.g_stock}</div>
                        </div>
                        <div class="btn-group">
                            <c:if test="${isAdmin}">
                                <a href="${contextPath}/goodsDetail.do?g_id=${goods.g_id}" class="btn">상세</a>
                                <a href="${contextPath}/goodsUpdateForm.do?g_id=${goods.g_id}" class="btn">수정</a>
                                <a href="${contextPath}/goodsDelete.do?g_id=${goods.g_id}" class="btn" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p>등록된 상품이 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
