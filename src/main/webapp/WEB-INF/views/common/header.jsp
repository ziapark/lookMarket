<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lookmarket</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
	<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
	<!-- Bootstrap JS (Popper 포함된 번들) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-JfgaE1kdPVuVOxXjHqvwSl7aYYb0i/xkJr8y5MvHqP7mFaBO9P+j8G4yf62MfT2M" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	

<script>
$(document).ready(function() {
	  $('.dropdown-toggle').click(function(e) {
	    e.preventDefault();
	    e.stopPropagation();

	    var $menu = $(this).siblings('.dropdown-menu');
	    $('.dropdown-menu').not($menu).slideUp(200);
	    $menu.slideToggle(200);
	  });

	  $('.dropdown-menu').click(function(e) {
	    e.stopPropagation();
	  });

	  $(document).click(function(e) {
	    $('.dropdown-menu').slideUp(200);
	  });
	});

</script>

	<style>
.dropdown-menu {
  display: none;
  position: absolute; /* 드롭다운이 아래로 뜨게 */
  background: white;
  list-style: none;
  padding: 0;
  margin: 0;
  border: 1px solid #ccc;
  min-width: 150px;
  z-index: 1000;
}

.nav-item {
  position: relative; /* 드롭다운 메뉴가 이 아이템 기준으로 위치하게 */
}

.dropdown-menu li {
  padding: 8px 12px;
}

.dropdown-menu li a {
  color: black;
  text-decoration: none;
}

.dropdown-menu li:hover {
  background-color: #eee;
}
</style>
</head>
<body>
<div class="header_top">
    <div id="logo">
        <c:choose>
            <c:when test="${pageType eq 'sijangbajo'}">
                <a href="${contextPath}/main/sijangbajoMain.do">
                    <img width="176" height="80" alt="시장봐조" src="${contextPath}/resources/image/lookmarketlogo.png" />
                </a>
            </c:when>
            <c:when test="${pageType eq 'jangbogo'}">
                <a href="${contextPath}/main/jangbogoMain.do">
                    <img width="176" height="80" alt="장보고" src="${contextPath}/resources/image/jangbogologo.png" />
                </a>
            </c:when>
        </c:choose>
    </div>

    <!-- 로그인/로그아웃 영역은 공통으로 유지 -->
    <div id="head_link">
        <ul>
            <c:choose>
                <c:when test="${isLogOn eq true and not empty memberInfo}">
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
            <c:if test="${isLogOn eq true and memberInfo.m_role == 3}">
                <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
            </c:if>
        </ul>
    </div>
</div>

<!-- nav 메뉴도 분기 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
    <!-- ✅ 이 버튼이 빠지면 드롭다운이 동작하지 않을 수 있음 -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavDropdown" aria-controls="mainNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="mainNavDropdown">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <c:choose>
                    <c:when test="${pageType eq 'sijangbajo'}">
                        <!-- 시장봐조 nav 메뉴 -->
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/sijangbajo/sijangSearch/search.do">전통시장 찾기</a></li>
                        <!-- 주변상권 정보 (드롭다운) -->
        				<li class="nav-item dropdown">
         					 <a class="nav-link dropdown-toggle" href="#" id="nearbyDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">주변상권 정보</a>
          					<ul class="dropdown-menu" aria-labelledby="nearbyDropdown">
           						<li><a class="dropdown-item" href="${contextPath}/sijangbajo/nearby/nearby.do">주변상권 목록</a></li>
            					<li><a class="dropdown-item" href="${contextPath}/sijangbajo/nearby/recommendCourse.do">나만의 추천코스</a></li>
          					</ul>
        					</li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">이벤트★</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${contextPath}/event/promotionList.do?pageType=sijangbajo">프로모션 목록</a></li>
                                <li><a class="dropdown-item" href="${contextPath}/event/todayRecommend.do">오늘의 추천시장</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/sijangbajo/clean/clean.do">클린업체</a></li>
                        <!-- 커뮤니티 (드롭다운) -->
        				<li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
          					<ul class="dropdown-menu" aria-labelledby="communityDropdown">
            			<li><a class="dropdown-item" href="${contextPath}/community/communityList.do">커뮤니티 리뷰목록</a></li>
            			<li><a class="dropdown-item" href="${contextPath}/community/communityAddForm.do">리뷰 작성</a></li>
            			<li><a class="dropdown-item" href="${contextPath}/community/communityUpdateForm.do">리뷰 수정</a></li>
          				</ul>
       				 	</li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/main/jangbogoMain.do">장보고</li>
                        <!-- 추가 메뉴 필요 시 여기에 -->
                    </c:when>

                    <c:when test="${pageType eq 'jangbogo'}">
                        <!-- 장보고 nav 메뉴 -->
                        <li class="nav-item dropdown">
    						<a class="nav-link dropdown-toggle" href="#" id="categoryDropdown" data-bs-toggle="dropdown" >카테고리</a>
    						<ul class="dropdown-menu" aria-labelledby="categoryDropdown">
        						<li><a class="dropdown-item" href="${contextPath}/jangbogo/goodsList.do?category=fresh">신선식품</a></li>
        						<li><a class="dropdown-item" href="${contextPath}/jangbogo/goodsList.do?category=processed">가공식품</a></li>
        						<li><a class="dropdown-item" href="${contextPath}/jangbogo/goodsList.do?category=living">생활용품</a></li>
        						<li><a class="dropdown-item" href="${contextPath}/jangbogo/goodsList.do?category=fashion">패션잡화</a></li>
        						<li><a class="dropdown-item" href="${contextPath}/jangbogo/goodsList.do?category=local">지역특산물</a></li>
    						</ul>
    					</li>

                        <li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
                        
                        <li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>     
                        <!-- 추가 메뉴 필요 시 여기에 -->
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/main/sijangbajoMain.do">시장봐조</a></li>
                    </c:when>
                </c:choose>
            </ul>

            <!-- 공통 검색창 -->
            <form class="d-flex" role="search" action="${contextPath}/search" method="get">
                <input class="form-control me-2" type="search" name="q" placeholder="검색어를 입력하세요" />
                <button class="btn btn-outline-success" type="submit">🔍</button>
            </form>
        </div>
    </div>
</nav>
</body>
</html>