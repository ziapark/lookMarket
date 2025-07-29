<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주변상권 검색 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f3f3f3;
        }
        .no-result {
            text-align: center;
            margin-top: 40px;
            font-size: 18px;
            color: #888;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 18px;
            background-color: #888;
            color: white;
            border-radius: 6px;
            text-decoration: none;
        }
        .back-btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

<h2>📍 '${region}' 지역의 [${category}] 검색 결과</h2>

<c:choose>
    <c:when test="${not empty resultList}">
        <table>
            <thead>
                <tr>
                    <th>이름</th>
                    <th>주소</th>
                    <th>분야</th>
                    <th>전화번호</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${resultList}">
                    <tr>
                        <td>${item.name}</td>
                        <td>${item.address}</td>
                        <td>${item.type}</td>
                        <td>
                            <c:choose>
                                <c:when test="${empty item.phone}">-</c:when>
                                <c:otherwise>${item.phone}</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p class="no-result">검색 결과가 없습니다. 다시 검색해 주세요.</p>
    </c:otherwise>
</c:choose>

<a href="${pageContext.request.contextPath}/commercialArea.jsp" class="back-btn">🔙 다시 검색하기</a>

</body>
</html>
