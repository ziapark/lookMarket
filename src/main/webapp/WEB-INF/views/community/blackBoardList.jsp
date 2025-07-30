<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고충방 리스트</title>
</head>
<body>
<div class="container py-4">
	<h2 class="mb-4">고충방 리스트</h2>    
    <!-- 게시글 목록 -->
    <table class="table table-bordered text-center">
        <thead class="table-light">
            <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>공개여부</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty blackBoardList}">
                <c:forEach var="board" items="${blackBoardList}">
                    <tr>
                        <td class="text-start">
                            <a href="#">${board.b_title}</a>
                        </td>
                        <td>${board.m_id}</td>
                        <td>${board.b_date}</td>
                        <td>${board.b_hit}</td>
                        <td>
                            <c:choose>
                                <c:when test="${board.b_secret eq 1}">공개</c:when>
                                <c:when test="${board.b_secret eq 2}">비공개</c:when>
                                <c:otherwise>알 수 없음</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5">등록된 게시글이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>
    
</body>
</html>
