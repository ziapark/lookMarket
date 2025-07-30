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
<nav class="main-nav navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavDropdown" aria-controls="mainNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNavDropdown">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <!-- 전통시장 찾기 -->
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/sijangbajo/sijangSearch/search.do">전통시장 찾기</a>
        </li>

        <!-- 주변상권 정보 (드롭다운) -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="nearbyDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            주변상권 정보
          </a>
          <ul class="dropdown-menu" aria-labelledby="nearbyDropdown">
            <li><a class="dropdown-item" href="${contextPath}/sijangbajo/nearby/nearby.do">주변상권 목록</a></li>
            <li><a class="dropdown-item" href="${contextPath}/sijangbajo/nearby/recommendCourse.do">나만의 추천코스</a></li>
          </ul>
        </li>

        <!-- 이벤트★ (드롭다운) -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="eventDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            이벤트★
          </a>
          <ul class="dropdown-menu" aria-labelledby="eventDropdown">
            <li><a class="dropdown-item" href="${contextPath}/event/promotionList.do">프로모션 목록</a></li>
            <li><a class="dropdown-item" href="${contextPath}/event/todayRecommend.do">오늘의 추천시장</a></li>
          </ul>
        </li>

        <!-- 클린업체 -->
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/sijangbajo/clean/clean.do">클린업체</a>
        </li>

        <!-- 커뮤니티 (드롭다운) -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            커뮤니티
          </a>
          <ul class="dropdown-menu" aria-labelledby="communityDropdown">
            <li><a class="dropdown-item" href="${contextPath}/community/communityList.do">커뮤니티 리뷰목록</a></li>
            <li><a class="dropdown-item" href="${contextPath}/community/writeReview.do">리뷰 작성</a></li>
          </ul>
        </li>

      </ul>

      <form class="d-flex" role="search" action="${contextPath}/search" method="get">
        <input class="form-control me-2" type="search" name="q" placeholder="검색어를 입력하세요" aria-label="검색" />
        <button class="btn btn-outline-success" type="submit">🔍</button>
      </form>
    </div>
  </div>
</nav>

