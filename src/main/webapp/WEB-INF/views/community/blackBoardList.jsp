<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<c:if test="${empty sessionScope.loginForm}">
    <c:redirect url="loginForm.jsp?error=3" />
</c:if>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고충방 리스트</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css"/>
</head>
<body>
<div class="container py-4">
    
	<h2 class="mb-4">고충방 리스트</h2>
	<form method="get" action="${contextPath}/blackBoardListAction.do" class="row g-2 align-items-center mb-3">
	<div class="col-auto">
            <select name="items" class="form-select">
                <option value="b_title" <c:if test="${param.items eq 'b_title'}">selected</c:if>>제목</option>
                <option value="b_content" <c:if test="${param.items eq 'b_content'}">selected</c:if>>내용</option>
                <option value="m_id" <c:if test="${param.items eq 'm_id'}">selected</c:if>>작성자</option>
            </select>
        </div>
        
        <div class="col-auto">
            <input type="text" name="text" value="${param.text}" class="form-control">
        </div>
        
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">검색</button>
        </div>
    </form>
    
    <div class="mb-3">
        <a href="${contextPath}/BoardWriteForm.do" class="btn btn-success">글쓰기</a>
        <a href="${contextPath}/LogoutAction.do" class="btn btn-outline-secondary ms-2">로그아웃</a>
    </div>
    
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
            <c:when test="${not empty requestScope.blackBoardList}">
                <c:forEach var="board" items="${requestScope.blackBoardList}">
                    <tr>
                        <td class="text-start">
                            <a href="${contextPath}/BoardViewAction.do?num=${board.b_id}&page=${requestScope.page}${not empty param.items ? '&items=' : ''}${param.items}${not empty param.text ? '&text=' : ''}${param.text}">${board.b_title}</a>
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
        <!-- 페이징 -->
    <nav class="text-center">
        <ul class="pagination justify-content-center">
            <c:if test="${requestScope.startPage > 1}">
                <li class="page-item">
                    <%-- contextPath를 사용하여 페이징 링크 경로 구성 --%>
                    <a class="page-link" href="${contextPath}/BoardListAction.do?page=${requestScope.startPage - 1}${not empty param.items ? '&items=' : ''}${param.items}${not empty param.text ? '&text=' : ''}${param.text}">« 이전</a>
                </li>
            </c:if>

            <c:forEach var="i" begin="${requestScope.startPage}" end="${requestScope.endPage}">
                <li class="page-item <c:if test="${i eq requestScope.page}">active</c:if>">
                    <%-- contextPath를 사용하여 페이징 링크 경로 구성 --%>
                    <a class="page-link" href="${contextPath}/BoardListAction.do?page=${i}${not empty param.items ? '&items=' : ''}${param.items}${not empty param.text ? '&text=' : ''}${param.text}">${i}</a>
                </li>
            </c:forEach>

            <c:if test="${requestScope.endPage < requestScope.maxPage}">
                <li class="page-item">
                    <%-- contextPath를 사용하여 페이징 링크 경로 구성 --%>
                    <a class="page-link" href="${contextPath}/BoardListAction.do?page=${requestScope.endPage + 1}${not empty param.items ? '&items=' : ''}${param.items}${not empty param.text ? '&text=' : ''}${param.text}">다음 »</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
    
</body>
</html>
