<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
    <style>
        /* 스타일은 위에서 준 예시 스타일 참고 */
        form { max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background: #f9f9f9; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        input[type=text], input[type=number], textarea, select, input[type=date] { width: 100%; padding: 8px 10px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; font-size: 1rem; }
        textarea { resize: vertical; height: 100px; }
        .btn-group { margin-top: 20px; text-align: center; }
        .btn { padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 1rem; margin: 0 10px; text-decoration: none; display: inline-block; }
        .btn:hover { background-color: #0056b3; }
    </style>
</head>
<body>

<h2 style="text-align:center; margin-top: 20px;">상품 등록</h2>

<form method="post" action="${contextPath}/goodsInsert.do">
    <label for="g_name">상품명</label>
    <input type="text" id="g_name" name="g_name" required />

    <label for="g_brand">상품 업체</label>
    <input type="text" id="g_brand" name="g_brand" required />

    <label for="g_discription">상품 상세설명</label>
    <textarea id="g_discription" name="g_discription" required></textarea>

    <label for="g_price">상품 가격</label>
    <input type="number" id="g_price" name="g_price" min="0" required />

    <label for="g_sale_price">할인가격</label>
    <input type="number" id="g_sale_price" name="g_sale_price" min="0" />

    <label for="g_category">카테고리</label>
    <select id="g_category" name="g_category" required>
        <option value="">선택하세요</option>
        <option value="1">신선식품</option>
        <option value="2">가공식품</option>
        <option value="3">생활용품</option>
        <option value="4">패션잡화</option>
        <option value="5">지역특산물</option>
    </select>

    <label for="g_credate">입고일</label>
    <input type="date" id="g_credate" name="g_credate" required />

    <label for="g_manufactured_date">제조일자</label>
    <input type="date" id="g_manufactured_date" name="g_manufactured_date" />

    <label for="g_expiration_date">유통기한</label>
    <input type="date" id="g_expiration_date" name="g_expiration_date" />

    <label for="g_delivery_price">배송비 (0:무료배송)</label>
    <input type="number" id="g_delivery_price" name="g_delivery_price" min="0" required />

    <label for="g_delivery_duration">평균배송시간</label>
    <input type="text" id="g_delivery_duration" name="g_delivery_duration" />

    <label for="g_status">상품 상태</label>
    <select id="g_status" name="g_status" required>
        <option value="">선택하세요</option>
        <option value="1">판매중</option>
        <option value="2">품절</option>
        <option value="3">판매종료</option>
    </select>

    <label for="g_stock">재고</label>
    <input type="number" id="g_stock" name="g_stock" min="0" required />

    <div class="btn-group">
        <button type="submit" class="btn">등록</button>
        <a href="${contextPath}/goodsList.do" class="btn" style="background-color:#6c757d;">취소</a>
    </div>
</form>

</body>
</html>
