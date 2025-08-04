<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
    String role = (String) session.getAttribute("loginUserRole");
    String m_id = (String) session.getAttribute("loginUserId");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 20px;
            text-align: center;
            transition: box-shadow 0.3s;
            height: 100%;
        }

        .product-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .product-image {
            height: 160px;
            object-fit: cover;
            width: 100%;
            border-radius: 5px;
        }

        .product-name {
            font-weight: bold;
            margin-top: 10px;
        }

        .product-price {
            color: #d9534f;
            margin-top: 5px;
            font-size: 16px;
        }

        .btn-small {
            padding: 4px 8px;
            font-size: 12px;
        }

        .wish-btn {
            border: none;
            background: none;
            font-size: 20px;
            cursor: pointer;
        }

        .wish-btn.disabled {
            cursor: not-allowed;
            opacity: 0.5;
        }

        .top-right {
            text-align: right;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2>상품 목록</h2>
    
    <div class="top-right">
        <a href="${contextPath}/goodsAddForm.do" class="btn btn-primary">상품 등록</a>
    </div>

    <c:choose>
        <c:when test="${not empty goodsMap}">
            <c:forEach var="entry" items="${goodsMap}">
                <c:set var="category" value="${entry.key}" />
                <c:set var="goodsList" value="${entry.value}" />

                <h4>
                    <c:choose>
                        <c:when test="${category == 1}">신선식품</c:when>
                        <c:when test="${category == 2}">가공식품</c:when>
                        <c:when test="${category == 3}">생활용품</c:when>
                        <c:when test="${category == 4}">패션잡화</c:when>
                        <c:when test="${category == 5}">지역특산물</c:when>
                        <c:otherwise>기타</c:otherwise>
                    </c:choose>
                    <a href="${contextPath}/goodsList.do?category=${category}" class="btn btn-sm btn-outline-secondary float-end">더보기</a>
                </h4>

                <div class="row">
                    <c:forEach var="goods" items="${goodsList}">
                        <div class="col-md-3 col-sm-6 mb-4">
                            <div class="product-card">
                                <img src="${contextPath}/resources/image/${goods.i_file_name}" alt="${goods.g_name}" class="product-image" />
                                
                                <div class="product-name">${goods.g_name}</div>
                                <div class="product-price">
                                    <fmt:formatNumber value="${goods.g_price}" type="currency" currencySymbol="₩"/>
                                </div>

                                <div class="mt-2 d-flex justify-content-center align-items-center gap-2">
                                    <a href="${contextPath}/goodsDetail.do?g_id=${goods.g_id}" class="btn btn-primary btn-small">상세보기</a>
                                    
                                    <button
                                        class="wish-btn"
                                        data-gid="${goods.g_id}"
                                        <c:if test="${empty m_id}">disabled class="disabled" title="로그인 후 이용 가능"</c:if>>
                                        <span class="wish-icon">
                                            <c:choose>
                                                <c:when test="${goods.isWished}">❤️</c:when>
                                                <c:otherwise>🤍</c:otherwise>
                                            </c:choose>
                                        </span>
                                    </button>
                                </div>

                                <c:if test="<%= \"admin\".equals(role) %>">
                                    <div class="mt-2">
                                        <a href="${contextPath}/goodsUpdateForm.do?g_id=${goods.g_id}" class="btn btn-warning btn-small">수정</a>
                                        <a href="${contextPath}/goodsDelete.do?g_id=${goods.g_id}" class="btn btn-danger btn-small" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </c:when>

        <c:when test="${not empty goodsList}">
            <c:set var="categoryName">
                <c:choose>
                    <c:when test="${category == 1}">신선식품</c:when>
                    <c:when test="${category == 2}">가공식품</c:when>
                    <c:when test="${category == 3}">생활용품</c:when>
                    <c:when test="${category == 4}">패션잡화</c:when>
                    <c:when test="${category == 5}">지역특산물</c:when>
                    <c:otherwise>기타</c:otherwise>
                </c:choose>
            </c:set>

            <h4>${categoryName} 상품 목록</h4>
            
            <div class="row">
                <c:forEach var="goods" items="${goodsList}">
                    <div class="col-md-3 col-sm-6 mb-4">
                        <div class="product-card">
                            <img src="${contextPath}/resources/image/${goods.i_file_name}" alt="${goods.g_name}" class="product-image" />
                            
                            <div class="product-name">${goods.g_name}</div>
                            <div class="product-price">
                                <fmt:formatNumber value="${goods.g_price}" type="currency" currencySymbol="₩"/>
                            </div>

                            <div class="mt-2 d-flex justify-content-center align-items-center gap-2">
                                <a href="${contextPath}/jangbogo/goodsDetail.do?g_id=${goods.g_id}" class="btn btn-primary btn-small">상세보기</a>
                               
                            </div>

                            <c:if test="<%= \"admin\".equals(role) %>">
                                <div class="mt-2">
                                    <a href="${contextPath}/goodsUpdateForm.do?g_id=${goods.g_id}" class="btn btn-warning btn-small">수정</a>
                                    <a href="${contextPath}/goodsDelete.do?g_id=${goods.g_id}" class="btn btn-danger btn-small" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>

        <c:otherwise>
            <p class="text-center mt-4">등록된 상품이 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>

<script>
$(document).ready(function () {
    $('.wish-btn').click(function () {
        if ($(this).prop('disabled')) return;

        const btn = $(this);
        const g_id = btn.data('gid');

        $.ajax({
            url: '${contextPath}/wishlist/toggle.do',
            method: 'POST',
            data: { g_id: g_id },
            success: function (result) {
                const icon = btn.find('.wish-icon');
                if (result === 'added') {
                    icon.text('❤️');
                } else if (result === 'removed') {
                    icon.text('🤍');
                }
            },
            error: function () {
                alert('찜 처리 중 오류 발생');
            }
        });
    });
});
</script>
</body>
</html>
