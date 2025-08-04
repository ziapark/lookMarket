<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>주문정보 입력</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
      padding: 20px;
    }
    .order-form {
      max-width: 600px;
      margin: auto;
      background: #fff;
      border: 1px solid #ddd;
      padding: 20px;
      border-radius: 6px;
    }
    .order-form h2 {
      margin-top: 0;
      font-size: 20px;
      margin-bottom: 15px;
    }
    .order-form label {
      display: block;
      margin-top: 10px;
      font-weight: bold;
    }
    .order-form input[type="text"],
    .order-form input[type="email"],
    .order-form input[type="number"],
    .order-form textarea {
      width: 100%;
      padding: 8px;
      margin-top: 4px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    .order-form .zip-row {
      display: flex;
      gap: 10px;
    }
    .order-form .zip-row input {
      flex: 1;
    }
    .order-form .zip-row button {
      flex-shrink: 0;
      background: #00aaff;
      color: #fff;
      border: none;
      padding: 8px 12px;
      border-radius: 4px;
      cursor: pointer;
    }
    .order-form .zip-row button:hover {
      background: #0077aa;
    }
    .order-form button.submit-btn {
      margin-top: 20px;
      background: #007bff;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }
    .order-form button.submit-btn:hover {
      background: #0056b3;
    }
  </style>
</head>
<body>

  <form class="order-form" action="/saveOrderInfo" method="post">
    <h2>주문정보 입력</h2>

    <!-- 주문자 이름 -->
    <label for="oi_name">주문자 이름</label>
    <input type="text" id="oi_name" name="oi_name" placeholder="주문자 이름">

    <!-- 수령자 이름 -->
    <label for="oi_receiver_name">수령자 이름</label>
    <input type="text" id="oi_receiver_name" name="oi_receiver_name" placeholder="수령자 이름">

    <!-- 수령자 연락처 -->
    <label for="oi_receiver_phone">수령자 연락처</label>
    <input type="text" id="oi_receiver_phone" name="oi_receiver_phone" placeholder="예: 01012345678">
    
     <!-- 수령자 이메일 -->
    <label for="oi_email">수령자 이메일</label>
    <input type="email" id="oi_email" name="oi_email" placeholder="예: example@email.com">

    <!-- 우편번호 + 주소찾기 -->
    <label>우편번호</label>
    <div class="zip-row">
      <input type="text" id="zipcode" placeholder="우편번호">
      <button type="button" onclick="alert('주소찾기 기능을 구현하세요.')">주소찾기</button>
    </div>

    <!-- 배송주소 -->
    <label for="oi_delivery_address">배송주소</label>
    <input type="text" id="oi_delivery_address" name="oi_delivery_address" placeholder="배송주소 입력">

    <!-- 배송메시지 -->
    <label for="oi_delivery_message">배송메시지</label>
    <textarea id="oi_delivery_message" name="oi_delivery_message" rows="3" placeholder="예: 안전하게 배송해주세요."></textarea>

    <button type="submit" class="submit-btn">저장하기</button>
  </form>

</body>
</html>

