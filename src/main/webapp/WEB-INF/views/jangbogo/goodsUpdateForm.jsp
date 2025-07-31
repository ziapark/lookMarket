<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 수정</title>
    <style>
        form {
            width: 500px;
            margin: 20px auto;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .btn {
            margin-top: 15px;
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div id="content" style="padding: 20px;">
    <h2>상품 수정</h2>

    <form action="${contextPath}/goodsUpdate.do" method="post">
        <input type="hidden" name="g_id" value="${goods.g_id}" />

        <label for="g_name">상품명</label>
        <input type="text" id="g_name" name="g_name" value="${goods.g_name}" required />

        <label for="price">가격</label>
        <input type="number" id="g_price" name="g_price" value="${goods.g_price}" required />

        <label for="category">카테고리</label>
        <input type="text" id="g_category" name="g_category" value="${goods.g_category}" required />

        <label for="description">상품 설명</label>
        <textarea id="g_description" name="g_description" rows="5">${goods.g_description}</textarea>

        <button type="submit" class="btn">수정 완료</button>
    </form>
</div>

</body>
</html>


