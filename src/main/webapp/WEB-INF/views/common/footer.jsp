<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>footer</title>
</head>
<body>
	<footer>
		<div>
			<ul>
				<li><a href="#">시장소개</a></li>
				<li><a href="#">이용안내</a></li>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">클린업체소개</a></li>
				<li><a href="#">고객의소리</a></li>
				<li><a href="#">고객만족센터</a></li>
				<li class="no_line"><a href="#">찾아오시는길</a></li>
			</ul>
		</div>
		
	    <c:choose>
	        <c:when test="${viewName eq '/main/jangbogoMain'}">
	            <a href="#"><img width="147px" height="62px" alt="jangbogologo" src="${contextPath}/resources/image/jangbogologo.png" /></a>
	        </c:when>
	        <c:otherwise>
	            <a href="#"><img width="147px" height="62px" alt="lookmarketlogo" src="${contextPath}/resources/image/lookmarketlogo.png" /></a>
	        </c:otherwise>
	    </c:choose>
	
		<div style="padding-left:200px">
		 	㈜시장봐조 <br>
		 	대표이사: 조시장   <br>
		 	주소 : 우편번호 03133 서울시 종로구 종로3 <br>  
		 	사업자등록번호 : 123-45-11111 <br>
		 	대전광역시 통신판매업신고번호 : 제 111호 ▶사업자정보확인   개인정보보호최고책임자 : 조길동 soyoon3333@naver.com <br>
		 	대표전화 : 1544-1544 (발신자 부담전화)   팩스 : 0502-977-7777 (지역번호공통) <br>
		 	COPYRIGHT(C) lookMarket 전통시장 사랑방. 모두의 장터, 함께하는 이야기.
		</div>
	</footer>
</body>
</html>