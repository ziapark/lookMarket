<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>side</title>
</head>
<body>
	<nav>
		<ul>
			<c:choose>
				<c:when test="${sideMenu == 'hidden'}">
				</c:when>
				<c:when test="${sideMenu == 'reveal'}">
					<c:choose>
						<c:when test="${sideMenu_option == 'myPage'}">
							<li>
								<h3>마이페이지</h3>
								<ul>
									<li><a href="${contextPath}/mypage/mypageInfo.do">내정보</a></li>
									<li><a href="${contextPath}/mypage/myCartList.do">장바구니</a></li>
									<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역</a></li>
									<li><a href="#">배송조회</a></li>
									<li><a href="${contextPath}/mypage/myWishList.do">찜목록</a></li>
									<li><a href="${contextPath}/mypage/myCommunity.do">커뮤니티</a></li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</c:when>
			</c:choose>
		</ul>
	</nav>
</body>
</html>