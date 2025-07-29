<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="content" style="padding: 20px;">
    <h2>신선식품</h2>
    <p>신선한 식재료를 만나보세요.</p>

    <!-- 샘플 상품 카드 -->
    <div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
        <div class="col">
            <div class="card h-100">
                <img src="${contextPath}/resources/image/sample1.jpg" class="card-img-top" alt="사과">
                <div class="card-body">
                    <h5 class="card-title">청송 사과 3kg</h5>
                    <p class="card-text">₩15,000</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="${contextPath}/resources/image/sample2.jpg" class="card-img-top" alt="상추">
                <div class="card-body">
                    <h5 class="card-title">유기농 상추 1봉</h5>
                    <p class="card-text">₩2,500</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="${contextPath}/resources/image/sample3.jpg" class="card-img-top" alt="달걀">
                <div class="card-body">
                    <h5 class="card-title">무항생제 달걀 15구</h5>
                    <p class="card-text">₩6,900</p>
                </div>
            </div>
        </div>
    </div>
</div>


