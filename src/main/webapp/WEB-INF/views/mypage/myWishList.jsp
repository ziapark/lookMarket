<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
    String m_id = (String) session.getAttribute("loginUserId");
    if (m_id == null) {
        response.sendRedirect(request.getContextPath() + "/member/loginForm.do");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>내 찜 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h3>내 찜 목록</h3>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>가격</th>
                <th>찜 해제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="wish" items="${wishlist}">
                <tr>
                    <td>${wish.g_id}</td>
                    <td>${wish.g_name}</td>
                    <td>${wish.price}</td>
                    <td>
                        <form action="${contextPath}/wishlist/removeWish.do" method="post" style="display:inline;">
                            <input type="hidden" name="g_id" value="${wish.g_id}" />
                            <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty wishlist}">
                <tr>
                    <td colspan="4" class="text-center">찜한 상품이 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
