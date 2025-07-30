<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<div class="header_top">
	<div id="logo">
		<a href="${contextPath}/main/sijangbajiMain.do">
			<img width="176" height="80" alt="booktopia" src="${contextPath}/resources/image/lookmarketlogo.png">
		</a>
	</div>
	<div id="head_link">
		<ul>
			<c:choose>
     			<c:when test="${isLogOn==true and not empty memberInfo }">
			   		<li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			   		<li><a href="${contextPath}/mypage/mypageInfo.do">마이페이지</a></li>
			   		<li><a href="${contextPath}/cart/myCartList.do">장바구니</a></li>
			   		<li><a href="#">주문배송</a></li>
			 	</c:when>
			 	<c:otherwise>
			   		<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			   		<li><a href="${contextPath}/member/memberForm.do">회원가입</a></li> 
			 	</c:otherwise>
			</c:choose>
			<li><a href="${contextPath}/chatbot/chatbot.do">고객센터</a></li>
			<c:if test="${isLogOn==true and memberInfo.m_role == 3 }">  
	   	   		<li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
	    	</c:if>
		</ul>
	</div>
</div>

<br>
<nav class="main-nav">
	<ul class="nav-menu">
		<li><a href="${contextPath}/sijangbajo/sijangSearch/search.do">전통시장 찾기</a></li>
		<li><a href="${contextPath}/sijangbajo/nearby/nearby.do">주변상권 정보</a></li>
		<li><a href="${contextPath}/event/promotionList.do">이벤트★</a></li>
		<li><a href="${contextPath}/sijangbajo/clean/clean.do">클린업체</a></li>
		<li><a href="${contextPath}/community/communityList.do">커뮤니티</a></li>
	</ul>
	<div class="search-box">
		<input type="text" placeholder="검색어를 입력하세요" />
		<button>🔍</button>
	</div>
</nav>
