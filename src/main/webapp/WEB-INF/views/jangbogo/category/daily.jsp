<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="content" style="padding: 20px;">
    <h2>생활용품</h2>
<p>집안 곳곳 필요한 생활 필수템!</p>
<div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/tissue.jpg" class="card-img-top" alt="물티슈">
            <div class="card-body">
                <h5 class="card-title">물티슈 100매 x 10팩</h5>
                <p class="card-text">₩8,900</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/sponge.jpg" class="card-img-top" alt="수세미">
            <div class="card-body">
                <h5 class="card-title">항균 수세미 5개입</h5>
                <p class="card-text">₩3,500</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/foil.jpg" class="card-img-top" alt="쿠킹호일">
            <div class="card-body">
                <h5 class="card-title">쿠킹호일 30M</h5>
                <p class="card-text">₩2,000</p>
            </div>
        </div>
    </div>
</div>
</div>

