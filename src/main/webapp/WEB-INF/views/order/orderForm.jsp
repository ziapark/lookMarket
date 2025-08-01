<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배송 정보 입력</title>
	<style>
		form {
			max-width: 500px;
			margin: auto;
		}
		label {
			display: block;
			margin-top: 15px;
		}
		input, textarea {
			width: 100%;
			padding: 8px;
			box-sizing: border-box;
		}
		button {
			margin-top: 20px;
			padding: 10px;
			width: 100%;
			background-color: #4CAF50;
			color: white;
			border: none;
		}
	</style>
</head>
<body>
	<h2 style="text-align:center;">배송 정보 입력</h2>

	<form action="${contextPath}/submitOrder.jsp" method="post">
		<!-- 로그인된 사용자 ID (세션에서 가져온다고 가정) -->
		<input type="hidden" name="m_id" value="${sessionScope.m_id}" />
		
		<!-- 주문일자 자동 지정 -->
		<input type="hidden" name="oi_date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" />

		<label for="oi_name">주문자 이름</label>
		<input type="text" id="oi_name" name="oi_name" required />

		<label for="oi_receiver_name">수령자 이름</label>
		<input type="text" id="oi_receiver_name" name="oi_receiver_name" required />

		<label for="oi_receiver_phone">수령자 휴대폰번호</label>
		<input type="tel" id="oi_receiver_phone" name="oi_receiver_phone" pattern="[0-9]{10,12}" required />

		<label for="oi_delivery_address">배송 주소</label>
		<input type="text" id="oi_delivery_address" name="oi_delivery_address" required />

		<label for="oi_delivery_message">배송 메시지</label>
		<textarea id="oi_delivery_message" name="oi_delivery_message" rows="3" placeholder="예: 부재 시 문 앞에 놓아주세요."></textarea>

		<label for="oi_total_goods_price">총 상품 금액</label>
		<input type="number" id="oi_total_goods_price" name="oi_total_goods_price" required />

		<label for="oi_sale_price">할인 금액</label>
		<input type="number" id="oi_sale_price" name="oi_sale_price" value="0" />

		<label for="oi_delivery_price">배송비</label>
		<input type="number" id="oi_delivery_price" name="oi_delivery_price" value="3000" />

		<button type="submit">주문하기</button>
	</form>
</body>
</html>
