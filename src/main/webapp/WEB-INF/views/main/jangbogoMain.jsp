<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>장보고 메인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    .quick-menu img {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 8px;
    }

    .quick-menu .col {
      text-align: center;
      font-size: 14px;
    }

    .product-card img {
      height: 150px;
      object-fit: cover;
    }

    .product-card {
      border: 1px solid #eee;
      padding: 10px;
      border-radius: 8px;
    }

    .tab-button {
      margin-right: 10px;
    }
  </style>
</head>
<body>

<div class="container mt-4">
  <!-- 1. 슬라이드 배너 -->
  <div id="mainCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="${contextPath}/resources/image/main1.jpg" class="d-block w-100" alt="..." />
      </div>
      <div class="carousel-item">
        <img src="${contextPath}/resources/image/main2.jpg" class="d-block w-100" alt="..." />
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>

  <!-- 2. 원형 퀵메뉴 -->
  <div class="row quick-menu mb-5">
    <div class="col"><img src="${contextPath}/resources/image/quick1.png" /><div>신선식품</div></div>
    <div class="col"><img src="${contextPath}/resources/image/quick2.png" /><div>가공식품</div></div>
    <div class="col"><img src="${contextPath}/resources/image/quick3.png" /><div>생활용품</div></div>
    <div class="col"><img src="${contextPath}/resources/image/quick4.png" /><div>패션잡화</div></div>
    <div class="col"><img src="${contextPath}/resources/image/quick5.png" /><div>지역특산물</div></div>
  </div>

  <!-- 3. 실시간 인기상품 -->
  <h5>실시간 인기상품</h5>
  <div class="row row-cols-2 row-cols-md-4 g-3 mb-5">
    <c:forEach var="item" items="${popularList}">
      <div class="col">
        <div class="product-card">
          <img src="${contextPath}/resources/image/${item.img}" class="w-100" />
          <div class="mt-2">${item.name}</div>
          <div class="text-danger fw-bold">${item.price}원</div>
        </div>
      </div>
    </c:forEach>
  </div>

  <!-- 4. 타임세일 -->
  <h5>타임세일 <span class="text-muted">| 매일 오전 10시</span></h5>
  <div class="mb-3">
    <button class="btn btn-outline-primary btn-sm tab-button">오늘</button>
    <button class="btn btn-outline-secondary btn-sm tab-button">수요일</button>
    <button class="btn btn-outline-secondary btn-sm tab-button">금요일</button>
    <!-- 필요시 요일 추가 -->
  </div>
  <div class="row row-cols-2 row-cols-md-4 g-3">
    <c:forEach var="item" items="${timeSaleList}">
      <div class="col">
        <div class="product-card">
          <img src="${contextPath}/resources/image/${item.img}" class="w-100" />
          <div class="mt-2">${item.name}</div>
          <div class="text-danger fw-bold">${item.salePrice}원</div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</body>
</html>
