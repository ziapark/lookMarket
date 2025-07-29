<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주변상권 정보 검색</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
        }
        .form-container {
            max-width: 700px;
            margin: auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
        select, input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        .btn-search {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2c7be5;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn-search:hover {
            background-color: #1a5dc2;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>주변상권 정보 검색</h2>
    <form action="${contextPath}/commercialSearch.do" method="get">

        <!-- 지역 선택 -->
        <label for="region">지역</label>
        <select name="region" id="region" required>
            <option value="">-- 지역 선택 --</option>
            <option value="서울">서울</option>
            <option value="부산">부산</option>
            <option value="대구">대구</option>
            <option value="경기">경기도</option>
            <option value="강원">강원도</option>
            <!-- 전국 가능하게 추가 -->
        </select>

        <!-- 분야 선택 -->
        <label for="category">분야</label>
        <select name="category" id="category" required>
            <option value="">-- 분야 선택 --</option>
            <option value="숙박">숙박시설</option>
            <option value="맛집">맛집</option>
            <option value="관광지">관광지</option>
            <option value="추천코스">테마별 추천코스</option>
        </select>

        <!-- 키워드 -->
        <label for="keyword">키워드</label>
        <input type="text" name="keyword" id="keyword" placeholder="예: 호텔, 한식당, 놀이공원 등" />

        <button type="submit" class="btn-search">검색</button>
    </form>
</div>

</body>
</html>
