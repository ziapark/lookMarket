<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="content" style="padding: 20px;">
<h2>가공식품</h2>
<p>든든한 밥상과 간편한 한끼를 위한 제품 모음!</p>
<div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/ham.jpg" class="card-img-top" alt="햄">
            <div class="card-body">
                <h5 class="card-title">슬라이스 햄 200g</h5>
                <p class="card-text">₩4,800</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/진라면매운맛.jpg" class="card-img-top" alt="라면">
            <div class="card-body">
                <h5 class="card-title">진라면 매운맛 (5입)</h5>
                <p class="card-text">₩3,200</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/corn.jpg" class="card-img-top" alt="통조림">
            <div class="card-body">
                <h5 class="card-title">옥수수 통조림 340g</h5>
                <p class="card-text">₩2,300</p>
            </div>
        </div>
    </div>
</div>
</div>