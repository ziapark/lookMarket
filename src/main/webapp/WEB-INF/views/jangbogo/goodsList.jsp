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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
        }

        a.btn {
            padding: 6px 12px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }

        a.btn:hover {
            background-color: #0056b3;
        }

        .top-right {
            text-align: right;
            margin-bottom: 10px;
        }
</style>
</head>

<body>
<div id="content" style="padding: 20px;">
    <h2>상품 목록</h2>
    
    <div class="top-right">
        <a href="${contextPath}/goodsAddForm.do" class="btn">상품 등록</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>상품명</th>
                <th>가격</th>
                <th>카테고리</th>
                <th>등록일</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty goodsList}">
                    <c:forEach var="goods" items="${goodsList}" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${goods.g_name}</td>
                            <td><fmt:formatNumber value="${goods.g_price}" type="currency" currencySymbol="₩"/></td>
                            <td>${goods.g_category}</td>
                            <td><fmt:formatDate value="${goods.g_credate}" pattern="yyyy-MM-dd" /></td>
                            <td>
                                <a href="${contextPath}/goodsDetail.do?g_id=${goods.g_id}" class="btn">상세목록</a>
                                <a href="${contextPath}/goodsUpdateForm.do?g_id=${goods.g_id}" class="btn">수정</a>
                                <a href="${contextPath}/goodsDelete.do?g_id=${goods.g_id}" class="btn" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6">등록된 상품이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

</body>
</html>


